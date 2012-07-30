Mover mover;

void setup() {
  size(800,200);
  smooth();
  mover = new Mover(); 
  background(255);
}

void draw() {
  noStroke();
  fill(255,5);
  rect(0,0,width,height);
  mover.update();
  mover.checkEdges();
  mover.display(); 
}

