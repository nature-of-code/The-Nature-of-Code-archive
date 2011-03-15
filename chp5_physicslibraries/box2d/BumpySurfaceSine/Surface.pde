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

    float theta = 0;
    
    // This has to go backwards so that the objects  bounce off the top of the surface
    // This "edgechain" will only work in one direction!
    for (float x = width+10; x > -10; x -= 5) {

      // Doing some stuff with perlin noise to calculate a surface that points down on one side
      // and up on the other
      float y = map(cos(theta),-1,1,200,height-10);
      theta += 0.15;

      // The edge point in our window
      Vec2 screenEdge = new Vec2(x,y);
      // We store it for rendering
      surface.add(screenEdge);

      // Convert it to the box2d world and add it to our EdgeChainDef
      Vec2 edge = box2d.coordPixelsToWorld(screenEdge);
      edges.addVertex(edge);

    }
    edges.setIsLoop(false);   // We could make the edge a full loop
    edges.friction = 2.0;    // How much friction
    edges.restitution = 0.3; // How bouncy

    // The edge chain is now a body!
    BodyDef bd = new BodyDef();
    bd.position.set(0.0f,0.0f);
    Body body = box2d.world.createBody(bd);
    body.createShape(edges);

  }

  // A simple function to just draw the edge chain as a series of vertex points
  void display() {
    strokeWeight(2);
    stroke(0);
    noFill();
    beginShape();
    for (Vec2 v: surface) {
      vertex(v.x,v.y);
    }
    endShape();
  }

}


