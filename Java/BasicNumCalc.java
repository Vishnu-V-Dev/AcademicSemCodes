import javax.swing.*;
import java.awt.event.*;

public class BasicNumCalc {
    public static void main(String[] args) {
        // Create the frame
        JFrame frame = new JFrame("Number Calculator");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(300, 200);
        frame.setLayout(null);

        // Create text fields and labels
        JTextField inputF = new JTextField();
        inputF.setBounds(100, 20, 80, 25);

        JTextField prevF = new JTextField();
        prevF.setBounds(100, 60, 80, 25);
        prevF.setEditable(false);  // Read-only

        JTextField nextF = new JTextField();
        nextF.setBounds(100, 100, 80, 25);
        nextF.setEditable(false);  // Read-only

        JLabel PrevL = new JLabel("Prev:");
        PrevL.setBounds(10, 60, 100, 25);

        JLabel inputL = new JLabel("Enter number:");
        inputL.setBounds(10, 20, 100, 25);

        JLabel NextL = new JLabel("Next:");
        NextL.setBounds(10, 100, 100, 25);

        JButton CalcBtn = new JButton("Calculate");
        CalcBtn.setBounds(100, 140, 100, 25);

        // Button click event to calculate previous and next number
        CalcBtn.addActionListener(new ActionListener() {
            public void actionPerformed(ActionEvent e) {
                try {
                    // Get the number entered by the user
                    int number = Integer.parseInt(inputF.getText());

                    // Calculate previous and next numbers
                    int previousNumber = number - 1;
                    int nextNumber = number + 1;

                    // Update the text fields with the results
                    prevF.setText(String.valueOf(previousNumber));
                    nextF.setText(String.valueOf(nextNumber));
                } catch (NumberFormatException ex) {
                    // Show error message if input is not a valid number
                    JOptionPane.showMessageDialog(frame, "Please enter a valid number!", "Error", JOptionPane.ERROR_MESSAGE);
                }
            }
        });
        
        // Add components to the frame
        frame.add(inputF);
        frame.add(prevF);
        frame.add(nextF);
        frame.add(inputL);
        frame.add(PrevL);
        frame.add(NextL);
        frame.add(CalcBtn);

        // Make the frame visible
        frame.setVisible(true);
    }
}
