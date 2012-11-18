

import java.io.*;
import java.util.regex.*;

class ParseMath {

	public static void main(String[] args) throws IOException {

		String path = "/Users/shiffman/Documents/The-Nature-of-Code/raw/chapters/math.asc";
		String output = "/Users/shiffman/Documents/The-Nature-of-Code/parsing/output/";

		BufferedReader br = new BufferedReader(new FileReader(path));
		String line;
		while ((line = br.readLine()) != null) {
			Pattern p = Pattern.compile(":(.*?):\\s+(.*)");
			Matcher m = p.matcher(line);
			if (m.find()) {
				String name = m.group(1);
				String mathml = m.group(2);

				//System.out.println(name);
				if (name.equals("Cd")) {

					System.out.println("Writing: " + name + ".mathml");
					//System.out.println(name);
					//System.out.println(mathml);
					String file = output + "mathml/" + name+".mathml";
					BufferedWriter out = new BufferedWriter(new FileWriter(file));
					out.write(mathml);
					out.close();

					System.out.println("Writing: " + name + ".svg");
					Runtime runtime = Runtime.getRuntime();
					String svgmath = "/Users/shiffman/Dropbox/writing/NOC_BOOK/SVGMath/SVGMath-0.3.3/math2svg.py";
					String cmd = "python " + svgmath + " ";
					cmd += "-o " + output + "svgs/" + name + ".svg ";
					cmd += file;

					Process appProcess = runtime.exec(cmd);			
					InputStream es = appProcess.getErrorStream();
					InputStream is = appProcess.getInputStream();
					BufferedReader bres = new BufferedReader(new InputStreamReader(es));
					BufferedReader bris = new BufferedReader(new InputStreamReader(is));
					String bresout;
					while ((bresout = bres.readLine()) != null) {
						System.out.println(bresout);
					}

					String brisout;
					while ((brisout = bris.readLine()) != null) {
						System.out.println(brisout);
					}
				}



			}
			//out.write(line + "\n");
			//System.out.println(line);
		}

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