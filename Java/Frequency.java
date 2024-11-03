import java.util.Scanner;

class Frequency {
	public static void main(String args[]) {
		
		Scanner t=new Scanner(System.in);
		System.out.print("Enter the String: ");
		String s=t.nextLine();
		
		int n=s.length();
		System.out.print("Enter the Character to find its Frequency: ");
		char c=t.nextLine().charAt(0);
		
		int count=0;
		for(int i=0;i<n;i++) {
			if(c == s.charAt(i)) {
				count=count+1;
			}
		}
		System.out.println("Frequency of the Character: "+count);
	}
}
