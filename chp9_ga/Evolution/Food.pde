// Evolution EcoSystem
// Daniel Shiffman <http://www.shiffman.net>
// Spring 2007, The Nature of Code

// A collection of food in the world

class Food {
  ArrayList food;
 
  Food(int num) {
    // Start with some food
    food = new ArrayList();
    for (int i = 0; i < num; i++) {
       food.add(new PVector(random(width),random(height))); 
    }
  } 
  
  // Add some food at a location
  void add(PVector l) {
     food.add(l.get()); 
  }
  
  // Display the food
  void run() {
    for (int i = 0; i < food.size(); i++) {
       PVector loc = (PVector) food.get(i);
       rectMode(CENTER);
       fill(199,218,236);
       rect(loc.x,loc.y,8,8);
    } 
    
    // There's a small chance food will appear randomly
    if (random(1) < 0.001) {
       food.add(new PVector(random(width),random(height))); 
    }
  }
  
  // Return the list of food
  ArrayList getFood() {
    return food; 
  }
}
