//ONE PASS MACRO ALGO 

ONE_PASS_MACRO {
    EXPANDING = false
    While OPCODE != 'END' {
        
        GETLINE()
        PROCESSLINE()
    }
}

PROCESSLINE() {
    
    Search NAMETAB for OPCODE
    IF found then
        EXPAND()
    Else if OPCODE = 'MACRO' then
        DEFINE()
    Else
        Write source line to expanded file
        
}

DEFINE() {
    
    Enter macro name into NAMETAB 
    Enter macro prototype into DEFTAB
    LEVEL = 1 
    While LEVEL > 0 {
        
        GETLINE()
        If this is not a comment line {
            Substitute positional notation for parameters
            Enter line into DEFTAB
            If OPCODE = 'MACRO' LEVEL = LEVEL+1 
            Else If OPCODE = 'MEND' LEVEL = LEVEL-1
        }
    }
    Store in NAMETAB pointers to beginning and end of defenition
}

EXPAND() {
    
    EXPANDING = TRUE 
    Get prototype statement from DEFTAB
    set up arguments from macro invocation in ARGTAB
    While macro invocation to expand file as comment
    While not end of macro defenition {
        
        GETLINE()
        PROCESSLINE()
    }
    EXPANDING = FALSE 
}

GETLINE() {
    If EXPANDING {
     
     Get next line of macro defenition from DEFTAB
     Substitute arguments from ARGTAB for positional notation
    }
    Else Read next line from input file
}
