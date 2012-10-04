
import java.io.*;
import java.util.regex.*;

class Parse {

	public static void main(String[] args) throws IOException {


		String path = "/Users/shiffman/Documents/The-Nature-of-Code/raw/";

		String filename = path + args[0];

		BufferedReader br = new BufferedReader(new FileReader(filename));
 		String line;

    	BufferedWriter clear = new BufferedWriter(new FileWriter("output.asc"));
    	clear.close();

    	BufferedWriter out = new BufferedWriter(new FileWriter("output.asc", true));
		
    	boolean source = false;


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
			
			if (line.contains("PVector") && !source) {
				line = line.replaceAll("([^*])PVector([^*])","$1[klass]*PVector*$2");
				System.out.println(line);
			}
		}
		out.close();


	}

}