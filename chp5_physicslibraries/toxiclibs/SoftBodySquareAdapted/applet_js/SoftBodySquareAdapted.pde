/**
 * This example is adapted from Karsten Schmidt's SoftBodySquare example
 * Daniel Shiffman, 2011
 * The Nature of Code book
 */

/* <p>Softbody square demo is showing how to create a 2D square mesh out of
 * verlet particles and make it stable enough to avoid total structural
 * deformation by including an inner skeleton.</p>
 *
 * <p>Usage: move mouse to drag/deform the square</p>
 */

/* 
 * Copyright (c) 2008-2009 Karsten Schmidt
 * 
 * This demo & library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * http://creativecommons.org/licenses/LGPL/2.1/
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 * 
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
 */


import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;

import toxi.geom.*;
import toxi.math.*;

VerletPhysics2D physics;

Blanket b;


void setup() {
  size(400,300);
  smooth();
  physics=new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior(new Vec2D(0,0.1)));

  b = new Blanket();
}

void draw() {

  background(255);

  physics.update();

  b.display();
}

class Blanket {
  ArrayList<Particle> particles;
  ArrayList<Connection> springs;

  Blanket() {
    particles = new ArrayList<Particle>();
    springs = new ArrayList<Connection>();

    int w = 20;
    int h = 20;

    float len = 10;
    float strength = 0.125;

    for(int y=0; y< h; y++) {
      for(int x=0; x < w; x++) {

        Particle p = new Particle(new Vec2D(100+x*len,y*len));
        physics.addParticle(p);
        particles.add(p);

        if (x > 0) {
          Particle previous = particles.get(particles.size()-2);
          Connection c = new Connection(p,previous,len,strength);
          physics.addSpring(c);
          springs.add(c);
        }

        if (y > 0) {
          Particle above = particles.get(particles.size()-w-1);
          Connection c=new Connection(p,above,len,strength);
          physics.addSpring(c);
          springs.add(c);
        }
      }
    }

    Particle topleft= particles.get(0);
    topleft.lock();

    Particle topright = particles.get(w-1);
    topright.lock();
  }

  void display() {
    for (Connection c : springs) {
      c.display();
    }
  }
}

class Connection extends VerletSpring2D {
  Connection(Particle p1, Particle p2, float len, float strength) {
    super(p1,p2,len,strength);
  }

  void display() {
    stroke(0);
    line(a.x,a.y,b.x,b.y);
  }
}

// Notice how we are using inheritance here!
// We could have just stored a reference to a VerletParticle object
// inside the Particle class, but inheritance is a nice alternative

class Particle extends VerletParticle2D {

  Particle(Vec2D loc) {
    super(loc);
  }

  // All we're doing really is adding a display() function to a VerletParticle
  void display() {
    fill(175);
    stroke(0);
    ellipse(x,y,16,16);
  }
}

