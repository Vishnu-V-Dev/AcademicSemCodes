#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void passTwo();

int main() {
    passTwo();
    return 0;
}

void passTwo() {
    FILE *intermediate, *optab, *symtab, *output;
    char label[20], opcode[20], operand[20];
    char optabOpcode[20], optabCode[20];
    char symtabLabel[20], symtabAddr[20];
    char address[20];

    intermediate = fopen("intermediate.txt", "r");
    optab = fopen("optab.txt", "r");
    symtab = fopen("symtab.txt", "r");
    output = fopen("output.txt", "w");

    if (!intermediate || !optab || !symtab || !output) {
        printf("Error opening file.\n");
        exit(1);
    }

    // Read first line (START)
    if (fscanf(intermediate, "%s %s %s", label, opcode, operand) == 3) {
        if (strcmp(opcode, "START") == 0) {
            fprintf(output, "%s\t%s\t%s\n", label, opcode, operand);
        }
    }

    // Process remaining lines
    while (fscanf(intermediate, "%s %s %s", label, opcode, operand) == 3) {
        int found = 0;
        strcpy(address, ""); // clear previous address

        // If END, print and stop processing
        if (strcmp(opcode, "END") == 0) {
            fprintf(output, "%s\t%s\t%s\t???\n", label, opcode, operand);
            break;
        }

        // Search OPTAB
        rewind(optab);
        while (fscanf(optab, "%s %s", optabOpcode, optabCode) != EOF) {
            if (strcmp(opcode, optabOpcode) == 0) {
                found = 1;

                // Search SYMTAB for operand
                rewind(symtab);
                while (fscanf(symtab, "%s %s", symtabLabel, symtabAddr) != EOF) {
                    if (strcmp(operand, symtabLabel) == 0) {
                        strcpy(address, symtabAddr);
                        break;
                    }
                }

                fprintf(output, "%s\t%s\t%s\t%s%s\n",
                        label, opcode, operand, optabCode, address);
                break;
            }
        }

        if (!found) {
            // Directives
            if (strcmp(opcode, "RESW") == 0 || strcmp(opcode, "RESB") == 0) {
                fprintf(output, "%s\t%s\t%s\t???\n", label, opcode, operand);
            } else if (strcmp(opcode, "WORD") == 0 || strcmp(opcode, "BYTE") == 0) {
                fprintf(output, "%s\t%s\t%s\t???\n", label, opcode, operand);
            } else {
                // Unknown opcode
                fprintf(output, "%s\t%s\t%s\t???\n", label, opcode, operand);
            }
        }
    }

    fclose(intermediate);
    fclose(optab);
    fclose(symtab);
    fclose(output);

    printf("Pass 2 completed. Output written to output.txt\n");
}
