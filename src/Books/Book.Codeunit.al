codeunit 50101 "CICD Book"
{
    var
        _isbn: Code[13];
        _author: Text;
        _title: Text;

    local procedure GetToken(Json: JsonObject; Property: Text): JsonValue
    var
        Token: JsonToken;
    begin
        Json.Get(Property, Token);
        exit(Token.AsValue());
    end;

    procedure FromJson(Book: JsonObject)
    begin
        _isbn := GetToken(Book, 'isbn').AsText();
        _author := GetToken(Book, 'author').AsText();
        _title := GetToken(Book, 'title').AsText();
    end;

    procedure Isbn(): Code[13]
    begin
        exit(_isbn);
    end;

    procedure Author(): Text
    begin
        exit(_author);
    end;

    procedure Title(): Text
    begin
        exit(_title);
    end;
}
