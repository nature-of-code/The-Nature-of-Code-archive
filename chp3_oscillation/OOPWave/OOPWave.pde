// Sine Wave
// Daniel Shiffman <http://www.shiffman.net>


// Two wave objects
Wave wave0;
Wave wave1;

void setup() {
  size(200,200);
  smooth();
  // Initialize a wave with starting point, width, amplitude, and period
  wave0 = new Wave(new PVector(0,20),100,20,500);
  wave1 = new Wave(new PVector(50,150),160,40,220);

}

void draw() {
  background(255);
  
  // Update and display waves
  wave0.calculate();
  wave0.display();
  
  wave1.calculate();
  wave1.display();


}


