// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2010
// PBox2D example

// ContactListener to listen for collisions!

class CustomListener implements ContactListener {
  CustomListener(){

  }

  // This function is called when a new collision occurs
  void add(ContactPoint cp) {
    // Get both shapes
    Shape s1 = cp.shape1;
    Shape s2 = cp.shape2;
    // Get both bodies
    Body b1 = s1.getBody();
    Body b2 = s2.getBody();
    // Get our objects that reference these bodies
    Object o1 = b1.getUserData();
    Object o2 = b2.getUserData();
    
    // What class are they?  Box or Particle?
    String c1 = o1.getClass().getName();
    String c2 = o2.getClass().getName();
    
    // If object 1 is a Box, then object 2 must be a particle
    // Note we are ignoring particle on particle collisions
    if (c1.contains("Box")) {
      Particle p = (Particle) o2;
      p.change();
    } 
    // If object 2 is a Box, then object 1 must be a particle
    else if (c2.contains("Box")) {
      Particle p = (Particle) o1;
      p.change();
    }
  }


  // Contacts continue to collide - i.e. resting on each other
  void persist(ContactPoint cp)  {
  }

  // Objects stop touching each other
  void remove(ContactPoint cp)  {
  }

  // Contact point is resolved into an add, persist etc
  void result(ContactResult cr) {

  }
}






