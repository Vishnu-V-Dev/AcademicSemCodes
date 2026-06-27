// PassTwo Linker Loader Algorithm

CSADDR = PROGADDR
EXECADDR = PROGADDR
while not end of input do
{
    Read the next input record
    CSLTH = control section length
    While record_type != 'E' do
    {
        Read the next input record_type
        If record_type = 'T' then
        {
            If the object code is in character form then 
                Convert it into internal representation
            Move the object code from record to location(CSADDR + specified address) 
        }
        Else if record_type = 'M' then
        {
            Search ESTAB for modification symbol names
            If found then
                Add or sub the symbol value at location (CSADDR + specified address)
            Else
                Set error flag
        }
    }
    If an address is specified in End of record then
        EXECADDR = CSADDR + specified address
        CSADDR = CSADDR + CSLTH
}
jump to location given by EXECADDR to start executing of the program
