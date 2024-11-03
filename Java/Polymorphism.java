import java.util.Scanner;

class Polymorphism {
	
	void area(double r) {
		double a=3.14*r*r;
		System.out.println("Area of the circle is : "+a);
	}
	void area(int l, int b) {
		int a=l*b;
		System.out.println("Area of the rectangle is : "+a);
	}
	void area(double h, double t) {
		double a=0.5*h*t;
		System.out.println("Area of the triangle is : "+a);
	}
	public static void main(String args[]) {
		Polymorphism m= new Polymorphism();
		
		Scanner s= new Scanner(System.in);
		System.out.print("Enter the radius of the circle: ");
		double r=s.nextDouble();
		m.area(r);
		
		System.out.print("\nEnter the length and breadth of the rectangle: ");
		int l=s.nextInt();
		int b=s.nextInt();
		m.area(l,b);
		
		System.out.print("\nEnter the heigth and base of the triangle: ");
		double h=s.nextInt();
		double t=s.nextInt();
		m.area(h,t);
	}
}
