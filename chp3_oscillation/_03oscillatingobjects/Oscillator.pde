class Oscillator  {   

  PVector angle;
  PVector velocity;
  PVector amplitude;

  Oscillator()  {   
    angle = new PVector();
    velocity = new PVector(random(-0.05,0.05),random(-0.05,0.05));
    amplitude = new PVector(random(width/2),random(height/2));    
  }   

  void oscillate()  {
    angle.add(velocity);
  }   

  void display()  {   
    
    float x = sin(angle.x)*amplitude.x;
    float y = sin(angle.y)*amplitude.y;
    
    pushMatrix();
    translate(width/2,height/2);
    stroke(0);
    fill(175);
    // draw circle and line
    line(0,0,x,y);  
    ellipse(x,y,16,16);  
    popMatrix();
  }
}   



