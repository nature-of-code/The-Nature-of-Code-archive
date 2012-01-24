import processing.opengl.*;

Mover[] movers = new Mover[10];

Attractor a;

float angle = 0;

void setup() {
  size(400,400,OPENGL);
  smooth();
  background(255);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,2),random(-width/2,width/2),random(-height/2,height/2),random(-100,100)); 
  }
  a = new Attractor();
}

void draw() {
  background(0);
  sphereDetail(8);
  lights();
  translate(width/2,height/2);
  rotateY(angle);

  
  a.display();

  for (int i = 0; i < movers.length; i++) {
    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);

    movers[i].update();
    movers[i].display();
  }
  
  angle += 0.003;

}











// Attraction
// Daniel Shiffman <http://www.shiffman.net>

// A class for a draggable attractive body in our world

class Attractor {
  float mass;         // Mass, tied to size
  PVector location;   // Location
  float g;

  Attractor() {
    location = new PVector(0,0);
    mass = 20;
    g = 0.4;
  }


  PVector attract(Mover m) {
    PVector force = PVector.sub(location,m.location);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance,5.0,25.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = (g * mass * m.mass) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    return force;
  }

  // Method to display
  void display() {
    stroke(255);
    noFill();
    pushMatrix();
    translate(location.x,location.y,location.z);
    sphere(mass*2);
    popMatrix();
  }
}


class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover(float m, float x, float y, float z) {
    mass = m;
    location = new PVector(x,y,z);
    velocity = new PVector(1,0);
    acceleration = new PVector(0,0);
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    noStroke();
    fill(255);
    pushMatrix();
    translate(location.x,location.y,location.z);
    sphere(mass*8);
    popMatrix();
  }

  void checkEdges() {

    if (location.x > width) {
      location.x = 0;
    } 
    else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    }
  }
}



