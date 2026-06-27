import java.util.Scanner;

class MatrixAddition {
	public static void main(String args[]) {
		Scanner s=new Scanner(System.in);
		
		int i,j;
		
		int a[][] = new int[30][30];
		int b[][] = new int[30][30];
		int c[][] = new int[30][30];
		
		System.out.print("Enter the rows of the first matrix: ");
		int m=s.nextInt();
		
		System.out.print("Enter the columns of the first matrix: ");
		int n=s.nextInt();
		
		System.out.print("Enter the elements of the first matrix: ");
        for (i = 0; i < m; i++) {
            for (j = 0; j < n; j++) {
                a[i][j] = s.nextInt();
			}
		}
		
		System.out.print("Enter the rows of the second matrix: ");
        int p = s.nextInt();

        System.out.print("Enter the columns of the second matrix: ");
        int q = s.nextInt();
        
        if(m != p) {
			System.out.println("Matrix addition not possible. The dimensions of the matrices must be the same.");
        } else {
            System.out.print("Enter the elements of the second matrix: ");
            for (i = 0; i < p; i++) {
                for (j = 0; j < q; j++) {
                    b[i][j] = s.nextInt();
				}
			}
			
			System.out.println("Sum of the matrices is:");
            for (i = 0; i < m; i++) {
                for (j = 0; j < n; j++) {
                    c[i][j] = a[i][j] + b[i][j];
				}
			}
			
			for (i = 0; i < m; i++) {
                for (j = 0; j < n; j++) {
                    System.out.print(c[i][j] + "\t");
                }
                System.out.println();
			}
		}
	}
}
