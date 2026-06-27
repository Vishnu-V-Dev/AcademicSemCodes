#include <stdio.h>
void quicksort(int a[], int L, int R) {
	if(L<R) {
		int pivot=L,i=L+1,j=R,swap;
		
		while(i<=j) {
			while(i<=R && a[i]<=a[pivot]) {
				i++;
			}
			while(j>L && a[j]>a[pivot]) {
				j--;
			}
			if(i<j) {
				
				swap=a[i];
				a[i]=a[j];
				a[j]=swap;
			}
		}
		swap=a[pivot];
		a[pivot]=a[j];
		a[j]=swap;
		
		quicksort(a,L,j-1);
		quicksort(a,j+1,R);
	}
}

void read(int a[], int n) {
    for (int i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }
}

void display(int a[], int n) {
    for (int i = 0; i < n; i++) {
        printf("%d\t", a[i]);
    }
    printf("\n");  // Added newline for better output formatting
}

int main() {
    int n, a[25];
    printf("Enter the limit: ");
    scanf("%d", &n);
    printf("Enter %d elements: ", n);
    read(a, n);
    quicksort(a, 0, n - 1);
    printf("Order of sorted elements: ");
    display(a, n);
    return 0;
}
