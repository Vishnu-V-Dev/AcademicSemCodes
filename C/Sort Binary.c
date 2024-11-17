#include <stdio.h>

void InsertionSort(int a[], int n) {
	int i,j,temp;
	for(i=0;i<n;i++) {
		temp=a[i];
		j=i-1;
		while(j>=0 && a[j]>temp) {
			a[j+1]=a[j];
			j--;
		}
		a[j+1]=temp;
	}
}

int BinarySearch(int a[], int low, int high, int Search_data) {
    while (low <= high) {
        int mid = (low + high) / 2;
        if (a[mid] == Search_data) {
            return mid;  // Return index if found
        } else if (a[mid] > Search_data) {
            high = mid - 1;  // Search in the left half
        } else {
            low = mid + 1;   // Search in the right half
        }
    }
    return -1;  // Return -1 if not found
}

void read(int a[], int n) {
    for (int i = 0; i < n; i++) {
        scanf("%d", &a[i]);
    }
}
void display(int a[], int n) {
	for (int i=0;i<n;i++) {
        printf("%d",a[i]);
    }
}
int main() {
	int a[100],n,e;
	printf("Enter the limit: ");
	scanf("%d",&n);
	printf("Enter the elements(sorted): ");
	read(a,n);
	InsertionSort(a,n);
	printf("\nSorted array: ");
	display(a,n);
	printf("\nEnter the elements to be searched: ");
	scanf("%d",&e);
	
	int result=BinarySearch(a,0,n-1,e);
	if(result==-1) {
		printf("Element not found in array.");
	} else {
		printf("Element found at index %d",result+1);
	}
	return 0;
}
