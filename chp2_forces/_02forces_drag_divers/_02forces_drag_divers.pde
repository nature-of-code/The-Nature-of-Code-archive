Mover[] movers = new Mover[5];

Liquid liquid;

void setup() {
  size(640, 360);
  smooth();
  reset();
  liquid = new Liquid(0, height/2, width, height/2, 0.1);
}

void draw() {
  background(255);

  liquid.display();

  for (int i = 0; i < movers.length; i++) {

    if (liquid.contains(movers[i])) {
      PVector drag = liquid.drag(movers[i]);
      movers[i].applyForce(drag);
    }

    // Gravity is scaled by mass here!
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
  
  fill(0);
  text("click mouse to reset",10,30);
}

void mousePressed() {
  reset();
}

void reset() {
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1, 5), 100+ i*100, 0);
  }
}







