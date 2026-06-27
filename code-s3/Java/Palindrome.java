import java.util.Scanner;

class Palindrome {
	public static void main(String args[]) {
		
		Scanner s=new Scanner(System.in);
		System.out.print("Enter a String: ");
		String a=s.nextLine();
		String d="";
		
		for(int i=a.length()-1;i>=0;i--) {
			d=d+a.charAt(i);
		}
		if(a.equals(d)) {
			System.out.println("\n\tString is a Palindrome.");
		} else {
			System.out.println("\n\tString is not a Palindrome.");
		}
	}
}
