page 50101 "CICD Book List"
{
    Caption = 'Book List';
    PageType = List;
    SourceTable = "CICD Book";
    Editable = false;
    CardPageId = "CICD Book Card";
    ApplicationArea = All;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(Books)
            {
                field(ISBN; Rec.ISBN)
                {
                    ApplicationArea = All;
                }

                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }

                field("Author Name"; Rec."Author Name")
                {
                    ApplicationArea = All;
                }
            }
        }

        area(FactBoxes)
        {
            part(Cover; "CICD Book Cover Part")
            {
                Caption = 'Cover';
                ApplicationArea = All;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.Cover.Page.ShowCover(Rec.ISBN);
    end;
}
