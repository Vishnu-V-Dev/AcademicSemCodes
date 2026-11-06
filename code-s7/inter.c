#include <stdio.h>
#include <string.h>

int main() {
    char c[20][20], str[20], opc[10];
    int i = 0;

    printf("Enter inter code: ");

    do {
        scanf("%s", c[i]);
    } while (strcmp(c[i++], "exit") != 0);

    printf("\nTarget code generation:\n");
    i = 0;

    do {
        strcpy(str, c[i]);

        switch (str[3]) {
            case '+': strcpy(opc, "ADD"); break;
            case '-': strcpy(opc, "SUB"); break;
            case '*': strcpy(opc, "MUL"); break;
            case '/': strcpy(opc, "DIV"); break;
        }

        printf("\nMOV %c, R%d", str[2], i);
        printf("\n%s %c, R%d", opc, str[4], i);
        printf("\nMOV R%d, %c", i, str[0]);

    } while (strcmp(c[++i], "exit") != 0);

    return 0;
}
