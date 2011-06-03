// Interactive Selection
// http://www.genarts.com/karl/papers/siggraph91.html
// Daniel Shiffman <http://www.shiffman.net>

class DNA {

  //The genetic sequence
  float[] dna;
  int len = 20;  //arbitrary length
  
  //Constructor (makes a random DNA)
  DNA() {
    //DNA is random floating point values between 0 and 1 (!!)
    dna = new float[len];
    for (int i = 0; i < dna.length; i++) {
      dna[i] = random(0,1);
    }
  }
  
  DNA(float[] newdna) {
    //dna = (float []) newdna.clone();  //not working as an applet?
    dna = newdna;
  }
  
  //returns one element from array 
  float getGene(int index) {
    return dna[index];
  }
  
  //**CROSSOVER***//
  //creates new DNA sequence from two (this & 
  DNA mate(DNA partner) {
    float[] child = new float[dna.length];
    int crossover = int(random(dna.length));
    for (int i = 0; i < dna.length; i++) {
      if (i > crossover) child[i] = getGene(i);
      else               child[i] = partner.getGene(i);
    }
    DNA newdna = new DNA(child);
    return newdna;
  }
  
  //based on a mutation probability, picks a new random character in array spots
  void mutate(float m) {
    for (int i = 0; i < dna.length; i++) {
      if (random(1) < m) {
         dna[i] = random(0,1);
      }
    }
  }
}
