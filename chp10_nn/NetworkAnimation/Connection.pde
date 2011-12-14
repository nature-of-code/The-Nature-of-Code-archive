class Connection {
  float weight;
  Neuron a;
  Neuron b;

  boolean sending = false;
  PVector sender;
  float output = 0;

  Connection(Neuron from, Neuron to, float w) {
    weight = w;
    a = from;
    b = to;
  }

  void send(float val) {
    output = val*weight;
    sender = a.location.get();
    sending = true;
  }

  void display() {
    stroke(0);
    strokeWeight(1+weight*4);
    line(a.location.x, a.location.y, b.location.x, b.location.y);

    if (sending) {
      fill(0);
      strokeWeight(1);
      ellipse(sender.x, sender.y, 8, 8);

      sender.x = lerp(sender.x, b.location.x, 0.1);
      sender.y = lerp(sender.y, b.location.y, 0.1);
      float d = PVector.dist(sender, b.location);
      if (d < 1) {
        b.receive(output);
        sending = false;
      }

    }
  }
}

