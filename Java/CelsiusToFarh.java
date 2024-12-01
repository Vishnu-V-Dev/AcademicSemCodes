import javax.swing.*;
import java.awt.event.*;

public class CelsiusToFarh {
    public static void main(String[] args) {
        // Create the JFrame for the window
        JFrame frame = new JFrame("Celsius to Fahrenheit Converter");
        frame.setSize(300, 200);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(null);

        // Create the Celsius input field
        JTextField celsiusField = new JTextField();
        celsiusField.setBounds(50, 30, 80, 25);

        // Create the Fahrenheit output field
        JTextField fahrenheitField = new JTextField();
        fahrenheitField.setBounds(150, 30, 80, 25);
        fahrenheitField.setEditable(false); // Make the output field non-editable

        // Create the "Convert" button
        JButton convertButton = new JButton("Convert");
        convertButton.setBounds(100, 70, 100, 30);

        // Create the label for result
        JLabel resultLabel = new JLabel("Result: ");
        resultLabel.setBounds(50, 120, 200, 25);

        // Add action listener for the "Convert" button
        convertButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                try {
                    // Get the Celsius input value and parse it to double
                    double celsius = Double.parseDouble(celsiusField.getText());

                    // Convert to Fahrenheit
                    double fahrenheit = (celsius * 9 / 5) + 32;

                    // Display the result in the Fahrenheit field
                    fahrenheitField.setText(String.format("%.2f", fahrenheit));

                    // Optionally, update the result label (if you prefer it to show text like "Result: 98.6")
                    resultLabel.setText("Result: " + fahrenheit + "°F");
                } catch (NumberFormatException ex) {
                    // Handle invalid input
                    resultLabel.setText("Invalid input. Please enter a valid number.");
                }
            }
        });
        frame.add(celsiusField);
        frame.add(fahrenheitField);
        frame.add(convertButton);
        frame.add(resultLabel);

        // Make the frame visible
        frame.setVisible(true);
    }
}
