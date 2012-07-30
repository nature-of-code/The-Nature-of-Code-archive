class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;

  Mover() {
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    topspeed = 6;
  }
  
  void applyForce(PVector f) {
    acceleration = f;
  }
  
  void update() {
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
  }

  void display() {
    stroke(0);
    fill(175);
    ellipse(location.x,location.y,16,16);
  }

  void checkEdges() {

    if (location.x > width) {
      velocity.x*=-1;
      location.x = width;
    } 
    else if (location.x < 0) {
      velocity.x*=-1;
      location.x = 0;
    }

    if (location.y > height) {
      velocity.y*=-1;
      location.y = height;
    } 
    else if (location.y < 0) {
      velocity.y*=-1;
      location.y = 0;
    }

  }

}



