#include <stdio.h>

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

int main() {
    int a[100],n,element;
    printf("Enter the limit: ");
    scanf("%d", &n);
    printf("Enter the elements (sorted): ");
    read(a, n);
    printf("Enter the element to be searched: ");
    scanf("%d", &element);
    
    int result = BinarySearch(a,0,n-1,element);
    if (result == -1) {
        printf("Element not found in array.\n");
    } else {
        printf("Element found at index: %d\n",result+1);
    }
    return 0;
}
