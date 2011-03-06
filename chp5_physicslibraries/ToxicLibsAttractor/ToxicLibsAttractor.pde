import toxi.geom.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;

Particle p1;
Particle p2;
Attractor attractor;

VerletPhysics2D physics;

void setup () {
  size (400, 400);
  smooth ();
  physics = new VerletPhysics2D ();
  physics.setDrag (0.05f);

  // this is the center of the world
  Vec2D center = new Vec2D (width/2, height/2);
  // these are the world's dimensions
  Vec2D extent = new Vec2D (width/2, height/2);
  physics.setWorldBounds (Rect.fromCenterExtent (center, extent));

  p1 = new Particle (random(width),random(height));
  p2 = new Particle (random(width),random(height));
  attractor = new Attractor (width/2,height/2);
}


void draw () {
  background (0);  
  physics.update ();
  attractor.display();
  p1.display();
  p2.display();
}

