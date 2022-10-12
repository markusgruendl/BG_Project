pageextension 70551 "UserSetupTariff" extends "User Setup"
{
    layout
    {
        addlast(Control1)
        {
            field("Release Tariff No."; "Release Tariff No.")
            {
                ApplicationArea = All;
                Caption = 'Release Tariff No.';
            }
        }
    }
}