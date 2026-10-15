class Lixo {
  float lx, ly, r;
  color c;
  float px, py;
  PImage limg;
  boolean apanhado = false;

  Lixo() {
    //r = random(10,20);
    if (random(1)<0.2) {
      limg = loadImage("trash.png");
      r = 60;
    } else {
      limg = loadImage("trash1.png");
      r = 90;
    }
    lx = random(r, width-r);
    ly = random(r +UIBox, height-r);
    c = color(150, 0, 0);
  }
  void show() {
    //circle(lx,ly,r*2);
    if (!apanhado) {
      tint(255, 255);
    } else {
      tint(0, 0);
    }
    image(limg, lx, ly, r, r);
  }

  boolean collision(float px_, float py_, float l_) {
    float hl = l_/2;
    if (px_>lx-r && px_<lx+r && py_+hl>ly-r && py_-hl<ly+r) {
      return true;
    }
    return false;
  }

  boolean collision(float px_, float py_, float l_, boolean player) {
    float hl = l_/2;
    if (!apanhado) {
      if (px_>lx-r && px_<lx+r && py_+hl>ly-r && py_-hl<ly+r) {
        apanhado = true;
        return true;
      }
    }
    return false;
  }

  void newPlace() {
    lx = random(r, width-r);
    ly = random(r +UIBox, height-r);
  }
}
