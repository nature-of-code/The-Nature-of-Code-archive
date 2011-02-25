Mover m;

void setup() {
  size(200,200);
  smooth();
  background(255);
  m = new Mover(); 
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);

  if (mousePressed) {
    PVector wind = new PVector(random(0,0.1),0);
    m.applyForce(wind);
  }

  m.update();
  m.display();
  m.checkEdges();

}




