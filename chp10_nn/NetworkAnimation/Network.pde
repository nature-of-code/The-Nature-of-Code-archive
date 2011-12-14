

class Network {
  ArrayList<Neuron> neurons;
  ArrayList<Connection> connections;
  PVector location;

  Network(float x, float y) {
    location = new PVector(x, y);
    neurons = new ArrayList<Neuron>();
    connections = new ArrayList<Connection>();
  }

  void addNeuron(Neuron n) {
    neurons.add(n);
  }

  void connect(Neuron a, Neuron b) {
    Connection c = new Connection(a, b, random(0,1));
    a.addConnection(c);
    connections.add(c);
  } 

  void feedforward(float input) {
    Neuron start = neurons.get(0);
    start.receive(input);
  }


  void display() {
    pushMatrix();
    translate(location.x, location.y);
    for (Neuron n : neurons) {
      n.display();
    }

    for (Connection c : connections) {
      c.display();
    }

    popMatrix();
  }
}

