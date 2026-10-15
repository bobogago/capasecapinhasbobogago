class Mud {
  float x, y, l, a;
  boolean horizontal;
  PImage mud;

  Mud() {
    a = 80;
    l = 80;
    x = random(l/2, width-l/2);
    y = random(UIBox + a/2, height - a/2);
    mud = loadImage("mud.png");
  }

  void show() {
    tint(255, 255);
    image(mud, x, y, l, a);
    //rect(x,y,l,a);
  }

  boolean collision(float px_, float py_, float l_) {
    float hl = l_/2;
    if (dist(px_, py_, x, y) < a/2) {
      return true;
    }
    return false;
  }
  
  void newPlace(){
    x = random(l, width-l);
    y = random(a +UIBox, height-a);
  }
}
