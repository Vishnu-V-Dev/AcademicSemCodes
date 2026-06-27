// PassOne Linker Loader Algorithm

Get PROGADDAR from OS
CSADDR = PROGADDAR
while not end of input do 
{
    Read the next input record
    CSLTHL = control section length
    Search ESTAB for control section name
    
    If found then
        Set error flag
    Else
        Enter control section name CSADDR into ESTAB
        
    while record_type != 'E' do
    {
        Read the next input record
        If record_type = 'D' then
        {
            For each symbol in the record do
            {
                Searrch ESTAB for symbol name
                
                If found then
                    Set error flag
                else
                    Enter the symbol and (CSADDR + indicated address into ESTAB)
            }
        }
    }
    CSADDR = CSADDR + CSLTHL
}
