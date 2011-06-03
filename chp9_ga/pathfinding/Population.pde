// Pathfinding w/ Genetic Algorithms
// Daniel Shiffman <http://www.shiffman.net>

// A class to describe a population of "creatures"

class Population {

  int MAX;                      //population maximum
  float mutationRate;           //mutation rate
  Creature[] population;        //array to hold the current population
  ArrayList darwin;             //ArrayList which we will use for our "mating pool"
  int generations;              //number of generations

  int countfinished;            //keep track of the order of creature's finishing the maze

  //*INITIALIZE THE POPULATION*//
  Population(float m, int num) {
    mutationRate = m;
    MAX = num;
    population = new Creature[MAX];
    darwin = new ArrayList();
    generations = 0;
    //make a new set of creatures
    for (int i = 0; i < population.length; i++) {
      population[i] = new Creature(new PVector(start.r.x+start.r.width/2,start.r.y+start.r.height/2), new DNA(dnasize),population.length);
    }
    countfinished = 1;  //the first one to finish will be #1
  }

  void live(ArrayList o) {
    //For every creature
    for (int i = 0; i < population.length; i++) {
      //if it finishes, mark it down as done!
      if ((population[i].finished()) && (!population[i].stopped())) {
        population[i].setFinish(countfinished);
        countfinished++;
      }
      //run it
      population[i].run(o);
    }
  }

  //did anything finish?
  boolean targetReached() {
    for (int i = 0; i < population.length; i++) {
      if (population[i].finished()) return true;
    }
    return false;
  }

  //calculate fitness for each creature
  void calcFitness() {
    for (int i = 0; i < population.length; i++) {
      population[i].calcFitness();
    }
    countfinished = 1;  //hmmm, awkward place for this, we have to reset this for the next generation
  }

  //generate a mating pool
  void naturalSelection() {
    //clear the ArrayList
    darwin.clear();

    //Calculate total fitness of whole population
    float totalFitness = getTotalFitness();

    //Calculate *normalized* fitness for each member of the population
    //based on normalized fitness, each member will get added to the mating pool a certain number of times a la roulette wheel
    //a higher fitness = more entries to mating pool = more likely to be picked as a parent
    //a lower fitness = fewer entries to mating pool = less likely to be picked as a parent
    for (int i = 0; i < population.length; i++) {
      float fitnessNormal = population[i].getFitness() / totalFitness;
      int n = (int) (fitnessNormal * 50000.0f);
      //print(n + " ");
      for (int j = 0; j < n; j++) {
        darwin.add(population[i]);
      }
    }
    //println();
    //println("-------------------------------------------------------");
  }

  //*CREATE A NEW GENERATION**//
  void generate() {
    //refill the population with children from the mating pool
    for (int i = 0; i < population.length; i++) {
      int m = int(random(darwin.size()));
      int d = int(random(darwin.size()));
      //pick two parents
      Creature mom = (Creature) darwin.get(m);
      Creature dad =  (Creature) darwin.get(d);
      //get their genes
      DNA momgenes = mom.getGenes();
      DNA dadgenes = dad.getGenes();
      //mate their genes
      DNA child = momgenes.mate(dadgenes);
      //mutate their genes
      child.mutate(mutationRate);
      //fill the new population with the new child
      population[i] = new Creature(new PVector(start.r.x,start.r.y), child,population.length);
    }
    generations++;
  }

  int getGenerations() {
    return generations;
  }

  //compute total fitness for the population
  float getTotalFitness() {
    float total = 0;
    for (int i = 0; i < population.length; i++) {
      total += population[i].getFitness();
    }
    return total;
  }

}
