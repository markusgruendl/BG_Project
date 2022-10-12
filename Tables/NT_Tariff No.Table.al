table 70551 "NT Tariff No."
{
    // version NTC1.00

    // 
    // ***************************************
    // **  Nanotec Electronic GmbH & Co. KG **
    // ***************************************
    // No.     Date(dd-mm-jj)  Dev     ToDo        Description
    // --------------------------------------------------------------------------------
    // 001     26.01.2018      MG      ISD-433     created

    DataPerCompany = false;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            CaptionML = DEU = 'Artikel Nr.',
                        ENU = 'Item No.';
            TableRelation = Item."No.";
        }
        field(2; Region; Code[10])
        {
            CaptionML = DEU = 'Land/Region',
                        ENU = 'Country/Region';
        }
        field(3; "Tariff No. Related"; Code[30])
        {
            CaptionML = DEU = 'Zollpos. zugeordnet',
                        ENU = 'Tariff No. Related';

            trigger OnValidate();
            var
                rec_TariffNoNTC: Record "NT Tariff No.";
            begin
            end;
        }
        field(4; Explanation; Text[250])
        {
            CaptionML = DEU = 'Erklärung',
                        ENU = 'Explanation';
            FieldClass = Normal;
        }
        field(5; Link; Text[150])
        {
            ExtendedDatatype = URL;
        }
        field(6; Comment; Text[250])
        {
            CaptionML = DEU = 'Bemerkung',
                        ENU = 'Comment';
        }
    }

    keys
    {
        key(Key1; "Item No.", Region, "Tariff No. Related")
        {
        }
        key(Key2; "Tariff No. Related", "Item No.", Region)
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Tariff No. Related", "Item No.", Region)
        {
        }
    }

    procedure GetTariffNo(param_ItemNo: Code[20]; param_Region: Code[3]) TariffNumber: Code[20];
    var
        rec_TariffNo: Record "NT Tariff No.";
    begin
        rec_TariffNo.RESET;
        rec_TariffNo.SETRANGE("Item No.", param_ItemNo);
        IF (param_Region IN ['MX', 'CA', 'US']) THEN
            rec_TariffNo.SETRANGE(Region, 'US')
        ELSE
            rec_TariffNo.SETRANGE(Region, 'EU');
        IF (rec_TariffNo.FINDFIRST) THEN
            EXIT(rec_TariffNo."Tariff No. Related");
        EXIT;
    end;

    procedure LookUpTariff(param_ItemNo: Code[20]);
    var
        rec_TariffNoNTCSetup: Record "NT Tariff No. Setup";
        p_TariffNoNTCSetup: Page "NT Tariff No. Setup";
        rec_TariffNo: Record "NT Tariff No.";
    begin
        rec_TariffNoNTCSetup.RESET;
        p_TariffNoNTCSetup.SETRECORD(rec_TariffNoNTCSetup);
        p_TariffNoNTCSetup.SETTABLEVIEW(rec_TariffNoNTCSetup);
        p_TariffNoNTCSetup.LOOKUPMODE(TRUE);
        IF p_TariffNoNTCSetup.RUNMODAL = ACTION::LookupOK THEN BEGIN
            p_TariffNoNTCSetup.GETRECORD(rec_TariffNoNTCSetup);
            IF param_ItemNo <> '111AAA' THEN BEGIN
                rec_TariffNo.RESET;
                rec_TariffNo.INIT;
                rec_TariffNo.VALIDATE("Item No.", param_ItemNo);
                rec_TariffNo.VALIDATE(Region, 'US');
                rec_TariffNo."Tariff No. Related" := rec_TariffNoNTCSetup."US No.";
                rec_TariffNo.Explanation := rec_TariffNoNTCSetup."Explanation US";
                rec_TariffNo.Link := rec_TariffNoNTCSetup."US Link";
                rec_TariffNo.INSERT(TRUE);
            END;

            rec_TariffNo.RESET;
            rec_TariffNo.INIT;
            rec_TariffNo.VALIDATE("Item No.", param_ItemNo);
            rec_TariffNo.VALIDATE(Region, 'EU');
            rec_TariffNo."Tariff No. Related" := rec_TariffNoNTCSetup."EU No.";
            rec_TariffNo.Explanation := rec_TariffNoNTCSetup."Explanation EU";
            IF param_ItemNo <> '111AAA' THEN
                rec_TariffNo.Link := rec_TariffNoNTCSetup."EU Link";
            IF param_ItemNo = '111AAA' THEN
                rec_TariffNo.Comment := 'DEFAULT';
            rec_TariffNo.INSERT(TRUE);
        END;
    end;
}

