import java.util.Scanner;

class Employee {
    private String name;
    private int age;
    private int phone;
    private String address;
    private double salary;
    
    public void printSalary() {
        System.out.println("Salary = " + salary);
    }
    
    public Employee(String name, int age, int phone, String address, double salary) {
        this.name = name;
        this.age = age;
        this.phone = phone;
        this.address = address;
        this.salary = salary;
    }

    public void displayEmployee() {
        System.out.println("Name: " + name);
        System.out.println("Age: " + age);
        System.out.println("Phone: " + phone);
        System.out.println("Address: " + address);
        System.out.println("Salary: " + salary);
    }
}

class Manager extends Employee {
    private String specialization;
    private String department;

    public Manager(String name, int age, int phone, String address, 
                    double salary, String specialization, String department) {
        super(name, age, phone, address, salary);
        this.specialization = specialization;
        this.department = department;
    }

    public void displayManager() {
        displayEmployee();
        System.out.println("Specialization: " + specialization);
        System.out.println("Department: " + department);
    }
}

class Officer extends Employee {
    private String specialization;
    private String department;

    public Officer(String name, int age, int phone, String address, 
                    double salary, String specialization, String department) {
        super(name, age, phone, address, salary);
        this.specialization = specialization;
        this.department = department;
    }

    public void displayOfficer() {
        displayEmployee();
        System.out.println("Specialization: " + specialization);
        System.out.println("Department: " + department);
    }
}

class Inheritance {
    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);

        // Manager details input
        System.out.println("Enter Manager Details");
        System.out.print("Name: ");
        String n = sc.nextLine();
        
        System.out.print("Age: ");
        int a = sc.nextInt();
        
        System.out.print("Phone: ");
        int p = sc.nextInt();
        
        sc.nextLine();  // Consume newline character left by nextInt()
        
        System.out.print("Address: ");
        String ad = sc.nextLine();
        
        System.out.print("Salary: ");
        double s = sc.nextDouble();
        
        sc.nextLine();  // Consume newline character left by nextDouble()
        
        System.out.print("Specialization: ");
        String sp = sc.nextLine();
        
        System.out.print("Department: ");
        String dept = sc.nextLine();
        
        Manager m = new Manager(n, a, p, ad, s, sp, dept);
        m.displayManager();

        // Officer details input
        System.out.println("\nEnter Officer Details");
        System.out.print("Name: ");
        String n1 = sc.nextLine();
        
        System.out.print("Age: ");
        int a1 = sc.nextInt();
        
        System.out.print("Phone: ");
        int p1 = sc.nextInt();
        
        sc.nextLine();  // Consume newline character left by nextInt()
        
        System.out.print("Address: ");
        String ad1 = sc.nextLine();
        
        System.out.print("Salary: ");
        double s1 = sc.nextDouble();
        
        sc.nextLine();  // Consume newline character left by nextDouble()
        
        System.out.print("Specialization: ");
        String sp1 = sc.nextLine();
        
        System.out.print("Department: ");
        String dept1 = sc.nextLine();
        
        Officer o = new Officer(n1, a1, p1, ad1, s1, sp1, dept1);
        o.displayOfficer();
    }
}
