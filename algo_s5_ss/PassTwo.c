Algorithm_PASS_2 {
    
    Read the first input line from intermediate file
    If OPCODE = 'START' {
        Write the line into assembly listing
        Read next input line 
    }
    Write Header records to object program
    Initialize first Text record
    
    While OPCODE != 'END' do {
        
        If this is not a comment line {
            
            Search OPTAB for OPCODE
            If found {
                
                If there is a symbol in OPERAND field {
                    Search SYMTAB for operand
                    If found
                        Store symbol value as operand address
                    Else
                        Set error flag
                }
                Else 
                    Set 0 as operand address
                Assemble the object code instruction
                
            }
            Else if OPCODE = 'BYTE' or 'WORD'
                Convert constant to object code 
            If object code will not fit into the current Text record {
                
                Write Text record into object program
                Initialize new Text record 
            }
            Add object code to Text record 
        }
        Write into assembly listing along with object code
        Read next input line 
    }
    Write last Text record to object program
    Write End record to object program
    Write last listing line 
}
