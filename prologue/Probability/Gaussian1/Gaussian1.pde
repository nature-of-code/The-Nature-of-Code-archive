// Daniel Shiffman
// The Nature of Code
// http://www.shiffman.net/

// Declare a Random number generator object
Random generator;

void setup() {
  size(640, 360);
  background(0);
  generator = new Random();   //initialize generator
  smooth();
}

void draw() {

  // Get a gaussian random number w/ mean of 0 and standard deviation of 1.0
  float xloc = (float) generator.nextGaussian();

  float sd = 60;                //define a standard deviation
  float mean = width/2;         //define a mean value (middle of the screen along the x-axis)
  xloc = ( xloc * sd ) + mean;  //scale the gaussian random number by standard deviation and mean

    noStroke();
  fill(255, 10);
  ellipse(xloc, height/2, 16, 16);   //draw an ellipse at our "normal" random location
  
}



