// Interactive Selection
// http://www.genarts.com/karl/papers/siggraph91.html
// Daniel Shiffman <http://www.shiffman.net>

// The class for our "face", contains DNA sequence, fitness value, position on screen

// Fitness Function f(t) = t (where t is "time" mouse rolls over face)

class Face {

  DNA genes;      //face's DNA
  float fitness;  //how good is this face?
  float x,y;      //position on screen
  int wh = 70;    //size of rectangle enclosing face
  boolean rollover; //are we rolling over this face?

  //Create a new face
  Face(DNA dna, float x_, float y_) {
    genes = dna;
    x = x_; y = y_;
    fitness = 1;
  }

  //render the face
  void render() {
     /* ok, so here, we are using the elements from the "genes" to pick properties for this face
        such as: head size, color, eye position, etc.
        Now, since every gene is a floating point between 0 and 1, we scale those values
        appropriately.*/
    float r = genes.getGene(0)*70.0;
    color c = color(genes.getGene(1),genes.getGene(2),genes.getGene(3));
    float eye_y = genes.getGene(4)*5.0;
    float eye_x = genes.getGene(5)*10.0;
    float eye_size = genes.getGene(6)*10.0;
    color eyecolor = color(genes.getGene(4),genes.getGene(5),genes.getGene(6));
    color mouthColor = color(genes.getGene(7),genes.getGene(8),genes.getGene(9));
    float mouth_y = genes.getGene(10)*25.0;
    float mouth_x = genes.getGene(11)*50.0-25.0;
    float mouthw = genes.getGene(11)*50;
    float mouthh = genes.getGene(12)*10;
    
    //once we calculate all the above properties, we use those variables to draw rects, ellipses, etc.
    pushMatrix();
    translate(x,y);
    noStroke();
    
    //*draw the "head"*//
    smooth();
    fill(c);
    ellipseMode(CENTER);
    ellipse(0,0,r,r);

    //*draw the "eyes"*//
    fill(eyecolor);
    rectMode(CENTER);
    rect(-eye_x,-eye_y,eye_size,eye_size);
    rect( eye_x,-eye_y,eye_size,eye_size);

    //*draw the "mouth"*//
    fill(mouthColor);
    rectMode(CENTER);
    rect(mouth_x,mouth_y,mouthw,mouthh);

    //*draw the bounding box*//
    stroke(0.25);
    if (rollover) fill(0,0.25);
    else noFill();
    rectMode(CENTER);
    rect(0,0,wh,wh);
    popMatrix();

    //*write the fitness to the screen*//
    textFont(f);
    textAlign(CENTER);

    if (rollover) fill(0);
    else fill(0.25);
    text(int(fitness),x,y+70);

  }

  float getFitness() {
    return fitness;
  }

  DNA getGenes() {
    return genes;
  }

  //increment fitness if mouse is rolling over face
  void rollover(int mx, int my) {
    //using java.awt.Rectangle (see: http://java.sun.com/j2se/1.4.2/docs/api/java/awt/Rectangle.html)
    Rectangle r = new Rectangle(int(x-wh/2),int(y-wh/2),int(wh),int(wh));
    if (r.contains(mx,my)) {
      rollover = true;
      fitness += 0.25;
    } else {
      rollover = false;
    }
  }

}
