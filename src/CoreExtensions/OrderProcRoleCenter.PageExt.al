pageextension 50102 "CICD Order Proc. Role Center" extends "Order Processor Role Center"
{
    actions
    {
        addafter(Items)
        {
            action(Books)
            {
                Caption = 'Books';
                RunObject = page "CICD Book List";
                ApplicationArea = All;
            }
        }
    }
}
