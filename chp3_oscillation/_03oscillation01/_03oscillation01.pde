float angle = 0;
float aVelocity = 0.05;

void setup() {
  size(200,200);
  background(255);
  smooth();
}

void draw() {
  rectMode(CORNER);
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  
  float amplitude = 100;
  float x = amplitude * cos(angle);
  angle += aVelocity;
  
  ellipseMode(CENTER);
  stroke(0);
  fill(175);
  translate(width/2,height/2);
  line(0,0,x,0);
  ellipse(x,0,20,20);
}
