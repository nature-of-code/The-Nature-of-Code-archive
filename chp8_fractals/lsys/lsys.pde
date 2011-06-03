/* Daniel Shiffman               */
/* The Nature of Code            */
/* http://www.shiffman.net       */
/* daniel.shiffman@nyu.edu       */

LSystem lsys;
Turtle turtle;

void setup() {
  size(200,200);
  /*
  // Create an empty ruleset
  Rule[] ruleset = new Rule[2];
  // Fill with two rules (These are rules for the Sierpinksi Gasket Triangle)
  ruleset[0] = new Rule('F',"F--F--F--G");
  ruleset[1] = new Rule('G',"GG");
  // Create LSystem with axiom and ruleset
  lsys = new LSystem("F--F--F",ruleset);
  turtle = new Turtle(lsys.getSentence(),width*2,TWO_PI/3);
  */
  
  Rule[] ruleset = new Rule[1];
  ruleset[0] = new Rule('F',"F[F]-F+F[--F]+F-F");
  lsys = new LSystem("F-F-F-F",ruleset);
  turtle = new Turtle(lsys.getSentence(),width-1,PI/2);
  smooth();
}

void draw() {
  background(255);  
  translate(0,height-1);
  turtle.render();
  noLoop();
}

void mousePressed() {
  lsys.generate();
  turtle.setToDo(lsys.getSentence());
  turtle.changeLen(0.3333);
  redraw();
}

