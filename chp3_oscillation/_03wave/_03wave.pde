
float startTheta = 0;
float thetaVel = 0.04;

void setup() {
  size(640,360);
  smooth();
}

void draw() {
  background(255);

  startTheta += 0.02;
  float theta = startTheta;

 for (int x = 0; x <= width; x += 5) {
    float y = map(sin(theta),-1,1,0,height);
    stroke(0);
    fill(0,50);
    ellipse(x,y,10,10);
    theta += thetaVel;
  } 

}



