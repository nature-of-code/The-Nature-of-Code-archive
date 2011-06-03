// Wolfram Cellular Automata
// Daniel Shiffman <http://www.shiffman.net>

// A class to manage the CA

// Created 2 May 2005

class CA {

  int[] cells;     // An array of 0s and 1s 

  int[] rules;     // An array to store the ruleset, for example {0,1,1,0,1,1,0,1}
  int generation;

  CA(int[] r) {
    rules = r;
    cells = new int[width];
    restart();
  }
  
   CA() {
    cells = new int[width];
    //randomize();
    restart();
  }
  
  // Set the rules of the CA
  void setRules(int[] r) {
    rules = r;
  }
  
  // Make a random ruleset
  void randomize() {
    for (int i = 0; i < 8; i++) {
      rules[i] = int(random(2));
    }
  }
  
  // Reset to generation 0
  void restart() {
    for (int i = 0; i < cells.length; i++) {
      cells[i] = int(random(2));//0;
    }
    cells[cells.length/2] = 1;    // We arbitrarily start with just the middle cell having a state of "1"
    generation = 0;
  }

  // The process of creating the new generation
  void generate() {
    // First we create an empty array for the new values
    int[] nextgen = new int[cells.length];
    // For every spot, determine new state by examing current state, and neighbor states
    // Ignore edges that only have one neighor
    for (int i = 0; i < cells.length; i++) {
      int left = cells[(i-1+cells.length)%cells.length];   // Left neighbor state
      int me = cells[i];       // Current state
      int right = cells[(i+1)%cells.length];  // Right neighbor state
      nextgen[i] = rules(left,me,right); // Compute next generation state based on ruleset
    }
    // Copy the array into current value
    cells = (int[]) nextgen.clone();
    for (int i = 0; i < width; i++) {
     matrix[i][generation%height] = cells[i];
    }    
    
    generation++;
  }
  
  // Implementing the Wolfram rules
  // Could be improved and made more concise, but here we can explicitly see what is going on for each case
  int rules (int a, int b, int c) {
    if (a == 1 && b == 1 && c == 1) return rules[0];
    if (a == 1 && b == 1 && c == 0) return rules[1];
    if (a == 1 && b == 0 && c == 1) return rules[2];
    if (a == 1 && b == 0 && c == 0) return rules[3];
    if (a == 0 && b == 1 && c == 1) return rules[4];
    if (a == 0 && b == 1 && c == 0) return rules[5];
    if (a == 0 && b == 0 && c == 1) return rules[6];
    if (a == 0 && b == 0 && c == 0) return rules[7];
    return 0;
  }
  
}
