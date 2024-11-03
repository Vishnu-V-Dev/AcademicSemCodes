import javax.swing.*;
import java.awt.event.*;

public class AddTwoNumbersGUI {
	public static void main(String args[]) {
	
	JFrame fr=new JFrame("Add Two Numbers");
	fr.setSize(300,200);
	fr.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	fr.setLayout(null);
	
	JTextField num1Field=new JTextField();
	num1Field.setBounds(50,30,80,25);
	
	
	JTextField num2Field=new JTextField();
	num2Field.setBounds(150,30,80,25);
	
	JButton addButton=new JButton("+");
	addButton.setBounds(100,70,80,30);
	
	JLabel resultLabel= new JLabel("Result: ");
	resultLabel.setBounds(50,120,200,25);
	
	addButton.addActionListener(new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent e) {
			try {
				int num1=Integer.parseInt(num1Field.getText());
				int num2=Integer.parseInt(num2Field.getText());
				
				int sum=num1+num2;
				
				resultLabel.setText("Result: "+sum);
			} catch(NumberFormatException ex) {
				resultLabel.setText("Invalid input. Please enter numbers.");
			}
		}
	});
	num1Field.addActionListener(new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent e) {
			num2Field.requestFocus();
		}
	});
	num2Field.addActionListener(new ActionListener() {
		@Override
		public void actionPerformed(ActionEvent e) {
			addButton.doClick();
		}
	});
	
	fr.add(num1Field);
	fr.add(num2Field);
	fr.add(addButton);
	fr.add(resultLabel);
	
	fr.setVisible(true);	
	}
}
