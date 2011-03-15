// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// PBox2D example

// A rectangular box
class Lollipop {

  // We need to keep track of a Body and a width and height
  Body body;

  // Constructor
  Lollipop(float x, float y) {
    // Add the box to the box2d world
    makeBody(new Vec2(x,y));
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
    if (pos.y > height) {
      killBody();
      return true;
    }
    return false;
  }

  // Drawing the box
  void display() {
    // We look at each body and get its screen position
    Vec2 pos = box2d.getBodyPixelCoord(body);
    // Get its angle of rotation
    float a = body.getAngle();
   
    // Ask for the shape
    PolygonShape ps = (PolygonShape) body.getShapeList();
    // Get the array of vertices
    Vec2[] vertices = ps.m_vertices;

    rectMode(CENTER);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    fill(175);
    stroke(0);
    beginShape();
    // For every vertex, convert to pixel vector
    for (int i = 0; i < vertices.length; i++) {
      Vec2 v = box2d.vectorWorldToPixels(vertices[i]);
      vertex(v.x,v.y);
    }
    endShape(CLOSE);
    popMatrix();
  }

  // This function adds the rectangle to the box2d world
  void makeBody(Vec2 center) {

    // Define a polygon (this is what we use for a rectangle)
    PolygonDef sd = new PolygonDef();
    sd.addVertex(box2d.vectorPixelsToWorld(new Vec2(-15,25)));
    sd.addVertex(box2d.vectorPixelsToWorld(new Vec2(10,5)));
    sd.addVertex(box2d.vectorPixelsToWorld(new Vec2(15,0)));
    sd.addVertex(box2d.vectorPixelsToWorld(new Vec2(20,-15)));
    sd.addVertex(box2d.vectorPixelsToWorld(new Vec2(-10,-10)));


    // Parameters that affect physics
    sd.density = 1.0f;
    sd.friction = 0.3f;
    sd.restitution = 0.5f;

    // Define the body and make it from the shape
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(center));

    body = box2d.createBody(bd);
    body.createShape(sd);
    body.setMassFromShapes();

    // Give it some initial random velocity
    body.setLinearVelocity(new Vec2(random(-5,5),random(2,5)));
    body.setAngularVelocity(random(-5,5));
  }
}


