#include <stdio.h>
void merge(int a[], int l, int mid, int u) {
	int i=l,j=mid+1,k=0;
	int b[10];
	
	while(i<=mid && j<=u){
		if(a[i]<a[j]){
			b[k++]=a[i++];
		}
		else {
			b[k++]=a[j++];
		}
	}
	while(i<=mid){
		b[k++]=a[i++];
	}
	while(j<=u)  {
		b[k++]=a[j++];
	}
	for(i=l,k=0;i<=u;i++,k++) {
		a[i]=b[k];
	}
}
void mergeSort(int a[], int l, int u) {
	if(l<u) {
		int mid=(l+u)/2;
		mergeSort(a,l,mid);
		mergeSort(a,mid+1,u);
		merge(a,l,mid,u);
		}
}
void read(int a[], int n) {
	for (int i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }
}
void display(int a[], int n) {
	for (int i = 0; i < n; i++) {
        printf("%d\t",a[i]);
    }
}
 int main() {
	 int a[10],n;
	 printf("Enter the limit: ");
	 scanf("%d",&n);
	 
	 printf("Enter the elements: ");
	 read(a,n);
	 
	 mergeSort(a,0,n-1);
	 printf("Sorted Array: ");
	 display(a,n);
	 
	 
	 return 0;
 }
