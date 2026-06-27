import java.io.*;

class ReadData {
	public static void main(String args[])throws IOException {
		int c;
		FileInputStream f=new FileInputStream("samplefile.txt");
		
		do {
			c=f.read();
			if(c != -1) {
				System.out.print((char)c);
			}
		}
		while(c != -1);
		f.close();
	}
}
