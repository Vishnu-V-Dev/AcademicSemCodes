import javax.swing.*;
import java.awt.event.*;

class CtoF {
	public static void main(String args[]) {
		JFrame fr= new JFrame("C to F convert");
		fr.setSize(300,200);
		fr.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		fr.setLayout(null);
		
		JTextField C=new JTextField();
		C.setBounds(50,30,80,25);
		
		JTextField F=new JTextField();
		F.setBounds(150,30,80,25);
		F.setEditable(false);
		
		JButton ct=new JButton("Convert");
		ct.setBounds(100,70,100,30);
		
		ct.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					double cel=Double.parseDouble(C.getText());
					
					double fah=(cel*9/5)+32;
					
					F.setText(String.format("%.2f",fah));
				} catch(NumberFormatException ex) {
					F.setText("Invalid Input");
				}
			}
		});
		
		fr.add(C);
		fr.add(F);
		fr.add(ct);
		
		fr.setVisible(true);
	}
}
