Algorithm Pass1 {
	Read the input line
	If OPCODE='START' {
		starting address=#OPERAND
		LOCCTR=starting address
		Write line to intermediate file
		Read next input line
	}
	Else
		LOCCTR=0
	While OPCODE != 'END' do {
		If this is not a comment line {
			Write line to intermediate file along with LOCCTR
			
			If there is a symbol in the label field {
				Search SYMTAB for LABEL
				If found
					Set error flag(Duplicate Symbol)
				Else
					Insert(LABEL,LOCCTR) into SYMTAB
			}
			Search OPTAB for OPCODE
			If found
				LOCCTR=LOCCTR+3
			Else if OPCODE='WORD'
				LOCCTR=LOCCTR+3
			Else if OPCODE='RESW'
				LOCCTR=LOCCTR+3*#[OPERAND]
			Else if OPCODE='RESB'
				LOCCTR=LOCCTR+#[OPERAND]
			Else if OPCODE='BYTE'
				LOCCTR=LOCCTR+length of constant in bytes
			Else
				Set error flags
		}
		Read next input line
	}
	Write last line to intermediate file
	Save(LOCCTR-starting address)as program length.
}
