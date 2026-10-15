class Pedra {
  float x, y, l, a;
  PImage pedra;

  Pedra() {
    if (random(1) <0.2) {
      a = 80;
      l = 80;
      pedra = loadImage("pedra.png");
    } else {
      if (random(1) <0.5) {
        a = 100;
        l = 80;
        pedra = loadImage("troncovert.png");
      } else {
        a = 40;
        l = 80;
        pedra = loadImage("troncohor.png");
      }
    }
    x = random(l/2, width-l/2);
    y = random(UIBox + a/2, height - a/2);
  }

  void show() {
    tint(255, 255);
    image(pedra, x, y, l, a);
    //rect(x,y,l,a);
  }

  boolean collision(float px_, float py_, float l_) {
    float hl = l_/2;
    if (px_+hl>x-l/2 && px_-hl<x+l/2 && py_+hl>y-a/2 && py_-hl<y+a/2) {
      return true;
    }
    return false;
  }
  void newPlace() {
    x = random(l, width-l);
    y = random(a +UIBox, height-a);
  }
}
