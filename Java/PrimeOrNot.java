import java.util.Scanner;

public class PrimeOrNot {
    public static void main(String[] args) {
		
        Scanner scanner = new Scanner(System.in);
        System.out.print("Enter a number: ");
        int num = scanner.nextInt();
        
        boolean isPrime = num>1;
        
        for (int i=2;isPrime && i*i<=num;i++)
            isPrime =(num%i != 0);
        System.out.println(num +(isPrime ? " is a prime number.":" is not a prime number."));
    }
}
