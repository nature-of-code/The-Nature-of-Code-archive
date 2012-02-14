// Smoke Particle System
// Daniel Shiffman <http://www.shiffman.net>

// A basic smoke effect using a particle system
// Each particle is rendered as an alpha masked image

import processing.opengl.*;
import javax.media.opengl.*;

ParticleSystem ps;

PGraphicsOpenGL pgl;
GL gl;

PImage img;

void setup() {
  size(640, 360, OPENGL);

  // Create an alpha masked image to be applied as the particle's texture
  img = loadImage("texture.png");

  ps = new ParticleSystem(0, new PVector(width/2, 50));
  smooth();

  pgl = (PGraphicsOpenGL) g;
  gl = pgl.gl;
}

void draw() {

  pgl.beginGL();
  //gl.glDisable(GL.GL_DEPTH_TEST);
  gl.glEnable(GL.GL_BLEND);
  gl.glBlendFunc(GL.GL_SRC_ALPHA, GL.GL_ONE);


  background(0);

  ps.run();
  ps.addParticle();

  pgl.endGL();
}

