// Wolfram Cellular Automata
// Daniel Shiffman <http://www.shiffman.net>

// Simple demonstration of a Wolfram 1-dimensional cellular automata
// When the system reaches bottom of the window, it restarts with a new ruleset
// Mouse click restarts as well

// Created 2 May 2005

CA ca;   // An instance object to describe the Wolfram basic Cellular Automata
int[][] matrix;
void setup() {
  size(900,300);
  background(255);
  // 110
  int[] ruleset = {0,1,1,0,1,1,1,0};    // An initial rule system

  // 30
  //int[] ruleset = {0,0,0,1,1,1,1,0};    // An initial rule system

  ca = new CA(ruleset);                 // Initialize CA
  
 matrix = new int[width][height];
  
  
}

void draw() {
  ca.generate();  // Generate the next level

  loadPixels();
  int off = 0;
  if (ca.generation > height) {
    off = ca.generation%height;
  }
  //println(off);
  for (int i = 0; i < width; i++) {
   for (int j = 0; j < height; j++) {
      int y = j - off;
      if (y < 0) y = height + y;
      if (matrix[i][j] == 0) pixels[i+y*width] = color(255);
      else pixels[i+y*width] = color(0);
   } 
  }
  updatePixels();
}

void mousePressed() {
  background(100);
  ca.randomize();
  ca.restart();
}


