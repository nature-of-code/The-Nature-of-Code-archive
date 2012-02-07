// Nature of Code 2011
// Daniel Shiffman
// Chapter 3: Asteroids exercise
// http://www.shiffman.net

// Mover object
Spaceship ship;

void setup() {
  size(640, 360);
  smooth();
  ship = new Spaceship();
}

void draw() {
  background(50); 
  
  // Update location
  ship.update();
  // Wrape edges
  ship.wrapEdges();
  // Draw ship
  ship.display();
   

  fill(255);
  text("left right arrows to turn, up to thrust",10,height-5);

  // Turn or thrust the ship depending on what key is pressed
  if (keyPressed) {
    if (key == CODED && keyCode == LEFT) {
      ship.turn(-0.03);
    } else if (key == CODED && keyCode == RIGHT) {
      ship.turn(0.03);
    } else if (key == CODED && keyCode == UP) {
      ship.thrust(); 
    }
  }
}


// Nature of Code 2011
// Daniel Shiffman
// Chapter 3: Asteroids

class Spaceship { 
  // All of our regular motion stuff
  PVector location;
  PVector velocity;
  PVector acceleration;

  // Arbitrary damping to slow down ship
  float damping = 0.995;
  float topspeed = 6;

  // Variable for heading!
  float heading = 0;

  // Size
  float r = 16;

  // Are we thrusting (to color boosters)
  boolean thrust = false;

  Spaceship() {
    location = new PVector(width/2,height/2);
    velocity = new PVector();
    acceleration = new PVector();
  } 

  // Standard Euler integration
  void update() { 
    velocity.add(acceleration);
    velocity.mult(damping);
    velocity.limit(topspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  // Newton's law: F = M * A
  void applyForce(PVector force) {
    PVector f = force.get();
    //f.div(mass); // ignoring mass right now
    acceleration.add(f);
  }

  // Turn changes angle
  void turn(float a) {
    heading += a;
  }
  
  // Apply a thrust force
  void thrust() {
    // Offset the angle since we drew the ship vertically
    float angle = heading - PI/2;
    // Polar to cartesian for force vector!
    PVector force = new PVector(cos(angle),sin(angle));
    force.mult(0.1);
    applyForce(force); 
    // To draw booster
    thrust = true;
  }

  void wrapEdges() {
    float buffer = r*2;
    if (location.x > width +  buffer) location.x = -buffer;
    else if (location.x <    -buffer) location.x = width+buffer;
    if (location.y > height + buffer) location.y = -buffer;
    else if (location.y <    -buffer) location.y = height+buffer;
  }


  // Draw the ship
  void display() { 
    stroke(255);
    pushMatrix();
    translate(location.x,location.y+r);
    rotate(heading);
    fill(100);
    if (thrust) fill(255,0,0);
    // Booster rockets
    rect(-r/2,r,r/3,r/2);
    rect(r/2,r,r/3,r/2);
    fill(100);
    // A triangle
    beginShape();
    vertex(-r,r);
    vertex(0,-r);
    vertex(r,r);
    endShape(CLOSE);
    rectMode(CENTER);
    popMatrix();
    
    thrust = false;
  }
}


