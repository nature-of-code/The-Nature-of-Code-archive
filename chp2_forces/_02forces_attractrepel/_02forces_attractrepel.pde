Mover[] movers = new Mover[20];

Attractor a;

float g = 1;

void setup() {
  size(400,400);
  smooth();
  background(255);
  a = new Attractor();
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(4,12),random(width),random(height)); 
  }
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);

  a.display();


  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force = movers[j].repel(movers[i]);
        movers[i].applyForce(force);
      }
    }

    PVector force = a.attract(movers[i]);
    movers[i].applyForce(force);

    movers[i].update();
    //movers[i].checkEdges();
    movers[i].display();
  }

  

}














