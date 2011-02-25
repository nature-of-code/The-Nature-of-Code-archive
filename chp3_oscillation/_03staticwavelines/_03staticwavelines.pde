float theta = 0;
float thetaVel = 0.2;
float amplitude = 100;

size(400,200);
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

