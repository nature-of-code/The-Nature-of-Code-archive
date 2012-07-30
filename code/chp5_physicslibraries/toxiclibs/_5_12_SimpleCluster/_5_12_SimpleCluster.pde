/**
 * <p>Force directed graph,
 * heavily based on: <a href="http://code.google.com/p/fidgen/">fid.gen</a><br/>
 * <a href="http://www.shiffman.net/teaching/nature/toxiclibs/">The Nature of Code</a><br/>
 * Spring 2010</p>
 */

/* 
 * Copyright (c) 2010 Daniel Schiffmann
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

import toxi.geom.*;
import toxi.physics2d.*;

// Reference to physics world
VerletPhysics2D physics;

// A list of cluster objects
Cluster cluster;

// Boolean that indicates whether we draw connections or not
boolean showPhysics = true;
boolean showParticles = true;

// Font
PFont f;

void setup() {
  size(300,300);
  smooth();
  frameRate(30);
  f = createFont("Georgia",12,true);

  // Initialize the physics
  physics=new VerletPhysics2D();
  physics.setWorldBounds(new Rect(10,10,width-20,height-20));

  // Spawn a new random graph
  cluster = new Cluster(8,100,new Vec2D(width/2,height/2));

}

void draw() {

  // Update the physics world
  physics.update();

  background(255);

  // Display all points
  if (showParticles) {
    cluster.display();
  }

  // If we want to see the physics
  if (showPhysics) {
      cluster.showConnections();
  }

  // Instructions
  fill(0);
  textFont(f);
  text("'p' to display or hide particles\n'c' to display or hide connections\n'n' for new graph",10,20);
}

// Key press commands
void keyPressed() {
  if (key == 'c') {
    showPhysics = !showPhysics;
    if (!showPhysics) showParticles = true;
  } 
  else if (key == 'p') {
    showParticles = !showParticles;
    if (!showParticles) showPhysics = true;
  } 
  else if (key == 'n') {
      physics.clear();
      cluster = new Cluster(int(random(2,20)),random(10,width/2),new Vec2D(width/2,height/2));

  }
}
