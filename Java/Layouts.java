import javax.swing.*;
import java.awt.*;

public class LayoutExample {
    public static void main(String[] args) {
        // Create a JFrame
        JFrame frame = new JFrame("Layout Manager Example");
        frame.setSize(600, 400);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setLayout(new BorderLayout()); // Set the BorderLayout for the JFrame

        // FlowLayout Panel
        JPanel flowPanel = new JPanel();
        flowPanel.setLayout(new FlowLayout()); // Set FlowLayout for this panel
        flowPanel.add(new JButton("Button 1"));
        flowPanel.add(new JButton("Button 2"));
        flowPanel.add(new JButton("Button 3"));
        flowPanel.add(new JButton("Button 4"));

        // GridLayout Panel
        JPanel gridPanel = new JPanel();
        gridPanel.setLayout(new GridLayout(2, 2)); // Set GridLayout (2 rows, 2 columns)
        gridPanel.add(new JLabel("Label 1"));
        gridPanel.add(new JLabel("Label 2"));
        gridPanel.add(new JTextField("TextField 1"));
        gridPanel.add(new JTextField("TextField 2"));

        // Adding FlowLayout panel to the North region of BorderLayout
        frame.add(flowPanel, BorderLayout.NORTH);

        // Adding GridLayout panel to the Center region of BorderLayout
        frame.add(gridPanel, BorderLayout.CENTER);

        // BorderLayout components
        frame.add(new JButton("East Button"), BorderLayout.EAST);
        frame.add(new JButton("West Button"), BorderLayout.WEST);
        frame.add(new JButton("South Button"), BorderLayout.SOUTH);

        // Set the JFrame visible
        frame.setVisible(true);
    }
}
