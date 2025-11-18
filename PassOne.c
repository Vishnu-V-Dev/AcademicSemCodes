Algorithm pass 1 {

    Read the input line 
    If OPCODE = 'START' {

        starting address = #[OPERAND]
        LOCCTR = starting address
        Write line to intermediate file
        Read next input line 
    }
    Else {
        LOCCTR = 0

        While OPCODE != 'END' do {

            Write line to intermediate file along with LOCCTR
            If this is not a comment line {
                If there is a symbol in the label field {
                    Search SYMTAB for label 
                    If found
                        Set error flag(Duplicate Symbol)
                    Else
                        Insert(LABEL,LOCCTR) into SYMTAB
                }
                Search OPTAB for OPCODE
                If found
                    LOCCTR = LOCCTR + 3
                Else if LOCCTR = 'WORD'
                    LOCCTR = LOCCTR + 3
                Else if LOCCTR = 'RESW'
                    LOCCTR = LOCCTR + 3 * #[OPERAND]
                Else if LOCCTR = 'RESB'
                    LOCCTR = LOCCTR + #[OPERAND]
                Else if LOCCTR = 'BYTE'
                    LOCCTR = LOCCTR + length of constant in bytes
                Else
                    Set error flags
            }
            Write line to intermediate file
            Read next input line
        }
        write last line to intermediate file
        save (LOCCTR - starting address) as program length
    }
}
