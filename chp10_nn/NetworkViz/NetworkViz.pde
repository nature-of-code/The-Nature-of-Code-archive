
Network network;

void setup() {
  size(640, 360); 
  smooth();
  network = new Network(width/2,height/2);
  
  Neuron a = new Neuron(-200,0);
  Neuron b = new Neuron(0,100);
  Neuron c = new Neuron(0,-100);
  Neuron d = new Neuron(200,0);
  
  network.connect(a,b);
  network.connect(a,c);
  network.connect(b,d);
  network.connect(c,d);
  
  network.addNeuron(a);
  network.addNeuron(b);
  network.addNeuron(c);
  network.addNeuron(d);
}

void draw() {
  background(255);
  network.display();
}

