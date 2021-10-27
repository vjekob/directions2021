pageextension 50101 "CICD Item List" extends "Item List"
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
}
