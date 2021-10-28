interface "CICD IBookLookup"
{
    procedure LookupByISBN(ISBN: Code[13]; var Book: Codeunit "CICD Book"): Boolean;
}
