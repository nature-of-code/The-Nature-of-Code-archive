
Network network;

void setup() {
  size(640, 360); 
  smooth();
  network = new Network(width/2, height/2);

  Neuron a = new Neuron(-300, 0);
  Neuron b = new Neuron(-200, 0);
  Neuron c = new Neuron(0, 100);
  Neuron d = new Neuron(0, -100);
  Neuron e = new Neuron(200, 0);
  Neuron f = new Neuron(300, 0);


  network.connect(a, b);
  network.connect(b, c);
  network.connect(b, d);
  network.connect(c, e);
  network.connect(d, e);
  network.connect(e, f);


  network.addNeuron(a);
  network.addNeuron(b);
  network.addNeuron(c);
  network.addNeuron(d);
  network.addNeuron(e);
  network.addNeuron(f);
}

void draw() {
  background(255);
  network.display();

  if (frameCount % 30 == 0) {
    network.feedforward(random(1));
  }
}

