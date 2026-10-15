class Arvore {
  float x, y, l, a;
  boolean horizontal;
  PImage arvore;
  color desid, hidr, c;

  Arvore() {
    a = 100;
    l = a;
    x = random(l/2, width-l/2);
    y = random(UIBox + a/2, height - a/2);
    arvore = loadImage("arDesid.png");
    desid = #8E623E;
    hidr = #236403;
    c = desid;
  }

  void show() {
    tint(255, 255);
    //fill(c);
    //rect(x,y,l,a);
    image(arvore, x, y, l, a);
  }

  boolean collision(float px_, float py_, float l_) {
    float hl = l_/2;
    if (px_>x-l && px_<x+l && py_+hl>y-a && py_-hl<y+a) {
      return true;
    }
    return false;
  }
}
