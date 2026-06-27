#include <stdio.h>
#include <stdlib.h>

void read(int a[10][10], int m, int n) {
    printf("Enter the elements of the matrix:\n");
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            printf("[%d][%d]: ", i, j);
            scanf("%d", &a[i][j]);
        }
    }
}

void print(int s[100][3]) {
    int n = s[0][2];
    for (int i = 1; i <= n; i++) { // Start from 1 to include all non-zero elements
        printf("%d\t %d\t %d\n", s[i][0], s[i][1], s[i][2]);
    }
}

void sparse(int a[10][10], int m, int n, int s[100][3]) {
    int k = 1; // Start from the first non-zero element
    s[0][0] = m; // Number of rows
    s[0][1] = n; // Number of columns
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < n; j++) {
            if (a[i][j] != 0) {
                s[k][0] = i; // Row index
                s[k][1] = j; // Column index
                s[k][2] = a[i][j]; // Value
                k++;
            }
        }
    }
    s[0][2] = k - 1; // Number of non-zero elements
}

void sparseAddition(int A[100][3], int B[100][3], int C[100][3]) {
    C[0][0] = A[0][0]; // Rows
    C[0][1] = A[0][1]; // Columns
    int i = 1, j = 1, k = 1;

    while (i <= A[0][2] || j <= B[0][2]) {
        if (i > A[0][2]) { // Only B has elements
            C[k][0] = B[j][0];
            C[k][1] = B[j][1];
            C[k][2] = B[j][2];
            j++;
        } else if (j > B[0][2]) { // Only A has elements
            C[k][0] = A[i][0];
            C[k][1] = A[i][1];
            C[k][2] = A[i][2];
            i++;
        } else if (A[i][0] == B[j][0] && A[i][1] == B[j][1]) { // Both have the same element
            C[k][0] = A[i][0];
            C[k][1] = A[i][1];
            C[k][2] = A[i][2] + B[j][2];
            i++;
            j++;
        } else if (A[i][0] < B[j][0] || (A[i][0] == B[j][0] && A[i][1] < B[j][1])) { // Only A has this element
            C[k][0] = A[i][0];
            C[k][1] = A[i][1];
            C[k][2] = A[i][2];
            i++;
        } else { // Only B has this element
            C[k][0] = B[j][0];
            C[k][1] = B[j][1];
            C[k][2] = B[j][2];
            j++;
        }
        k++;
    }
    C[0][2] = k - 1; // Number of non-zero elements in C
}

int main() {
    int A[10][10], B[10][10], sA[100][3], sB[100][3], sC[100][3];
    int mA, nA, mB, nB;

    // Read first sparse matrix
    printf("Enter the dimensions of the first matrix (rows columns): ");
    scanf("%d %d", &mA, &nA);
    read(A, mA, nA);
    sparse(A, mA, nA, sA);

    // Read second sparse matrix
    printf("Enter the dimensions of the second matrix (rows columns): ");
    scanf("%d %d", &mB, &nB);
    read(B, mB, nB);
    sparse(B, mB, nB, sB);

    // Check if matrices are compatible
    if (mA != mB || nA != nB) {
        printf("Incompatible matrix sizes.\n");
        return 1; // Exit with error
    }

    // Perform addition
    sparseAddition(sA, sB, sC);

    // Print result
    printf("Resulting Sparse Matrix (SUM):\n");
    print(sC);

    return 0;
}
