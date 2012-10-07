
import java.io.*;
import java.util.regex.*;

class Parse {

	public static void main(String[] args) throws IOException {


		String path = "/Users/shiffman/Documents/The-Nature-of-Code/raw/chapters/";
		String filename = args[0];

		String fullpath = path + filename;

		// Reading the file
		BufferedReader br = new BufferedReader(new FileReader(fullpath));
 		String line;

 		// Clearning the output file
    	BufferedWriter clear = new BufferedWriter(new FileWriter(filename));
    	clear.close();

    	// Getting ready to append
    	BufferedWriter out = new BufferedWriter(new FileWriter(filename, true));
		
    	boolean source = false;
    	boolean ignore = false;


    	int counter = 0;

		while ((line = br.readLine()) != null) {

			if (line.contains("[source,java]")) {
				source = true;
				counter = 0;
				//System.out.println("SOURCE ON: " + line);
			} else if (line.contains("----") && source) {
				counter++;
				//System.out.println("Counting: " + counter);
				if (counter == 2) {
				  source = false;
				  //System.out.println("SOURCE OFF: " + line);
				}
			} 

			if (line.trim().equals("++++")) {
				ignore = !ignore;
			}
			
			if (line.contains("PVector") && !source && !ignore) {
				line = line.replaceAll("([^*])PVector([^*])","$1[klass]*PVector*$2");
				System.out.println("-------------------------------------");
				System.out.println(line);
				System.out.println("-------------------------------------");
			}
			out.write(line + "\n");

		}
		out.close();
	}
}