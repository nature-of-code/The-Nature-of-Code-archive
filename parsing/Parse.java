
import java.io.*;
import java.util.regex.*;

class Parse {

	public static void main(String[] args) throws IOException {


		String path = "/Users/shiffman/Documents/The-Nature-of-Code/raw/chapters/";
		String output = "output/";

		//String find = "([^*/_\\[])ParticleSystem([^*])";
		//String replace = "$1[klass]*ParticleSystem*$2";

		String find = "([^*/_\\[])TWO_PI([^*])";
		String replace = "$1[var]*TWO_PI*$2";

		String[] filenames;
		if (args.length < 1) {
 			filenames = listFileNames(path);
		} else {
			filenames = args;
		}



		System.out.println("Find    " + find);
		System.out.println("Replace " + replace);

 		// Clearning the output file
    	BufferedWriter clearDebug = new BufferedWriter(new FileWriter("debug.txt"));
    	clearDebug.close();
    	// Getting ready to append
    	BufferedWriter debug = new BufferedWriter(new FileWriter("debug.txt", true));
		
		for (int i = 0; i < filenames.length; i++) {
			String filename = filenames[i];
			String fullpath = path + filename;

			debug.write(filename + "\n-------------------------------\n");

			// Reading the file
			BufferedReader br = new BufferedReader(new FileReader(fullpath));
	 		String line;

 			// Clearning the output file
    		BufferedWriter clear = new BufferedWriter(new FileWriter(output+filename));
    		clear.close();
    		// Getting ready to append
    		BufferedWriter out = new BufferedWriter(new FileWriter(output+filename, true));
		
	    	boolean source = false;
    		boolean ignore = false;

    		int counter = 0;

    		int totallines = 0;
    		int lineNumber = 0;

			while ((line = br.readLine()) != null) {
				lineNumber++;

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
				//System.out.println(line);

				// Making sure we ignore headers
				Pattern header  = Pattern.compile("^=+");
				Matcher headerM = header.matcher(line); 
				Pattern example  = Pattern.compile("^\\[(example|highlight)\\]");
				Matcher exampleM = example.matcher(line); 

				if (line.trim().equals("++++")) {
					ignore = !ignore;
				}


				Pattern p = Pattern.compile(find);
				Matcher m = p.matcher(line);

				//if (line.contains("PVector") && !source && !ignore) {
				if (m.find() && !headerM.find() && !exampleM.find() && !source && !ignore) {
					debug.write("------------------------------ORIGINAL------------------------------"+lineNumber+"\n");
					debug.write(line + "\n");
					debug.write("------------------------------CHANGED-------------------------------\n");
					line = line.replaceAll(find,replace);
					debug.write(line + "\n");
					debug.write("------------------------------------------------------------------\n\n");
					totallines++;
				}
				out.write(line + "\n");
			}
			out.close();

			if (totallines != 0) System.out.println(filename + " " + totallines);
			if (totallines == 0) {
				File del = new File(output + filename);
  				boolean success = del.delete();
  				//if (success) System.out.println("Deleted: " + filename);
  				//else System.out.println("problem deleting: " + filename);
			}
		}
		debug.close();


	}

	// This function returns all the files in a directory as an array of Strings  
	public static String[] listFileNames(String dir) {
  		File file = new File(dir);
  		if (file.isDirectory()) {
    		String names[] = file.list();
    		return names;
  	} else {
    	// If it's not a directory
    	return null;
  	}
}
}