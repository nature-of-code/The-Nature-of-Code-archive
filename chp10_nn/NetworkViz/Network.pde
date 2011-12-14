

class Network {
  ArrayList<Neuron> neurons;
  PVector location;

  Network(float x, float y) {
    location = new PVector(x,y);
    neurons = new ArrayList<Neuron>();
  }
  
  void addNeuron(Neuron n) {
    neurons.add(n);
  }
  
  void connect(Neuron a, Neuron b) {
    Connection c = new Connection(a, b, random(1));
    a.addConnection(c);
  } 


  void display() {
    pushMatrix();
    translate(location.x, location.y);
    for (Neuron n : neurons) {
      n.display();
    }
    popMatrix();
  }
}

