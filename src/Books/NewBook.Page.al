page 50104 "CICD New Book"
{
    Caption = 'Create a book';
    PageType = NavigatePage;
    Extensible = false;

    layout
    {
        area(Content)
        {
            field(ISBN; ISBN)
            {
                Caption = 'ISBN';
                ApplicationArea = All;

                trigger OnValidate()
                var
                    BookLookupController: Codeunit "CICD Book Lookup Controller";
                    BookLookup: Codeunit "CICD Book Lookup";
                    Token: JsonToken;
                    Author: Record "CICD Author";
                begin
                    Clear(Book);
                    OKEnabled := BookLookupController.LookupByISBN(ISBN, BookLookup, Book);

                    if OKEnabled then
                        CurrPage.Cover.Page.ShowCover(ISBN)
                    else
                        CurrPage.Cover.Page.ClearCover();
                end;
            }

            field(Title; Book.Title())
            {
                ApplicationArea = All;
            }

            field(Author; Book.Author())
            {
                ApplicationArea = All;
            }

            part(Cover; "CICD Book Cover Part")
            {
                Caption = 'Cover';
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(OK)
            {
                Caption = 'OK';
                Enabled = OKEnabled;
                Visible = true;
                InFooterBar = true;
                ApplicationArea = All;


                trigger OnAction()
                begin
                    OK := true;
                    CurrPage.Close();
                end;
            }

            action(Cancel)
            {
                Caption = 'Cancel';
                Visible = true;
                Enabled = true;
                InFooterBar = true;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    CurrPage.Close();
                end;
            }
        }
    }

    var
        ISBN: Code[13];
        Book: Codeunit "CICD Book";
        OKEnabled: Boolean;
        OK: Boolean;

    procedure GetBook(var BookOut: Codeunit "CICD Book"): Boolean;
    begin
        BookOut := Book;
        exit(OK);
    end;
}
