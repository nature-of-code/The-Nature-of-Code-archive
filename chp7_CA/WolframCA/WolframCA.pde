// Wolfram Cellular Automata
// Daniel Shiffman <http://www.shiffman.net>

// Simple demonstration of a Wolfram 1-dimensional cellular automata
// When the system reaches bottom of the window, it restarts with a new ruleset
// Mouse click restarts as well


CA ca;   // An instance object to describe the Wolfram basic Cellular Automata

void setup() {
  size(200,200);
  background(255);
  int[] ruleset = {0,1,0,1,1,0,1,0};    // An initial rule system
  ca = new CA(ruleset);                 // Initialize CA
}

void draw() {
  ca.render();    // Draw the CA
  ca.generate();  // Generate the next level
  
  if (ca.finished()) {   // If we're done, clear the screen, pick a new ruleset and restart
    background(255);
    ca.randomize();
    ca.restart();
  }
}

void mousePressed() {
  background(255);
  ca.randomize();
  ca.restart();
}
