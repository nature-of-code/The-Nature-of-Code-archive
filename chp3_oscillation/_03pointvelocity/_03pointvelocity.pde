Mover mover;

void setup() {
  size(640,360);
  smooth();
  mover = new Mover(); 
}

void draw() {
  background(255);
<<<<<<< HEAD
=======

>>>>>>> fixing up chapter 3 examples for class
  
  mover.update();
  mover.checkEdges();
  mover.display(); 
}


