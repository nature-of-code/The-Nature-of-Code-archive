// Daniel Shiffman
// The Nature of Code
// http://www.shiffman.net/

Walker w;

void setup() {
  size(800,200);
  // Create a walker object
  w = new Walker();
  background(255);
}

void draw() {
  // Run the walker object
  for (int i = 0; i < 50; i++) {
  w.step();
  w.render();
  }
}


