// Random Walker (No Vectors)
// Daniel Shiffman <http://www.shiffman.net>
// The Nature of Code

// A random walker class!

class Walker {
  PVector location;

  ArrayList<PVector> history;
  
  PVector noff;


  Walker() {
    location = new PVector(width/2, height/2);
    history = new ArrayList<PVector>();
    noff = new PVector(random(1000),random(1000));
  }

  void display() {
    stroke(0);
    fill(175);
    rectMode(CENTER);
    rect(location.x, location.y, 16, 16);

    beginShape();
    stroke(0);
    noFill();
    for (PVector v: history) {
      vertex(v.x, v.y);
    }
    endShape();
  }

  // Randomly move up, down, left, right, or stay in one place
  void walk() {
    
    location.x = map(noise(noff.x),0,1,0,width);
    location.y = map(noise(noff.y),0,1,0,height);
    
    noff.add(0.01,0.01,0);
    

    history.add(location.get());
    if (history.size() > 1000) {
      history.remove(0);
    }
  }
}

