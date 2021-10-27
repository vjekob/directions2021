page 50105 "CICD Book Cover Part"
{
    Caption = 'Book Cover';
    PageType = CardPart;

    layout
    {
        area(Content)
        {
            usercontrol(Cover; "CICD Cover")
            {
                ApplicationArea = All;

                trigger OnReady()
                begin
                    CoverReady := true;
                    CurrPage.Cover.ShowCover(LastISBN);
                end;
            }
        }
    }

    var
        CoverReady: Boolean;
        LastISBN: Text;

    procedure ShowCover(ISBN: Text)
    begin
        LastISBN := ISBN;
        if not CoverReady then
            exit;

        CurrPage.Cover.ShowCover(ISBN);
    end;

    procedure ClearCover()
    begin
        if not CoverReady then
            exit;

        ShowCover('');
    end;
}
