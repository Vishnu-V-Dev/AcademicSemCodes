import java.io.*;

class FileHandling {
	public static void main(String args[])throws IOException {
		FileReader f1=new FileReader("Sample File.txt");
		BufferedReader bfr=new BufferedReader(f1);
		
		FileWriter f2=new FileWriter("Sample File 2.txt");
		String s;
		
		while((s=bfr.readLine()) != null) {
			f2.write(s);
		}
		f1.close();
		f2.close(); 
	}
}

