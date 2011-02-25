Particle p;

void setup() {
  size(200,200);
  p = new Particle(new PVector(width/2,20));
  background(255);
  smooth();
}

void draw() {
  background(255);
  
  p.run();
  if (p.isDead()) {
    println("Particle dead!"); 
  }
}



