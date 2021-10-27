table 50101 "CICD Book"
{
    Caption = 'Book';
    LookupPageId = "CICD Book List";
    DrillDownPageId = "CICD Book List";
    DataClassification = CustomerContent;

    fields
    {
        field(1; "ISBN"; Code[13])
        {
            Caption = 'ISBN';
        }

        field(2; "Item No."; Code[20])
        {
            Caption = 'Item No.';
            TableRelation = Item;

            trigger OnValidate()
            begin
                ValidateISBN();
            end;
        }

        field(3; "Author Code"; Code[20])
        {
            Caption = 'Author Code';
            TableRelation = "CICD Author";
        }

        field(4; "Author Name"; Text[50])
        {
            Caption = 'Author Name';
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("CICD Author".Name where(Code = field("Author Code")));
        }

        field(5; Title; Text[250])
        {
            Caption = 'Title';
        }
    }

    local procedure ValidateISBN();
    var
        Item: Record Item;
        Book: Record "CICD Book";
        IsBook: Boolean;
        Found: Boolean;
    begin
        if Item.Get(xRec."Item No.") then begin
            Book.SetRange("Item No.", xRec."Item No.");
            Book.SetFilter(ISBN, '<>%1', xRec.ISBN);
            Found := Book.IsEmpty();
        end;

        if Item.Get(Rec."Item No.") then begin
            Found := true;
            IsBook := true;
        end;

        if not Found then
            exit;

        Item."Is Book" := IsBook;
        Item.Modify();
    end;
}
