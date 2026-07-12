#include <stdio.h>
#include <string.h>
#include <ctype.h>

int isKey(char str[])
{
    char keywords[][10] = {// *|i |n |t |\0 | | | | | | |*
                           "int", "char", "float", "double",
                           "return", "void", "break"};

    int i;
    for (i = 0; i < 7; i++)
    { // 7 keywords mentioned
        if (strcmp(str, keywords[i]) == 0)
            return 1;
    }
    return 0;
}

int isNum(char str[])
{

    int i;
    for (i = 0; str[i] != '\0'; i++)
    {
        if (!isdigit(str[i]))
            return 0;
    }
    return 1;
}

int isOpr(char ch)
{
    if (ch == '+' || ch == '-' || ch == '*' || ch == '/' ||
        ch == '=')
        return 1;
    return 0;
}

void checkWord(char word[])
{
    if (isNum(word))
        printf("%s is a digit\n", word);

    else if (isKey(word))
        printf("%s is a keyword\n", word);

    else
        printf("%s is an Identifier\n", word);
}

int main()
{

    FILE *fp;
    int ch;
    char b[100]; // buffer
    int i = 0;

    fp = fopen("program.txt", "r");

    if (fp == NULL)
    {
        printf("File not found.\n");
        return 0;
    }

    while ((ch = fgetc(fp)) != EOF)
    {

        if (isOpr(ch))
            printf("%c is an Operator\n", ch);

        else if (isalnum(ch))
            b[i++] = ch;

        else
        {
            if (i != 0)
            {
                b[i] = '\0';
                checkWord(b);
                i = 0;
            }
        }
    }
    /* Process the last token if file ends without space */
    if (i != 0)
    {
        b[i] = '\0';
        checkWord(b);
    }
    return 0;
}
