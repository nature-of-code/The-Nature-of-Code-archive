// Daniel Shiffman
// The Nature of Code
// http://www.shiffman.net/

float[] normal;

void setup() {
  size(200, 200);
  background(0);
  smooth();
}

void draw() {
  background(0);
  float e = 2.71828183f;                       //"e", see http://mathforum.org/dr.math/faq/faq.e.html for more info
  float[] normal = new float[width];           //use an array to store all the "y" values
  float m = 0;                                 //default mean of 0 
  float sd = 0.5 + mouseX / (float) width;     //standard deviation based on mouseX
  float xcoord = -3;                           //start the graph at -3
  for (int i = 0; i < normal.length; i++) {
    float sq2pi = sqrt(2*PI);                   //square root of 2 * PI
    float xmsq = -1*(xcoord-m)*(xcoord-m);      //-(x - mu)^2
    float sdsq = sd*sd;                         //variance (standard deviation squared)
    normal[i] = (1 / (sd * sq2pi)) * (pow(e, (xmsq/sdsq)));  //P(x) function
    xcoord += 6 / (float) width;                //increment x coordinate
  }

  // a little for loop that draws a line between each point on the graph
  for (int i = 0; i < normal.length-1; i++) {
    stroke(255);
    float x1 = i; 
    float x2 = i+1;
    float scal = height;    //scale the bell curve
    float y1 = (height-scal*normal[i])-4;
    float y2 = (height-scal*normal[i+1])-4;
    line(x1, y1, x2, y2);
  }
}

