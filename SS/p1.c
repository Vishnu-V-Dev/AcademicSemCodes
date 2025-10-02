#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void p1(char lab[10],char opc[10],char opr[10], char code[10], char mne[10]);

void display();

int main() {
	char lab[10],opc[10],opr[10],code[10],mne[10];
	
	p1(lab,opc,opr,code,mne);
	return 0;
}

void p1(char lab[10],char opc[10],char opr[10], char code[10], char mne[10]) {
	
	int locctr,start,length;
	FILE *fp1, *fp2, *fp3, *fp4, *fp5;
	fp1=fopen("input.txt","r");
	fp2=fopen("optab.txt","r");
	fp3=fopen("symtab.txt","w");
	fp4=fopen("intermediate.txt","w");
	fp5=fopen("length.txt","w");
	
	fscanf(fp1, "%s\t %s\t %s\t",lab,opc,opr);
	if(strcmp(opc,"START")==0) {
		start = atoi(opr);
		locctr = start;
		fprintf(fp4,"%s\t %s\t %s\n",lab,opc,opr);
		fscanf(fp1, "%s\t %s\t %s",lab,opc,opr);
	
	}else {
		locctr=0;
	}
	
	while(strcmp(opc, "END") !=0) {
		fprintf(fp4,"%s\t %s\t %s\n",lab,opc,opr);
		if(strcmp(lab,"**") !=0) {
			fprintf(fp3,"%s\t %d\n",lab,locctr);
		}
		
		fscanf(fp2,"%s\t %s",code,mne);
		while(strcmp(code,"END") !=0) {
			if(strcmp(opc,code) ==0) {
				locctr+=3;
				break;
			}
			fscanf(fp2,"%s\t %s",code,mne);
		}
		rewind(fp2);
		
		if(strcmp(opc,"WORD") ==0) {
			locctr += 3;
		} else if(strcmp(opc,"RESW") ==0) {
			locctr += (3 * atoi(opr));
		} else if(strcmp(opc,"BYTE") ==0) {
			++locctr;
		} else if(strcmp(opc,"RESB") ==0) {
			locctr+=atoi(opr);
		}
		fscanf(fp1,"%s\t %s\t %s\t",lab,opc,opr);		
	}
	fprintf(fp4,"%d\t %s\t %s\t %s\n",locctr,lab,opc,opr);
	fclose(fp4);
	fclose(fp3);
	fclose(fp2);
	fclose(fp1);
	display();
	
	length=locctr-start;
	fprintf(fp5,"%d",length);
	fclose(fp5);
	printf("\nThe length if the code is %d\n",length);
}

void display() {
    char str;
    FILE *fp1, *fp2, *fp3;
    printf("\nThe contents of Input Table: \n\n");
    fp1=fopen("input.txt", "r");
    str=fgetc(fp1);
    while(str != EOF) {
        printf("%c",str);
        str=fgetc(fp1);
    }
    fclose(fp1);

    printf("\nThe contents of Intermediate Table: \n\n");
    fp2=fopen("intermediate.txt", "r");
    str=fgetc(fp2);
    while(str != EOF) {
        printf("%c",str);
        str=fgetc(fp2);
    }
    fclose(fp2);

    printf("\nThe contents of Symbol Table: \n\n");
    fp3=fopen("symtab.txt", "r");
    str=fgetc(fp3);
    while(str != EOF) {
        printf("%c",str);
        str=fgetc(fp3);
    }
    fclose(fp3);
}
