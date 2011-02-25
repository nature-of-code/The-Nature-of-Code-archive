float angle = 0;
float aVelocity = 0;
float aAcceleration = 0.0001;

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

  fill(175);
  stroke(0);

  translate(width/2,height/2);
  rectMode(CENTER);
  rotate(angle);
  line(-50,0,50,0);
  ellipse(50,0,8,8);
  ellipse(-50,0,8,8);

  angle += aVelocity;
  aVelocity += aAcceleration;
}


