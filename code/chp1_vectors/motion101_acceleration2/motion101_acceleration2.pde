Mover mover;

void setup() {
  size(800,200);
  smooth();
  background(255);
  mover = new Mover(); 
}

void draw() {
  noStroke();
  fill(255,5);
  rect(0,0,width,height);
  
  mover.update();
  mover.checkEdges();
  mover.display(); 
}

