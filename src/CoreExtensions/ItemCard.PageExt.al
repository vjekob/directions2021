pageextension 50103 "CICD Item Card" extends "Item Card"
{
    layout
    {
        addafter(Description)
        {
            field("Is Book"; Rec."Is Book")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addfirst(ItemActionGroup)
        {
            action(CreateBook)
            {
                Caption = 'Create Book';
                Promoted = true;
                PromotedCategory = Process;
                Image = LedgerBook;
                ApplicationArea = All;

                trigger OnAction()
                var
                    NewBook: Page "CICD New Book";
                    BookObj: Codeunit "CICD Book";
                    BookRec: Record "CICD Book";
                    Author: Record "CICD Author";
                begin
                    NewBook.RunModal();
                    if NewBook.GetBook(BookObj) then begin
                        BookRec.ISBN := BookObj.Isbn();
                        Author.GetAuthorByName(BookObj.Author());
                        BookRec."Author Code" := Author.Code;
                        BookRec.Title := BookObj.Title();
                        BookRec.Validate("Item No.", Rec."No.");
                        BookRec.Insert();
                    end;
                end;
            }
        }
    }
}
