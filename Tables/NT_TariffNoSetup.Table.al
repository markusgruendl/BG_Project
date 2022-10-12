table 70552 "NT Tariff No. Setup"
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

    CaptionML = DEU = 'Zolltarifnummern NTC Einrichtung',
                ENU = 'Tariff No. NTC Setup';
    DataPerCompany = false;

    fields
    {
        field(1; "EU No."; Code[30])
        {
            CaptionML = DEU = 'EU Nr.',
                        ENU = 'EU No.';
        }

        field(2; "Explanation EU"; Text[250])
        {
            CaptionML = DEU = 'Erläuterung EU',
                        ENU = 'Explanation EU';
        }
        field(3; "EU Link"; Text[250])
        {
            ExtendedDatatype = URL;
        }
        field(4; "US No."; Code[30])
        {
            CaptionML = DEU = 'US Nr.',
                        ENU = 'US No.';
        }
        field(5; "Explanation US"; Text[250])
        {
            CaptionML = DEU = 'Erläuterung US',
                        ENU = 'Explanation US';
        }
        field(6; "sample Part No. NANOTEC"; Text[100])
        {
            CaptionML = DEU = 'Bsp. Teilenr. NANOTEC',
                        ENU = 'sample Part No. NANOTEC';
        }
        field(7; "US Link"; Text[250])
        {
            ExtendedDatatype = URL;
        }
        field(8; Comment; Text[250])
        {
            CaptionML = DEU = 'Bemerkung',
                        ENU = 'Comment';
        }
        field(9; "Supplementary Units"; Boolean)
        {
            CaptionML = DEU = 'Besondere Maßeinheit',
                        ENU = 'Supplementary Units';
        }
        field(50; Released; Boolean)
        {
            CaptionML = DEU = 'Freigegeben',
                        ENU = 'Released';
            DataClassification = ToBeClassified;

            trigger OnValidate();
            var
                r_UserSetup: Record "User Setup";
                err001: TextConst DEU = 'Berechtigungen fehlen hierfür!', ENU = 'Permissions are missing for this!';
            begin
                r_UserSetup.GET(USERID);
                IF NOT r_UserSetup."Release Tariff No." THEN
                    ERROR(err001);
            end;
        }
    }

    keys
    {
        key(Key1; "EU No.", "US No.")
        {
        }
    }

    fieldgroups
    {
    }
}

