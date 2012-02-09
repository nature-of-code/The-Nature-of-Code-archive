/**
 * PolarToCartesian
 * by Daniel Shiffman.  
 * 
 * Convert a polar coordinate (r,theta) to cartesian (x,y):  
 * x = r * cos(theta)
 * y = r * sin(theta)
 */
 
float r;
float theta;


void setup() {
  size(640, 360);
  smooth();
  
  // Initialize all values
  r = height * 0.45;
  theta = 0;
}

void draw() {
  
  background(0);
  
  // The radius is the distance between the mouse and the center of the window
  r = dist(mouseX,mouseY,width/2,height/2);
  
  // Translate the origin point to the center of the screen
  translate(width/2, height/2);
  
  // Convert polar to cartesian
  float x = r * cos(theta);
  float y = r * sin(theta);
  
  // Draw the ellipse at the cartesian coordinate
  ellipseMode(CENTER);
  fill(200);
  stroke(255);
  line(0,0,x,y);
  ellipse(x, y, 32, 32);
  
  // Increase the angle over time
  theta += 0.02;
  

}




