float theta = 0;
float thetaVel = 0.1;

size(640,360);
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

