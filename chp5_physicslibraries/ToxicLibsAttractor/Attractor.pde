class Attractor extends VerletParticle2D {

  float r;

  Attractor (float x, float y) {
    super (x,y);
    r = 24;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, width, 0.1));

  }

  void display () {
    smooth ();
    fill (150);
    noStroke ();
    ellipse (x, y, r*2, r*2);
  }
}

