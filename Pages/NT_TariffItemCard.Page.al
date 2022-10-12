pageextension 70553 "TariffItemCard" extends "Item Card"
{
    layout
    {
        addafter(Item)
        {
            group("Zolltarifnummern")
            {
                part(NTTariff; "NT Tariff")
                {
                    ApplicationArea = All;
                    Caption = 'Item Tariff No.';
                    SubPageLink = "Item No." = field("No.");
                }
            }
        }
    }
}