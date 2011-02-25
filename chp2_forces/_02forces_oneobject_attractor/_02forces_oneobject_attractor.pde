Mover m;
Attractor a;

void setup() {
  size(200,200);
  smooth();
  background(255);
  m = new Mover(); 
  a = new Attractor();
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);


  PVector force = a.attract(m);
  m.applyForce(force);
  m.update();
 
  a.display();
 
  m.display();
  

}





