// Evolution EcoSystem
// Daniel Shiffman <http://www.shiffman.net>
// Spring 2007, The Nature of Code

// Creature class

class Bloop {
  PVector loc;   // Location
  DNA dna;        // DNA
  float timer;    // Life timer
  float xoff;     // for perlin noise
  float yoff;
  // DNA will determine size and maxspeed
  float r;
  float maxspeed;

  // Create a "bloop" creature
  Bloop(PVector l, DNA dna_) {
    loc = l.get();
    timer = 200.0;
    xoff = random(1000);
    yoff = random(1000);
    dna = dna_;
    // Gene 0 determines maxspeed and r
    // The bigger the bloop, the slower it is
    maxspeed = (1.0 - dna.getGene(0))*15;
    r = dna.getGene(0)*50;
  }

  void run() {
    update();
    borders();
    render();
  }

  // A bloop can find food and eat it
  void eat(Food f) {
    ArrayList  food = f.getFood();
    // Are we touching any food objects?
    for (int i = food.size()-1; i >= 0; i--) {
      PVector l = (PVector) food.get(i);
      float d = PVector.dist(loc,l);
      // If we are, juice up our strength!
      if (d < r/2) {
        timer += 100.0; 
        food.remove(i);
      }
    }
  }

  // At any moment there is a teeny, tiny chance a bloop will reproduce
  Bloop reproduce() {
    // asexual reproduction
    if (random(1) < 0.0005) {
      // Child is exact copy of single parent
      DNA childDNA = dna.copy();
      // Child DNA can mutate
      childDNA.mutate(0.01);
      return new Bloop(loc,childDNA);
    } 
    else {
      return null;
    }
  }

  // Method to update location
  void update() {
    // Simple movement based on perlin noise
    PVector vel = new PVector(noise(xoff)*maxspeed - maxspeed/2,noise(yoff)*maxspeed-maxspeed/2);
    xoff += 0.01;
    yoff += 0.01;

    loc.add(vel);
    // Death always looming
    timer -= 0.2;
  }

  // Wraparound
  void borders() {
    if (loc.x < -r) loc.x = width+r;
    if (loc.y < -r) loc.y = height+r;
    if (loc.x > width+r) loc.x = -r;
    if (loc.y > height+r) loc.y = -r; 
    //loc.x = constrain(loc.x,0,width); 
    //loc.y = constrain(loc.y,0,height); 
  }

  // Method to display
  void render() {
    ellipseMode(CENTER);
    noStroke();
    // Genes say something about color
    float blu = dna.getGene(1)*255;
    float rd = dna.getGene(2)*255;
    fill(rd,100,blu,timer);
    ellipse(loc.x,loc.y,r,r);
  }

  // Death
  boolean dead() {
    if (timer <= 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}


