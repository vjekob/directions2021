codeunit 50102 "CICD Book Lookup Controller"
{
    procedure LookupByISBN(ISBN: Text; BookLookup: Interface "CICD IBookLookup"; var Book: Codeunit "CICD Book"): Boolean;
    begin
        exit(BookLookup.LookupByISBN(ISBN, Book));
    end;
}
