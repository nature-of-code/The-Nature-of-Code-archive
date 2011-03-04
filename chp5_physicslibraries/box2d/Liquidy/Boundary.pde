// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// PBox2D example

// A fixed boundary class (now incorporates angle)

class Boundary {

  // A boundary is a simple rectangle with x,y,width,and height
  float x;
  float y;
  float w;
  float h;
  // But we also have to make a body for box2d to know about it
  Body b;

  Boundary(float x_,float y_, float w_, float h_, float angle) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;

    // Figure out the box2d coordinates
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    Vec2 center = new Vec2(x,y);

    // Define the polygon
    PolygonDef sd = new PolygonDef();
    sd.setAsBox(box2dW, box2dH);
    sd.density = 0;    // No density means it won't move!
    sd.friction = 0.3f;

    // Create the body
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(center));
    bd.angle = angle;
    b = box2d.createBody(bd);
    b.createShape(sd);
  }

  // Draw the boundary, if it were at an angle we'd have to do something fancier
  void display() {
    noFill();
    stroke(0);
    strokeWeight(1);
    rectMode(CENTER);

    float a = b.getAngle();

    pushMatrix();
    translate(x,y);
    rotate(-a);
    rect(0,0,w,h);
    popMatrix();
  }

}


