float theta = 0;
float thetaVel = 0.1;
<<<<<<< HEAD
float amplitude = 100;

size(640,360);
=======

  size(640,360);
>>>>>>> fixing up chapter 3 examples for class
background(255);
smooth();

stroke(0);
strokeWeight(2);
noFill();

beginShape();
for (int x = 0; x <= width; x += 5) {
  float y = map(sin(theta),-1,1,0,height);
  vertex(x,y);
  theta +=thetaVel;
} 
endShape();

