page 70558 "Tariff No. Lookup NTC"
{
    // version NTC1.00

    // 
    // ***************************************
    // **  Nanotec Electronic GmbH & Co. KG **
    // ***************************************
    // No.     Date(dd-mm-jj)  Dev     ToDo        Description
    // --------------------------------------------------------------------------------
    // 001     13.11.2019      MG                   create

    CaptionML = DEU = 'Zolltarifnummern',
                ENU = 'Tariff No.';
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    Permissions = TableData "NT Tariff No." = r,
                  TableData "NT Tariff No. Setup" = r;
    ShowFilter = true;
    SourceTable = "NT Tariff No.";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Tariff No. Related"; "Tariff No. Related")
                {
                    ApplicationArea = All;
                    CaptionML = DEU = 'Zollpos.Nr.',
                                ENU = 'Tariff No.';
                }

                field(Explanation; Explanation)
                {
                    ApplicationArea = All;
                    CaptionML = DEU = 'Erklärung',
                                ENU = 'Explanation';
                }
                field(Region; Region)
                {
                    ApplicationArea = All;
                    Caption = 'Region';
                    ToolTipML = DEU = 'Land/Region',
                                ENU = 'Region';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(InsertLines)
            {
                ApplicationArea = All;
                CaptionML = DEU = 'Neue Zolltarifnummern anlegen',
                            ENU = 'Insert new tariff nos.';
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                ToolTipML = DEU = 'Neue Zolltarifnummern anlegen',
                            ENU = 'Insert new tariff no.';

                trigger OnAction();
                begin
                    TESTFIELD(Region, '');
                    LookUpTariff("Item No.");
                end;
            }
        }
    }
}

