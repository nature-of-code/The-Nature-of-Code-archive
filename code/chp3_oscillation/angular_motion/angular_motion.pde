float angle = 0;
float aVelocity = 0;
float aAcceleration = 0.0001;

void setup() {
  size(640,360);
  smooth();
}

void draw() {
  background(255);


  fill(175);
  stroke(0);

  translate(width/2,height/2);
  rectMode(CENTER);
  rotate(angle);
  line(-150,0,150,0);
  ellipse(150,0,16,16);
  ellipse(-150,0,16,16);

  angle += aVelocity;
  aVelocity += aAcceleration;
}


