// Seek_Arrive
// Daniel Shiffman <http://www.shiffman.net>
// Nature of Code, Spring 2011

Vehicle v;

ArrayList<PVector> targets;

void setup() {
  size(640, 360);
  smooth();
  makeTargets();

  v = new Vehicle(targets.size(), random(width), random(height));
}

void makeTargets() {
  targets = new ArrayList<PVector>();
  for (int i = 0; i < 8; i++) {
    targets.add(new PVector(random(width), random(height)));
  }
}

void draw() {
  background(255);

  rectMode(CENTER);
  stroke(0);
  fill(0, 50);
  rect(width/2, height/2, 36, 36);



  // Call the appropriate steering behaviors for our agents
  for (PVector target : targets) {
    fill(0, 50);
    stroke(0);
    ellipse(target.x, target.y, 30, 30);
  }
  v.steer(targets);
  v.update();
  v.display();
}

void mousePressed() {
  makeTargets();
}

