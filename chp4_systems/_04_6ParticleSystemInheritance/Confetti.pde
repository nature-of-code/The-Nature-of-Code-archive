class Confetti extends Particle {

  // We could add variables for only Confetti here if we so

  Confetti(PVector l) {
    super(l);
  }

  // Inherits update() from parent

  // Override the display method
  void display() {
    rectMode(CENTER);
    fill(0,lifespan);
    stroke(0,lifespan);
    pushMatrix();
    translate(location.x,location.y);
    float theta = map(location.x,0,width,0,TWO_PI*2);
    rotate(theta);
    rect(0,0,8,8);
    popMatrix();
  }
}

