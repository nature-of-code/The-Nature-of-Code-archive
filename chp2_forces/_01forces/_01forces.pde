Mover m;

void setup() {
  size(640,360);
  smooth();
  m = new Mover(); 
}

void draw() {
  background(255);

  if (mousePressed) {
    PVector wind = new PVector(random(0,0.1),0);
    m.applyForce(wind);
  }

  m.update();
  m.display();
  m.checkEdges();

}




