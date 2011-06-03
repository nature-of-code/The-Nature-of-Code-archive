// Pathfinding w/ Genetic Algorithms
// Daniel Shiffman <http://www.shiffman.net>

// DNA is an array of vectors

class DNA {

  //The genetic sequence
  PVector[] dna;
  
  //Constructor (makes a DNA of random Vectors)
  DNA(int num) {
    dna = new PVector[num];
    for (int i = 0; i < dna.length; i++) {
      dna[i] = new PVector(random(-1,1),random(-1,1));
      dna[i].normalize();
    }
  }
  
  //Constructor #2, creates the instance based on an existing array
  DNA(PVector[] newdna) {
    //dna = (PVector []) newdna.clone();  //not working as an applet?
    dna = newdna;
  }
  
  //returns one element from char array 
  PVector getGene(int index) {
    // just doing some error handling
    if (index < dna.length) return dna[index].get();
    else return new PVector(0,0);
  }
  
  //**CROSSOVER***//
  //creates new DNA sequence from two (this & and a partner)
  DNA mate(DNA partner) {
    PVector[] child = new PVector[dna.length];
    //*pick a midpoint*//
    int crossover = int(random(dna.length));
    //*take "half" from one and "half" from the other*//
    for (int i = 0; i < dna.length; i++) {
      if (i > crossover) child[i] = getGene(i);
      else               child[i] = partner.getGene(i);
    }
    
    DNA newdna = new DNA(child);
    return newdna;
  }
  
  //based on a mutation probability, picks a new random Vector
  void mutate(float m) {
    for (int i = 0; i < dna.length; i++) {
      if (random(1) < m) {
         dna[i] = new PVector(random(-1,1),random(-1,1));
         dna[i].normalize();
      }
    }
  }
}
