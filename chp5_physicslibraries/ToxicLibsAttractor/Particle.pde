// class Spore extends the class "VerletParticle2D"
class Particle extends VerletParticle2D {

  float r;

  Particle (float x, float y) {
    super (x,y);
    r = 4;
    physics.addParticle(this);
    physics.addBehavior(new AttractionBehavior(this, r*4, -5f));
  }

  void display () {
    fill (255);
    stroke (255);
    ellipse (x, y, r*2, r*2);
  }
}

