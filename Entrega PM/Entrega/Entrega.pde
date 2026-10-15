import processing.sound.*;
import processing.video.*;

SoundFile s;
SoundFile bass, keys, drums, bassDrums, hey, kingBoo;
BeatDetector b;
Amplitude a;
PitchDetector p;
BrownNoise wN;
SinOsc red, green, blue;
boolean clickedPrev = false;
PImage fir;

Capture cam;

Ecra e;

void setup() {
  size(400, 400);
  smooth();

  bass = new SoundFile(this, "Bass.mp3");
  keys = new SoundFile(this, "Keys.mp3");
  drums = new SoundFile(this, "Drums.wav");
  bassDrums = new SoundFile(this, "Bass Drums.wav");
  hey = new SoundFile(this, "HEY!.mp3");
  kingBoo = new SoundFile(this, "kingboo.mp3");
  s = new SoundFile(this, "scar.mp3");
  p = new PitchDetector(this);
  b = new BeatDetector(this);
  a = new Amplitude(this);
  wN = new BrownNoise(this);
  e = new Ecra();
  red = new SinOsc(this);
  green = new SinOsc(this);
  blue = new SinOsc(this);
  cam = new Capture(this);
  //surface.setResizable(true);
}

void draw() {
  //e[i].desenha();
  e.desenha();
}

void keyPressed() {
  //e[i].keyPress();
  if (key == '9') {
    s.stop();
    green.stop();
    red.stop();
    blue.stop();
    cam.stop();
    windowResize(1000, 800);
    e = new Ecra();
  }
  if (key == '0') {
    windowResize(1000, 800);
  }
  e.keyPress();
}

void mousePressed() {
  e.mousePress();
}

void mouseDragged(){
  e.mouseDrag();
}

void chooseImage(File selection) {
  PImage image;
  e.selected = selection.getAbsolutePath();
  println(e.selected);
  image = loadImage(e.selected);
  //img = loadImage("example.jpg");
  //if (selected != null) {
  print("initiating");
  e.initiate(image);
  //}
}
