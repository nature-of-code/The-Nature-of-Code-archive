// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// PBox2D example

// An uneven surface boundary

class Surface {
  // We'll keep track of all of the surface points
  ArrayList<Vec2> surface;


  Surface() {
    surface = new ArrayList<Vec2>();

    // This is what box2d uses to put the surface in its world
    EdgeChainDef edges = new EdgeChainDef();

    // Demonstrating addVertex() by just putting in 3 vertices
    Vec2 v1 = new Vec2(width,height/2);
    Vec2 v2 = new Vec2(width/2,height/2+50);
    Vec2 v3 = new Vec2(0,height/2+50);
    
    edges.addVertex(box2d.coordPixelsToWorld(v1));
    edges.addVertex(box2d.coordPixelsToWorld(v2));
    edges.addVertex(box2d.coordPixelsToWorld(v3));
    
    surface.add(v1);
    surface.add(v2);
    surface.add(v3);

    edges.setIsLoop(false);   // We could make the edge a full loop
    edges.friction = 2.0;    // How much friction
    edges.restitution = 0.3; // How bouncy

    // The edge chain is now a body!
    BodyDef bd = new BodyDef();
    Body body = box2d.world.createBody(bd);
    body.createShape(edges);

  }

  // A simple function to just draw the edge chain as a series of vertex points
  void display() {
    strokeWeight(1);
    stroke(0);
    noFill();
    beginShape();
    for (Vec2 v: surface) {
      vertex(v.x,v.y);
    }
    endShape();
  }
}


