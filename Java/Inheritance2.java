import java.util.Scanner;

class Employee {
    String name, address;
    int age, number, salary;

    void display() {
        System.out.println("Name: " + name);
        System.out.println("Address: " + address);
        System.out.println("Age: " + age);
        System.out.println("Number: " + number);
        System.out.println("Salary: " + salary);
    }

    int getBonus() {
        return 0; // Default bonus for base employee
    }

    int totalSalary() {
        return salary + getBonus(); // Total salary including bonus
    }
}

class Officer extends Employee {
    String specialization;

    Officer(String name, String address, int age, int number, int salary, String specialization) {
        this.name = name;
        this.address = address;
        this.age = age;
        this.number = number;
        this.salary = salary;
        this.specialization = specialization;
    }

    @Override
    int getBonus() {
        return 3000; // Bonus for Officer
    }

    void display() {
        System.out.println("\nDetails of Officer:");
        super.display();
        System.out.println("Specialization: " + specialization);
        System.out.println("Total Salary (with bonus): " + totalSalary());
    }
}

class Manager extends Employee {
    String department;

    Manager(String name, String address, int age, int number, int salary, String department) {
        this.name = name;
        this.address = address;
        this.age = age;
        this.number = number;
        this.salary = salary;
        this.department = department;
    }

    @Override
    int getBonus() {
        return 5000; // Bonus for Manager
    }

    void display() {
        System.out.println("\nDetails of Manager:");
        super.display();
        System.out.println("Department: " + department);
        System.out.println("Total Salary (with bonus): " + totalSalary());
    }
}

public class Inheritance2 {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        
        Officer officer = createOfficer(s);
        officer.display();
        
        Manager manager = createManager(s);
        manager.display();
       
    }

    private static Officer createOfficer(Scanner s) {
        System.out.println("Enter details for Officer:");
        System.out.print("Name: ");
        String name = s.nextLine();
        System.out.print("Address: ");
        String address = s.nextLine();
        System.out.print("Age: ");
        int age = s.nextInt();
        System.out.print("Number: ");
        int number = s.nextInt();
        System.out.print("Salary: ");
        int salary = s.nextInt();
        s.nextLine(); // Consume the leftover newline
        System.out.print("Specialization: ");
        String specialization = s.nextLine();
        
        return new Officer(name, address, age, number, salary, specialization);
    }

    private static Manager createManager(Scanner s) {
        System.out.println("\nEnter details for Manager:");
        System.out.print("Name: ");
        String name = s.nextLine();
        System.out.print("Address: ");
        String address = s.nextLine();
        System.out.print("Age: ");
        int age = s.nextInt();
        System.out.print("Number: ");
        int number = s.nextInt();
        System.out.print("Salary: ");
        int salary = s.nextInt();
        s.nextLine(); // Consume the leftover newline
        System.out.print("Department: ");
        String department = s.nextLine();
        
        return new Manager(name, address, age, number, salary, department);
    }
}

