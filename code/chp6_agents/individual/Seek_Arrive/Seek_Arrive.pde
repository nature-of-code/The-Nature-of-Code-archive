// Seek_Arrive
// Daniel Shiffman <http://www.shiffman.net>
// Nature of Code, Spring 2011

// Two "vehicles" follow the mouse position

// Implements Craig Reynold's autonomous steering behaviors
// One vehicle "seeks"
// One vehicle "arrives"
// See: http://www.red3d.com/cwr/

Vehicle seeker;
Vehicle arriver;

void setup() {
  size(640,360);
  seeker = new Vehicle(width/2,height/2);
  arriver = new Vehicle(width/2,height/2);
  smooth();
}

void draw() {
  background(255);
  
  // Draw an ellipse at the mouse location
  int mx = mouseX;
  int my = mouseY;
  fill(175);
  stroke(0);
  ellipse(mx,my,30,30);
  
  // Call the appropriate steering behaviors for our agents
  seeker.seek(new PVector(mx,my));
  seeker.update();
  seeker.display();
  
  arriver.arrive(new PVector(mx,my));
  arriver.update();
  arriver.display();
}


