class Station {
  float x, y, l, a;
  boolean horizontal;
  PImage station;
  boolean apanhado = false;
  Station() {
    l = 40;
    a = 70;
    x = random(l/2, width-l/2);
    y = random(UIBox + a/2, height - a/2);
    station = loadImage("station.png");
  }

  void show() {
    if (!apanhado) {
      tint(255, 255);
    } else {
      tint(0, 0);
    }
    image(station, x, y, l, a);
  }

  boolean collision(float px_, float py_, float l_) {
    float hl = l_/2;
    if (!apanhado) {
      if (px_>x-l && px_<x+l && py_+hl>y-a && py_-hl<y+a) {
        apanhado = true;
        return true;
      }
    }
    return false;
  }
  
  void newPlace(){
    x = random(l, width-l);
    y = random(a +UIBox, height-a);
  }
}
