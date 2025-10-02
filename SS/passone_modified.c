#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void p1();
void display();

int main() {
    p1();
    return 0;
}

void p1() {
    int locctr, start, length;
    FILE *fp1 = fopen("input.txt", "r");
    FILE *fp2 = fopen("optab.txt", "r");
    FILE *fp3 = fopen("symtab.txt", "w");
    FILE *fp4 = fopen("intermediate.txt", "w");
    FILE *fp5 = fopen("length.txt", "w");

    char lab[10], opc[10], opr[10], code[10], mne[10];
    fscanf(fp1, "%s\t%s\t%s", lab, opc, opr);

    // Process the START statement
    if (strcmp(opc, "START") == 0) {
        start = atoi(opr);
        locctr = start;
        fprintf(fp4, "%s\t%s\t%s\n", lab, opc, opr);
        fscanf(fp1, "%s\t%s\t%s", lab, opc, opr);
    } else {
        locctr = 0;
    }

    // Process the program instructions
    while (strcmp(opc, "END") != 0) {
        fprintf(fp4, "%s\t%s\t%s\n", lab, opc, opr);
        if (strcmp(lab, "**") != 0) {
            fprintf(fp3, "%s\t%d\n", lab, locctr);
        }

        // Search for opcode in OPTAB
        int opcode_found = 0;
        while (fscanf(fp2, "%s\t%s", code, mne) != EOF) {
            if (strcmp(opc, code) == 0) {
                locctr += 3;
                opcode_found = 1;
                break;
            }
        }

        // If not found in OPTAB, handle special cases like WORD, RESW, RESB, BYTE
        if (!opcode_found) {
            if (strcmp(opc, "WORD") == 0) locctr += 3;
            else if (strcmp(opc, "RESW") == 0) locctr += 3 * atoi(opr);
            else if (strcmp(opc, "RESB") == 0) locctr += atoi(opr);
            else if (strcmp(opc, "BYTE") == 0) locctr++;
        }

        rewind(fp2); // Reset file pointer for next search
        fscanf(fp1, "%s\t%s\t%s", lab, opc, opr); // Read next instruction
    }

    fprintf(fp4, "%d\t%s\t%s\t%s\n", locctr, lab, opc, opr);
    length = locctr - start;

    fclose(fp1);
    fclose(fp2);
    fclose(fp3);
    fclose(fp4);
    fclose(fp5);

    display();
    fprintf(fp5, "%d", length);
    printf("\nThe length of the code is %d\n", length);
}

void display() {
    FILE *fp1 = fopen("input.txt", "r");
    FILE *fp2 = fopen("intermediate.txt", "r");
    FILE *fp3 = fopen("symtab.txt", "r");

    char str[256];

    // Display contents of input file
    printf("\nThe contents of Input Table:\n\n");
    while (fgets(str, sizeof(str), fp1)) {
        printf("%s", str);
    }
    fclose(fp1);

    // Display contents of intermediate file
    printf("\nThe contents of Intermediate Table:\n\n");
    while (fgets(str, sizeof(str), fp2)) {
        printf("%s", str);
    }
    fclose(fp2);

    // Display contents of symbol table
    printf("\nThe contents of Symbol Table:\n\n");
    while (fgets(str, sizeof(str), fp3)) {
        printf("%s", str);
    }
    fclose(fp3);
}
