page 50103 "CICD Authors"
{
    Caption = 'Authors';
    PageType = List;
    SourceTable = "CICD Author";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(Authors)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }

                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
