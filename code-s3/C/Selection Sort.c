#include <stdio.h>
void read(int a[], int n) {
	for(int i=0;i<n;i++)
	scanf("%d",&a[i]);
}
void display(int a[], int n) {
	for(int i=0;i<n;i++)
	printf("%d\t",a[i]);
}
void SelectionSort(int a[], int n) {
	int i,j,min,swap;
	for(i=1;i<n-1;i++) {
		min=i;
		for(j=i+1;j<n;j++) {
			if(a[min]>a[j]) {
				min=j;
			}
		}if(min != i)
		swap=a[i];
		a[i]=a[min];
		a[min]=swap;
	}

}
int main() {
	int a[100],n;
	printf("Enter the no of elements: ");
	scanf("%d",&n);
	printf("Enter %d numbers: \n",n);
	read(a,n);
	SelectionSort(a,n);
	printf("Sorted Array:\n");
	display(a,n);
	return 0;
}
	
