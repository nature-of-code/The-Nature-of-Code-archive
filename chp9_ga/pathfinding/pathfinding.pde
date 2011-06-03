// Pathfinding w/ Genetic Algorithms
// Daniel Shiffman <http://www.shiffman.net>

// This example produces an obstacle course with a start and finish
// Virtual "creatures" are rewarded for making it closer to the finish
// a simple "pathfinding" AI program

// For ever creature, we grid out the screen and their DNA offers
// a steering vector for each cell on the screen

int gridscale = 24;              //scale of grid is 1/24 of screen size

// DNA needs one vector for every spot on the grid 
// (it's like a pixel array, but with vectors instead of colors)
int dnasize;

int lifetime;// = 200;  // How long should each generation live

// Global maxforce and maxspeed (hmmm, could make this part of DNA??)
float maxspeed = 4.0;
float maxforce = 1.0;

Population popul;  //population
int lifecycle;     //timer for cycle of generation
int recordtime;    //fastest time to target
Obstacle target;   //target location
Obstacle start;    //start location
int diam = 24;     //size of target

ArrayList obstacles;  //an array list to keep track of all the obstacles!

void setup() {
  size(640,480);
  smooth();
  
  dnasize = (width / gridscale) * (height / gridscale); 
  lifetime = width/2;

  //*initialize the globals*//
  lifecycle = 0;
  recordtime = lifetime;
  target = new Obstacle(width-diam-diam/2,height/2-diam/2,diam,diam);
  start = new Obstacle(diam/2,height/2-diam/2,diam,diam);

  //*create a population with a mutation rate, and population max*//
  int popmax = 1000;
  float mutationRate = 0.05f;
  popul = new Population(mutationRate,popmax);

  //*Create the obstacle course!*//
  
  obstacles = new ArrayList();
  obstacles.add(new Obstacle(width/4,40,10,height-80));
  obstacles.add(new Obstacle(width/2,0,10,height/2-10));
  obstacles.add(new Obstacle(width/2,height-height/2+10,10,height/2-10));
  obstacles.add(new Obstacle(2*width/3,height/2-height/8,10,height/4));
}

void draw() {
  background(255);

  //*DRAW THE START NAND TARGET*//
 start.render();
 target.render();
  
  //*DRAW THE OBSTACLES*//
  for (int i = 0; i < obstacles.size(); i++) {
    Obstacle obs = (Obstacle) obstacles.get(i);
    obs.render();
  }

  //**IF WE HAVEN'T REACHED THE END OF OUR LIVES, KEEP GOING!*//
  if (lifecycle < lifetime) {
    popul.live(obstacles);
    if ((popul.targetReached()) && (lifecycle < recordtime)) {
      recordtime = lifecycle;
    }
    lifecycle++;
    //**OTHERWISE, LET'S MAKE A NEW GENERATION*//
  } 
  else {
    lifecycle = 0;
    popul.calcFitness();
    popul.naturalSelection();
    popul.generate();
  }

  //DISPLAY SOME INFO
   textAlign(RIGHT);
   fill(0);
   text("Generation #:" + popul.getGenerations(),width-10,18);
   text("Cycles left:" + ((lifetime-lifecycle)/10),width-10,36);
   text("Record cycles: " + recordtime,width-10,54);
   
}

//**MOVE THE TARGET IF WE CLICK THE MOUSE**//
void mousePressed() {
  //obstacles.add(new Obstacle(mouseX,mouseY));
  target = new Obstacle(mouseX,mouseY,diam,diam);
  recordtime = lifetime;
}

