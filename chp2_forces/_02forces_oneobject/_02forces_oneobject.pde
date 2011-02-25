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

  PVector wind = new PVector(0.001,0);
  PVector gravity = new PVector(0,0.1);
  m.applyForce(wind);
  m.applyForce(gravity);


  m.update();
  m.display();
  m.checkEdges();

}





