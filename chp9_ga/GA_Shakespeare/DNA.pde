// Genetic Algorithm, Evolving Shakespeare
// Daniel Shiffman <http://www.shiffman.net>

// A class to describe a psuedo-DNA, i.e. genotype
//   Here, a virtual organism's DNA is an array of character.
//   Functionality:
//      -- convert DNA into a string
//      -- calculate DNA's "fitness"
//      -- mate DNA with another set of DNA
//      -- mutate DNA

// Created 2 May 2005

class DNA {

  // The genetic sequence
  char[] dna;
  
  // Constructor (makes a random DNA)
  DNA(int num) {
    dna = new char[num];
    for (int i = 0; i < dna.length; i++) {
      dna[i] = (char) random(32,128);  // Pick from range of chars
    }
  }
  
  // Constructor #2, creates the instance based on an existing character array
  DNA(char[] newdna) {
    dna = (char []) newdna.clone();
  }
  
  // Converts character array to a String
  String getString() {
    return new String(dna);
  }
  
  // Fitness function (returns floating point % of "correct" characters)
  float fitness (String target) {
     int score = 0;
     for (int i = 0; i < dna.length; i++) {
        if (dna[i] == target.charAt(i)) {
          score++;
        }
     }
     float fitness = (float)score / (float)target.length();
     return fitness;
  }
  
  // Returns one element from char array 
  char getDNA(int index) {
    return dna[index];
  }
  
  // Crossover
  DNA mate(DNA partner) {
    // A new child
    char[] child = new char[dna.length];
    int crossover = int(random(dna.length)); // Pick a midpoint
    // Half from one, half from the other
    for (int i = 0; i < dna.length; i++) {
      if (i > crossover) child[i] = dna[i];
      else               child[i] = partner.getDNA(i);
    }
    // make a new DNA object
    DNA newdna = new DNA(child);
    return newdna;
  }
  
  // Based on a mutation probability, picks a new random character
  void mutate(float m) {
    for (int i = 0; i < dna.length; i++) {
      if (random(1) < m) {
        dna[i] = (char) random(32,128);
      }
    }
  }
}
