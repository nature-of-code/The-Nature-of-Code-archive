Mover[] movers = new Mover[100];

Liquid liquid;

void setup() {
  size(600,200);
  smooth();
  background(255);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.1,5),0,0); 
  }
  liquid = new Liquid(300,0,50,200,0.01);
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);

  liquid.display();

  PVector wind = new PVector(0.001,0);
  PVector gravity = new PVector(0,0.1);
  for (int i = 0; i < movers.length; i++) {
    
    if (liquid.contains(movers[i])) {
      PVector drag = liquid.drag(movers[i]);
      movers[i].applyForce(drag);
    }

    movers[i].applyForce(wind);
    movers[i].applyForce(gravity);

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
  

}









