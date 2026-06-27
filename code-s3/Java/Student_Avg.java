import java.util.Scanner;

class Student {
    // Data members
    private int rollNumber;
    private String name;
    private double mathMarks;
    private double phyMarks;
    private double chemMarks;

    // Method to get required input
    public void getRequiredDetails() {
        Scanner scanner = new Scanner(System.in);
        try {
            System.out.print("Enter Roll Number: ");
            rollNumber = scanner.nextInt();
            scanner.nextLine(); // Consume newline
            System.out.print("Enter Name: ");
            name = scanner.nextLine();
            System.out.print("Enter Math Marks: ");
            mathMarks = scanner.nextDouble();
            System.out.print("Enter Physics Marks: ");
            phyMarks = scanner.nextDouble();
            System.out.print("Enter Chemistry Marks: ");
            chemMarks = scanner.nextDouble();
        } catch (Exception e) {
            System.out.println("Invalid input. Please enter correct data.");
            scanner.nextLine(); // Clear the buffer
        }
    }

    // Method to calculate average marks and display it
    public void displayAverage() {
        double average = (mathMarks + phyMarks + chemMarks) / 3;
        System.out.printf("Average Marks of %s (Roll No: %d): %.2f%n", name, rollNumber, average);
    }
}

public class Student_Avg{
    public static void main(String[] args) {
        Student student = new Student(); // Create an object of the Student class
        // Get the required details from the user
        student.getRequiredDetails();
        // Display the average marks of the student
        student.displayAverage();
    }
}
