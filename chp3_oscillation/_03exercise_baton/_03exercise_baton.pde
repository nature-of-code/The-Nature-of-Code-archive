float angle = 0;			

void setup() {
  size(200,200);
  smooth();
}

void draw() {
  background(50);

  fill(175);
  stroke(255);
  rectMode(CENTER);
  translate(width/2,height/2);
  rotate(angle);
  line(-50,0,50,0);
  ellipse(50,0,8,8);
  ellipse(-50,0,8,8);

  angle += 0.05;
}

