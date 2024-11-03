import java.util.Scanner;

class Exception {
	public static void main(String args[])throws ArithmeticException {
		try {
			int c=20;
			Scanner s=new Scanner(System.in);
			System.out.print("Enter a number: ");
			
			int a=s.nextInt();
			int d=c/a;
			System.out.println("Result= "+d);
		}
		catch(ArithmeticException e) {
			System.out.println("Divison by 0 is not possible.");
		}
		finally {
			System.out.println("Program Ends.");
		}
		System.out.println("Program Completed.");
	}
}
