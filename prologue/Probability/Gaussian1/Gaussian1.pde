// Daniel Shiffman
// The Nature of Code
// http://www.shiffman.net/

// Declare a Random number generator object
Random generator;

void setup() {
  size(200,200);
  background(0);
  generator = new Random();   //initialize generator
  smooth();
}

void draw() {
  // Create an alpha blended background
  fill(0,1);
  rect(0,0,width,height);
  
  // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
  float xloc = (float) generator.nextGaussian();
  
  float sd = 25;                //define a standard deviation
  float mean = width/2;         //define a mean value (middle of the screen along the x-axis)
  xloc = ( xloc * sd ) + mean;  //scale the gaussian random number by standard deviation and mean

  fill(255);
  noStroke();
  ellipse(xloc,height/2,8,8);   //draw an ellipse at our "normal" random location
}

