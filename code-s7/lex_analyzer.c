#include <stdio.h>
#include <string.h>
#include <ctype.h>

int isKey(char str[]) {
    char keywords[][10] = {
        "int", "char", "float", "double",
        "return", "void", "break"
    };

    for (int i = 0; i < 7; i++)
        if (strcmp(str, keywords[i]) == 0)
            return 1;

    return 0;
}

int isNumber(char str[]) {
    for (int i = 0; str[i]; i++)
        if (!isdigit((unsigned char)str[i]))
            return 0;

    return str[0] != '\0';
}

int isOperator(int ch) {
    return ch == '+' || ch == '-' || ch == '*' ||
           ch == '/' || ch == '=';
}

void processWord(char word[]) {
    if (isKey(word))
        printf("%s is a Keyword\n", word);
    else if (isNumber(word))
        printf("%s is a Number\n", word);
    else
        printf("%s is an Identifier\n", word);
}

int main() {
    FILE *fp = fopen("program.txt", "r");
    int ch, i = 0;
    char word[100];

    if (fp == NULL) {
        printf("File not found.\n");
        return 1;
    }

    while ((ch = fgetc(fp)) != EOF) {
        if (isalnum((unsigned char)ch) || ch == '_') {
            if (i < 99)
                word[i++] = ch;
        } else {
            if (i > 0) {
                word[i] = '\0';
                processWord(word);
                i = 0;
            }

            if (isOperator(ch))
                printf("%c is an Operator\n", ch);
        }
    }

    if (i > 0) {
        word[i] = '\0';
        processWord(word);
    }

    fclose(fp);
    return 0;
}
