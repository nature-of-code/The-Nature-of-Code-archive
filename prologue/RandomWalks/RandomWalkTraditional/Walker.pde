// Daniel Shiffman
// The Nature of Code
// http://www.shiffman.net/

// A random walker object!

class Walker {
  int x,y;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void render() {
    stroke(255);
    point(x,y);
  }

  // Randomly move up, down, left, right, or stay in one place
  void walk() {
    int vx = int(random(3))-1;
    int vy = int(random(3))-1;
    x += vx;
    y += vy;
    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
  }
}
