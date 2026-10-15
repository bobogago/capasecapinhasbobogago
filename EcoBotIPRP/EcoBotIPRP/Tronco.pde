class Tronco {
  float x, y, l, a;
  PImage tronco;

  Tronco() {
    a = 40;
    l = 40;
    x = random(l/2, width-l/2);
    y = random(UIBox + a/2, height - a/2);
    tronco = loadImage("tronco.png");
  }

  void show() {
    tint(255, 255);
    image(tronco, x, y, l, a);
    //rect(x,y,l,a);
  }

  boolean collision(float px_, float py_, float l_) {
    float hl = l_/2;
    if (px_>x-l && px_<x+l && py_+hl>y-a && py_-hl<y+a) {
      return true;
    }
    return false;
  }
  void newPlace() {
    x = random(l, width-l);
    y = random(a +UIBox, height-a);
  }
}
