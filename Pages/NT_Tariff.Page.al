page 70551 "NT Tariff"
{
    // version NTC1.00

    // 
    // ***************************************
    // **  Nanotec Electronic GmbH & Co. KG **
    // ***************************************
    // No.     Date(dd-mm-jj)  Dev     ToDo        Description
    // --------------------------------------------------------------------------------
    // 001     08.12.2017      MG      ISD-433     create

    CaptionML = DEU = 'Zolltarifnummern',
                ENU = 'Tariff No.';
    //DeleteAllowed = true;
    //InsertAllowed = true;
    //Editable = true;
    PageType = ListPart;
    Permissions = TableData "NT Tariff No." = r,
                  TableData "NT Tariff No. Setup" = r;
    ShowFilter = true;
    SourceTable = "NT Tariff No.";

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                Caption = 'Tariff Nos.';
                field("Item No."; "Item No.")
                {
                    ApplicationArea = All;
                    Caption = 'Item No.';
                    ToolTipML = DEU = 'Artikel Nr.',
                                ENU = 'Item No.';
                }
                field(Region; Region)
                {
                    ApplicationArea = All;
                    Caption = 'Region';
                    ToolTipML = DEU = 'Land/Region',
                                ENU = 'Region';
                }
                field("Tariff No. Related"; "Tariff No. Related")
                {
                    ApplicationArea = All;
                    CaptionML = DEU = 'Zollpos.Nr.',
                                ENU = 'Tariff No.';
                    Editable = false;
                }
                field(Explanation; Explanation)
                {
                    ApplicationArea = All;
                    CaptionML = DEU = 'Erklärung',
                                ENU = 'Explanation';
                    Editable = true;
                }
                field(Link; Link)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies a description of the item.';
                }
                field(Comment; Comment)
                {
                    ApplicationArea = All;
                    CaptionML = DEU = 'Bemerkung',
                                ENU = 'Comment';
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
                    LookUpTariff("Item No.");
                end;
            }
        }
    }
}

