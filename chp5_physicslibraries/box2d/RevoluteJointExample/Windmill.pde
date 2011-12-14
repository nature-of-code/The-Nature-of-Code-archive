// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// PBox2D example

// Class to describe a fixed spinning object

class Windmill {

  // Our object is two boxes and one joint
  // Consider making the fixed box much smaller and not drawing it
  RevoluteJoint joint;
  Box box1;
  Box box2;

  Windmill(float x, float y) {

    // Initialize locations of two boxes
    box1 = new Box(x,y,120,10,false); 
    box2 = new Box(x,y,10,40,true); 

    // Define joint as between two bodies
    RevoluteJointDef rjd = new RevoluteJointDef();
    rjd.body1 = box1.body;
    rjd.body2 = box2.body;
    
    // Set the points that anchor the joint to the bodies
    Vec2 v1 = box2d.coordPixelsToWorld(x,y);
    rjd.localAnchor1 = box1.body.getLocalPoint(v1);
    Vec2 v2 = box2d.coordPixelsToWorld(x,y-20);
    rjd.localAnchor2 = box1.body.getLocalPoint(v2);
    
    // Turning on a motor (optional)
    rjd.motorSpeed = PI*2;       // how fast?
    rjd.maxMotorTorque = 1000.0; // how powerful?
    rjd.enableMotor = true;      // is it on?
    
    // There are many other properties you can set for a Revolute joint
    // For example, you can limit its angle between a minimum and a maximum
    // See box2d manual for more
    
    // Create the joint
    joint = (RevoluteJoint) box2d.world.createJoint(rjd);
  }
  
  // Turn the motor on or off
  void toggleMotor() {
    joint.enableMotor(!joint.isMotorEnabled());
  }
  
  boolean motorOn() {
    return joint.isMotorEnabled();
  }


  void display() {
    box2.display();
    box1.display();
  }
}

