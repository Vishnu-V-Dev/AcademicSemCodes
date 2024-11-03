import java.util.Scanner;
 class Multiplication {
	 public static void main(String args[]) {
		 Scanner s=new Scanner(System.in);
		 
		 int i,j,k,sum=0;
		 
		 int a[][]=new int[30][30];
		 int b[][]=new int[30][30];
		 int c[][]=new int[30][30];
		 
		 System.out.println("Enter the rows of the first matrix: ");
		 int m=s.nextInt();
		 
		 System.out.println("Enter the columns of the first matrix: ");
		 int n=s.nextInt();
		 
		 System.out.println("Enter the elements of the first matrix: ");
		 for(i=0;i<m;i++) {
			 for(j=0;j<n;j++) {
				 a[i][j]=s.nextInt();
			 }
		 }
		 System.out.println("Enter the rows of the second matrix: ");
		 int p=s.nextInt();
		 
		 System.out.println("Enter the columns of the second matrix: ");
		 int q=s.nextInt();
		 
		 if(n != p){
			 System.out.println("Multiplication not possible.");
		 } else {
		 
		 System.out.println("Enter the elements of the first matrix: ");
		 for(i=0;i<p;i++) {
			 for(j=0;j<q;j++) {
				 b[i][j]=s.nextInt();
			 }
		 }
		 System.out.println("Product of the matrix is");
		 for(i=0;i<m;i++) {
			 for(j=0;j<q;j++) {
				 sum=0;
				 for(k=0;k<n;k++) {
					 sum =sum+(a[i][j]*b[k][j]);
				 }
				 c[i][j]=sum;
			 }
		 }
		 for(i=0;i<m;i++) {
			 for(j=0;j<q;j++) {
				 System.out.print(c[i][j]+"\t");
			 }
		 }
	 }
		 
	 }
 }
