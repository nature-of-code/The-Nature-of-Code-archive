// Noise Walker
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code

Walker w;

void setup() {
  size(800,200);
  smooth();
  frameRate(30);

  // Create a walker object
  w = new Walker();
  background(255);

}

void draw() {
  noStroke();
  fill(255,5);
  rect(0,0,width,height);

  // Run the walker object
  w.walk();
  w.display();
}



