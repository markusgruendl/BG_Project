enum 50000 "NT_Tax Exemption Type"
{
    Extensible = true;
    
    value(0; " ")
    {
        Caption = ' ';
    }
    value(1; Exemption)
    {
        Caption = 'Exemption';
    }
    value(2; "Partial Exemption")
    {
        Caption = 'Partial Exemption';
    }
}