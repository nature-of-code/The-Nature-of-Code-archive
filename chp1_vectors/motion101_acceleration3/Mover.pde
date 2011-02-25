class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float topspeed;
  
  float xoff,yoff;

  Mover() {
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    topspeed = 4;
    xoff = 1000;
    yoff = 0;
  }

  void update() {
    
   float ax = map(noise(xoff),0,1,-1,1);
   float ay = map(noise(yoff),0,1,-1,1);
   acceleration = new PVector(ax,ay);
   xoff += 0.01;
   yoff += 0.01;
    
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
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }
    
    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }

  }

}


