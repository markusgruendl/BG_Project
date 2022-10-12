page 70552 "NT Tariff No. Setup"
{
    // version NTC1.02

    // 
    // ***************************************
    // **  Nanotec Electronic GmbH & Co. KG **
    // ***************************************
    // No.     Date(dd-mm-jjjj)  Dev     ToDo          Description
    // --------------------------------------------------------------------------------
    // 001     13.06.2018        MG                    Create
    // 002     17.02.2022        MG      ISD-3027      add new field "Released"

    CaptionML = DEU = 'Zolltarif NTC Einrichtung',
                ENU = 'Tariff No. NTC Setup';
    PageType = List;
    SourceTable = "NT Tariff No. Setup";
    UsageCategory = Lists;
    ApplicationArea = All;
    AdditionalSearchTerms = 'zolltarif, zoll, tarif, tariff';
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("EU No."; "EU No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("Explanation EU"; "Explanation EU")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("EU Link"; "EU Link")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("US No."; "US No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("Explanation US"; "Explanation US")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("sample Part No. NANOTEC"; "sample Part No. NANOTEC")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("US Link"; "US Link")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field(Comment; Comment)
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field("Supplementary Units"; "Supplementary Units")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
                field(Released; Released)
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

