

import java.io.*;
import java.util.regex.*;

class CreateMathSVGFilesASC {

	public static void main(String[] args) throws IOException {

		String path = "/Users/shiffman/Documents/The-Nature-of-Code/parsing/output/";
		String input = path + "svgs/";
		String[] svgs = listFileNames(input);

		String output = path + "mathsvgfiles.asc";
		// Clearning the output file
		BufferedWriter clear = new BufferedWriter(new FileWriter(output));
		clear.close();
		// Getting ready to append
		BufferedWriter out = new BufferedWriter(new FileWriter(output, true));


		for (int i = 0; i < svgs.length; i++) {
			String svg = svgs[i];
			String var = svgs[i].replaceAll("\\.svg","");
			System.out.println("Parsing: " + svgs[i] + " var: " + var);
			String svgline = ":" + var + ": " + "<img src=\"svgs/" + svg + "\" type=\"image/svg+xml\" class =\"math\" />" + "\n\n";
			out.write(svgline);
		}
		out.close();


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