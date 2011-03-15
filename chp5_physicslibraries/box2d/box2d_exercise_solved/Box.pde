// A rectangular box
class Box {
  //  Instead of any of the usual variables, we will store a reference to a Box2D Body
  Body body;      

  float w,h;

  Box(float x, float y) {
    w = 16;
    h = 16;

    // Build Body
    BodyDef bd = new BodyDef();			
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    body = box2d.createBody(bd);

    // Build Shape
    PolygonDef sd = new PolygonDef();			
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);	// Box2D considers the width and height of a
    sd.setAsBox(box2dW, box2dH);		        // rectangle to be the distance from the
    sd.density = 1.0;					// center to the edge (so half of what we
    sd.friction = 0.3;					// normally think of as width or height.) 

    sd.restitution = 0.5; 				
    // Attach Shape to Body						   
    body.createShape(sd);					
    body.setMassFromShapes();
  }

  void display() {
    // We need the Body’s location and angle
    Vec2 pos = box2d.getBodyPixelCoord(body);		
    float a = body.getAngle();

    pushMatrix();
    translate(pos.x,pos.y);		// Using the Vec2 position and float angle to
    rotate(-a);			        // translate and rotate the rectangle
    fill(175);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,w,h);
    popMatrix();
  }

}

