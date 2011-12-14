

class Neuron {
  PVector location;

  ArrayList<Connection> connections;

  Neuron(float x, float y) {
    location = new PVector(x, y);
    connections = new ArrayList<Connection>();
  }

  void addConnection(Connection c) {
    connections.add(c);
  } 

  void display() {
    stroke(0);
    strokeWeight(1);
    fill(0);
    ellipse(location.x, location.y, 16, 16);

    for (Connection c : connections) {
      c.display();
    }
  }
}

