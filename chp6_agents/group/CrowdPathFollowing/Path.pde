// Path Following
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code, Spring 2009

class Path {

  // A Path is an arraylist of points (PVector objects)
  ArrayList points;
  // A path has a radius, i.e how far is it ok for the boid to wander off
  float radius;

  Path() {
    // Arbitrary radius of 20
    radius = 20;
    points = new ArrayList();
  }

  // Add a point to the path
  void addPoint(float x, float y) {
    PVector point = new PVector(x,y);
    points.add(point);
  }

  // Draw the path
  void display() {

    // Draw the radius as thick lines and circles

    // Draw end points
    for (int i = 0; i < points.size(); i++) {
      PVector point = (PVector) points.get(i);
      fill(175);
      noStroke();
      ellipse(point.x,point.y,radius*2,radius*2);
    }

    // Draw Polygon around path
    for (int i = 0; i < points.size(); i++) {
      PVector start = (PVector) points.get(i);
      // We're assuming path is a circle in this example
      PVector end = (PVector) points.get((i+1)%points.size());
      PVector line = PVector.sub(end,start);
      PVector normal = new PVector(line.y,-line.x);
      normal.normalize();
      normal.mult(radius);

      // Polygon has four vertices
      PVector a = PVector.add(start, normal);
      PVector b = PVector.add(end, normal);
      PVector c = PVector.sub(end, normal);
      PVector d = PVector.sub(start, normal);

      fill(175);
      noStroke();
      beginShape();
      vertex(a.x,a.y);
      vertex(b.x,b.y);
      vertex(c.x,c.y);
      vertex(d.x,d.y);
      endShape();
    }

    // Draw Regular Line
    stroke(0);
    noFill();
    beginShape();
    for (int i = 0; i < points.size(); i++) {
      PVector loc = (PVector) points.get(i);
      vertex(loc.x,loc.y);
    }
    endShape(CLOSE);

  }

}





