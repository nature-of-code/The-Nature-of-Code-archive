// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// PBox2D example

// A Particle

class Particle {

  // We need to keep track of a Body
  Body body;

  PVector[] trail;

  // Constructor
  Particle(float x_, float y_) {
    float x = x_;
    float y = y_;
    trail = new PVector[6];
    for (int i = 0; i < trail.length; i++) {
      trail[i] = new PVector(x,y);
    }

    // Add the box to the box2d world
    // Here's a little trick, let's make a tiny tiny radius
    // This way we have collisions, but they don't overwhelm the system
    makeBody(new Vec2(x,y),0.2f);
  }

  // This function removes the particle from the box2d world
  void killBody() {
    box2d.destroyBody(body);
  }

  // Is the particle ready for deletion?
  boolean done() {
    // Let's find the screen position of the particle
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Is it off the bottom of the screen?
    if (pos.y > height+20) {
      killBody();
      return true;
    }
    return false;
  }

  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);

    // Keep track of a history of screen positions in an array
    for (int i = 0; i < trail.length-1; i++) {
      trail[i] = trail[i+1];
    }
    trail[trail.length-1] = new PVector(pos.x,pos.y);

    // Draw particle as a trail
    beginShape();
    noFill();
    strokeWeight(2);
    stroke(0,150);
    for (int i = 0; i < trail.length; i++) {
      vertex(trail[i].x,trail[i].y);
    }
    endShape();
  }

  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center, float r) {
    // Define and create the body
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(center));
    body = box2d.createBody(bd);

    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(random(-1,1),random(-1,1)));

    // We'll make the shape a circle I guess (though we could have done rectangle, maybe faster?)
    CircleDef cd = new CircleDef();
    r = box2d.scalarPixelsToWorld(r);
    cd.radius = r;

    // Parameters that affect physics
    cd.density = 0.1f;
    cd.friction = 0.0f;    // Slippery when wet!
    cd.restitution = 0.5f;

    // We could use this if we want to turn collisions off
    //cd.filter.groupIndex = -10;

    // Attach that shape to our body!
    body.createShape(cd);
    body.setMassFromShapes();

  }

}


