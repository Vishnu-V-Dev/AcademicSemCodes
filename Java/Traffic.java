import javax.swing.*;
import java.awt.*;
import java.awt.event.*;

class Traffic {
	Traffic() {
		JFrame T=new JFrame("Traffic Light");
		T.setSize(450,300);
		T.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		T.setLayout(new GridLayout(3,1));
		
		JPanel p1=new JPanel();
		JPanel p2=new JPanel();
		JPanel p3=new JPanel();
		JPanel p4=new JPanel();
		JPanel p5=new JPanel();
		JPanel p6=new JPanel();
		JPanel p7=new JPanel();
		
		p1.setBackground(Color.BLACK);
		p2.setBackground(Color.BLACK);
		p3.setBackground(Color.BLACK);
		p4.setBackground(Color.BLACK);
		p5.setBackground(Color.BLACK);
		p6.setBackground(Color.BLACK);
		p7.setBackground(Color.BLACK);
		
		JRadioButton b[]=new JRadioButton[3];
		b[0]=new JRadioButton("Start");
		b[1]=new JRadioButton("Wait");
		b[2]=new JRadioButton("Stop");
		b[0].setBackground(Color.WHITE);
		b[1].setBackground(Color.WHITE);
		b[2].setBackground(Color.WHITE);
		
		ButtonGroup bg=new ButtonGroup();
		bg.add(b[0]);
		bg.add(b[1]);
		bg.add(b[2]);
		
		b[0].addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				p4.setBackground(Color.GREEN);
				p5.setBackground(Color.BLACK);
				p6.setBackground(Color.BLACK);
			}
		});
		
		b[1].addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				p4.setBackground(Color.BLACK);
				p5.setBackground(Color.YELLOW);
				p6.setBackground(Color.BLACK);
			}
		});
		
		b[2].addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				p4.setBackground(Color.BLACK);
				p5.setBackground(Color.BLACK);
				p6.setBackground(Color.RED);
			}
		});
		
		T.add(p1);
		T.add(p2);
		T.add(p3);
		
		p2.add(p4);
		p2.add(b[0]);
		p2.add(p5);
		p2.add(b[1]);
		p2.add(p6);
		p2.add(b[2]);
		p2.add(p7);
		p2.setLayout(new GridLayout(1,7));
		
		T.setVisible(true);
	}
	public static void main(String args[]) {
		new Traffic();
	}
}
