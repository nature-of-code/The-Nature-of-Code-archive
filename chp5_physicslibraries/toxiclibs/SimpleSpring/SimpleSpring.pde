/**
 * <p>Simple two particles and spring example<br/>
 * <a href="http://www.shiffman.net/teaching/nature/toxiclibs/">The Nature of Code</a><br/>
 * Spring 2010</p>
 */

/* 
 * Copyright (c) 2010 Daniel Shiffmann
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

import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.geom.*;

// Reference to physics world
VerletPhysics2D physics;

Particle p1;
Particle p2;

void setup() {
  size(200,200);
  smooth();
  frameRate(30);

  // Initialize the physics
  physics=new VerletPhysics2D();
  physics.addBehavior(new GravityBehavior(new Vec2D(0,0.5)));

  // Set the world's bounding box
  physics.setWorldBounds(new Rect(0,0,width,height));
  
  // Make two particles
  p1 = new Particle(new Vec2D(100,20));
  p2 = new Particle(new Vec2D(100,180));
  // Lock one in place
  p1.lock();

  // Make a spring connecting both Particles
  VerletSpring2D spring=new VerletSpring2D(p1,p2,80,0.01);

  // Anything we make, we have to add into the physics world
  physics.addParticle(p1);
  physics.addParticle(p2);
  physics.addSpring(spring);
}

void draw() {

  // Update the physics world
  physics.update();

  background(255);

  // Draw a line between the particles
  line(p1.x,p1.y,p2.x,p2.y);

  // Display the particles
  p1.display();
  p2.display();

  // Move the second one according to the mouse
  if (mousePressed) {
    p2.lock();
    p2.x = mouseX;
    p2.y = mouseY;
    p2.unlock();
  }
}



