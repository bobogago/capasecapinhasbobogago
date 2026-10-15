class BotaoUI {
  float x, y, l, a;
  PImage bImg;
  boolean imgButton = false;
  BotaoUI(float xt, float yt) {
    x = xt;
    y = yt;
    l = width/3 - 50;
    a = 100;
  }

  BotaoUI(float xt, float yt, PImage b) {
    x = xt;
    y = yt;
    l = width/3 - 50;
    a = 100;
    bImg = b;
    imgButton = true;
  }


  void display(String text) {
    if (imgButton) {
      if (hover()) {
        tint(255,255);
      } else {
        //fill(c);
        tint(170,255);
      }
      image(bImg, x, y, l, a);
    } else {
      if (hover()) {
        fill(170, 0, 100);
      } else {
        //fill(c);
        fill(100, 0, 170);
      }
      rect(x, y, l, a);
      textAlign(CENTER, CENTER);
      push();
      fill(255);
      textSize(25);
      text(text, x+l/2, y + a/2);
      pop();
    }
  }

  boolean hover() {
    if (mouseX > x && mouseX < x+l && mouseY > y && mouseY < y+a) {
      return true;
    } else {
      return false;
    }
  }
}
