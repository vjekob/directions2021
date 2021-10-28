codeunit 50103 "CICD Book Lookup v2" implements "CICD IBookLookup"
{
    local procedure PrepareRequest(ISBN: Code[13]; Request: HttpRequestMessage): Text
    var
        Headers: HttpHeaders;
        Json: JsonObject;
        Content: HttpContent;
        JsonAsText: Text;
    begin
        Request.GetHeaders(Headers);
        Headers.Clear();
        Headers.Add('x-functions-key', 'aehAD0U3ossWLcpFkswwGTTpCaOemUTcOKdM7ja83JoPxxT80undtA==');

        Content.Clear();
        Content.GetHeaders(Headers);
        Headers.Clear();
        Headers.Add('Content-Type', 'application/json');

        Json.Add('isbn', ISBN);
        Json.WriteTo(JsonAsText);
        Content.WriteFrom(JsonAsText);

        Request.SetRequestUri('https://webinar-cicd-isbn-v1.azurewebsites.net/api/lookUpISBNv2');
        Request.Method := 'POST';
        Request.Content := Content;
    end;

    procedure LookupByISBN(ISBN: Code[13]; var Book: Codeunit "CICD Book"): Boolean
    var
        Client: HttpClient;
        Request: HttpRequestMessage;
        Response: HttpResponseMessage;
        Content: Text;
        Json: JsonObject;
    begin
        PrepareRequest(ISBN, Request);
        if not Client.Send(Request, Response) then
            Error(GetLastErrorText);
        if not Response.IsSuccessStatusCode() then
            Error('Error %1', Response.HttpStatusCode);

        begin
            Response.Content.ReadAs(Content);
            Json.ReadFrom(Content);
            Book.FromJson(Json);
            exit(true);
        end;
    end;
}
