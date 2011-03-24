import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

ArrayList<Particle> particles;
Attractor attractor;

VerletPhysics2D physics;

void setup () {
  size (400, 400);
  smooth ();
  physics = new VerletPhysics2D ();
  physics.setDrag (0.01);
  

  // this is the center of the world
  Vec2D center = new Vec2D (width/2, height/2);
  // these are the world's dimensions
  Vec2D extent = new Vec2D (width/2-24, height/2-24);
  physics.setWorldBounds (Rect.fromCenterExtent (center, extent));
  
  particles = new ArrayList<Particle>();
  for (int i = 0; i < 50; i++) {
    particles.add(new Particle(random(width),random(height)));
  }
  
    physics.addBehavior(new AttractionBehavior(center, 400, 0.1));

  attractor = new Attractor (width/2,height/2);
  //attractor.lock();
}


void draw () {
  background (0);  
  physics.update ();

  
  attractor.display();
  for (Particle p: particles) {
    p.display();
  }
}

