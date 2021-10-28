codeunit 50100 "CICD Book Lookup" implements "CICD IBookLookup"
{
    local procedure GetURL(ISBN: Code[13]): Text
    begin
        exit(StrSubstNo('https://webinar-cicd-isbn-v1.azurewebsites.net/api/lookUpISBNv1?isbn=%1', ISBN));
    end;

    procedure LookupByISBN(ISBN: Code[13]; var Book: Codeunit "CICD Book"): Boolean
    var
        Client: HttpClient;
        Response: HttpResponseMessage;
        Content: Text;
        Json: JsonObject;
    begin
        if Client.Get(GetURL(ISBN), Response) and Response.IsSuccessStatusCode() then begin
            Response.Content.ReadAs(Content);
            Json.ReadFrom(Content);
            Book.FromJson(Json);
            exit(true);
        end;
    end;
}
