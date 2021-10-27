table 50102 "CICD Author"
{
    Caption = 'Book';
    LookupPageId = "CICD Authors";
    DrillDownPageId = "CICD Authors";
    DataClassification = CustomerContent;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
        }

        field(2; Name; Text[50])
        {
            Caption = 'Name';
        }
    }

    procedure GetAuthorByName(AuthorName: Text)
    var
        AuthorCode: Code[20];
        Names: List of [Text];
    begin
        SetRange(Name, AuthorName);
        if Rec.FindFirst() then
            exit;

        Names := AuthorName.Split(' ');
        if Names.Count = 1 then begin
            AuthorCode := Names.Get(1);
        end;

        AuthorCode := Names.Get(2) + '.' + Names.Get(1);

        Rec.Reset();
        Rec.Init();
        Rec.Code := AuthorCode;
        Rec.Name := AuthorName;
        Rec.Insert();
    end;
}
