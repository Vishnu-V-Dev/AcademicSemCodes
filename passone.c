#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void p1(), display();

int main() {
    p1();
    return 0;
}

void p1() {
    int locctr = 0, start = 0, length;
    FILE *fp1 = fopen("input.txt", "r");
    FILE *fp2 = fopen("optab.txt", "r");
    FILE *fp3 = fopen("symtab.txt", "w");
    FILE *fp4 = fopen("intermediate.txt", "w");
    FILE *fp5 = fopen("length.txt", "w");

    char lab[10], opc[10], opr[10], code[10], mne[10];

    fscanf(fp1, "%s %s %s", lab, opc, opr);
    if (strcmp(opc, "START") == 0) {
        start = atoi(opr);
        locctr = start;
        fprintf(fp4, "%s %s %s\n", lab, opc, opr);
        fscanf(fp1, "%s %s %s", lab, opc, opr);
    }

    while (strcmp(opc, "END") != 0) {
        fprintf(fp4, "%s %s %s\n", lab, opc, opr);
        if (strcmp(lab, "**") != 0)
            fprintf(fp3, "%s %d\n", lab, locctr);

        int found = 0;
        while (fscanf(fp2, "%s %s", code, mne) != EOF) {
            if (strcmp(opc, code) == 0) {
                locctr += 3;
                found = 1;
                break;
            }
        }

        if (!found) {
            if (strcmp(opc, "WORD") == 0) locctr += 3;
            else if (strcmp(opc, "RESW") == 0) locctr += 3 * atoi(opr);
            else if (strcmp(opc, "RESB") == 0) locctr += atoi(opr);
            else if (strcmp(opc, "BYTE") == 0) locctr += 1;
        }

        rewind(fp2);
        fscanf(fp1, "%s %s %s", lab, opc, opr);
    }

    fprintf(fp4, "%d %s %s %s\n", locctr, lab, opc, opr);
    length = locctr - start;
    fprintf(fp5, "%d", length);

    fclose(fp1); fclose(fp2); fclose(fp3); fclose(fp4); fclose(fp5);

    display();
    printf("\nThe length of the code is %d\n", length);
}

void display() {
    FILE *f;
    char str[256];

    printf("\nThe contents of Input Table:\n\n");
    f = fopen("input.txt", "r");
    while (fgets(str, sizeof(str), f)) printf("%s", str);
    fclose(f);

    printf("\nThe contents of Intermediate Table:\n\n");
    f = fopen("intermediate.txt", "r");
    while (fgets(str, sizeof(str), f)) printf("%s", str);
    fclose(f);

    printf("\nThe contents of Symbol Table:\n\n");
    f = fopen("symtab.txt", "r");
    while (fgets(str, sizeof(str), f)) printf("%s", str);
    fclose(f);
}