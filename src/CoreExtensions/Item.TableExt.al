tableextension 50101 "CICD Item" extends Item
{
    fields
    {
        field(50100; "Is Book"; Boolean)
        {
            Caption = 'Is Book';
            Editable = false;
            DataClassification = CustomerContent;
        }
    }
}
