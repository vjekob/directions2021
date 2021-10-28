page 50102 "CICD Book Card"
{
    Caption = 'Book Card';
    PageType = Card;
    SourceTable = "CICD Book";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(ISBN; Rec.ISBN)
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    var
                        BookLookupController: Codeunit "CICD Book Lookup Controller";
                        BookLookup: Codeunit "CICD Book Lookup";
                        Book: Codeunit "CICD Book";
                        Token: JsonToken;
                        Author: Record "CICD Author";
                    begin
                        if BookLookupController.LookupByISBN(Rec.ISBN, BookLookup, Book) then begin
                            Author.GetAuthorByName(Book.Author());
                            Rec.Validate("Author Code", Author.Code);
                            Rec.Validate(Title, Book.Title());
                        end;
                    end;
                }

                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
            }

            group(Details)
            {
                Caption = 'Details';


                field(Title; Rec.Title)
                {
                    ApplicationArea = All;
                }

                group(Author)
                {
                    Caption = 'Author';

                    field("Author Code"; Rec."Author Code")
                    {
                        ApplicationArea = All;

                        trigger OnValidate()
                        begin
                            CurrPage.Update();
                        end;
                    }

                    field("Author Name"; Rec."Author Name")
                    {
                        ApplicationArea = All;
                    }
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
