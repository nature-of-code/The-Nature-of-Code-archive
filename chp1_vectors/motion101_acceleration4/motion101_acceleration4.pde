Mover mover;

void setup() {
  size(200,200);
  smooth();
  background(255);
  mover = new Mover(); 
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
  mover.update();
  mover.checkEdges();
  mover.display(); 
}

