class Leaf {
  PVector loc;

  Leaf(PVector l) {
    loc = l.get();
  }

  void display() {
    noStroke();
    fill(50,100);
    ellipse(loc.x,loc.y,4,4);   
  }
}

