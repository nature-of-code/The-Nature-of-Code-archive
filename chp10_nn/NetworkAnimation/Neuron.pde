

class Neuron {
  PVector location;

  ArrayList<Connection> connections;
  
  float output = 0;
  
  float r = 32;
  
  Neuron(float x, float y) {
    location = new PVector(x, y);
    connections = new ArrayList<Connection>();
  }

  void addConnection(Connection c) {
    connections.add(c);
  } 
  
  void receive(float input) {
    output += input;
    if (output > 1) {
      fire();
      output = 0;
    } 
  }
  
  void fire() {
    r = 64;
    for (Connection c : connections) {
       c.send(output);
    } 
  }
  
  
  

  void display() {
    stroke(0);
    strokeWeight(1);
    float b = map(output,0,1,255,0);
    fill(b);
    ellipse(location.x, location.y, r, r);
    
    r = lerp(r,32,0.1);
  }
}

