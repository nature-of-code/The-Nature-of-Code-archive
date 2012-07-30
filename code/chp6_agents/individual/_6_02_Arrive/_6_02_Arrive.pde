// Seek_Arrive
// Daniel Shiffman <http://www.shiffman.net>
// Nature of Code, Spring 2011

// Two "vehicles" follow the mouse position

// Implements Craig Reynold's autonomous steering behaviors
// One vehicle "seeks"
// One vehicle "arrives"
// See: http://www.red3d.com/cwr/

Vehicle v;

void setup() {
  size(640, 360);
  v = new Vehicle(width/2, height/2);
  smooth();
}

void draw() {
  background(255);

  PVector mouse = new PVector(mouseX, mouseY);

  // Draw an ellipse at the mouse location
  fill(175);
  stroke(0);
  ellipse(mouse.x, mouse.y, 30, 30);

  // Call the appropriate steering behaviors for our agents
  v.arrive(mouse);
  v.update();
  v.display();
}
