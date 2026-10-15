class BotaoUI {
  float x, y, l, a;
  int info;
  BotaoUI(float xt, float yt /*,float lt, float at*/, int in) {
    x = xt;
    y = yt;
    l = width/3 - 50;
    a = 100;
    info = in;
  }

  void update(color c) {
    if (hover()) {
      fill(170, 0, 100);    
    } else {
      //fill(c);
      fill(100, 0, 170);
    }
  }

  void display(String text) {
    rect(x, y, l, a);
    fill(255);
    textSize(50);
    text(text, x+l/2, y + 65);
  }

  void display(String text, String dispText, float dX, float dY) {
    rectMode(CORNER);
    rect(x, y, l, a);
    fill(255);
    textSize(50);
    text(text, x+l/2, y + 65);
    if (hover()) {
      rectMode(CENTER);
      fill(170, 0, 100);
      rect(dX, dY-10, width/2, 80);
      fill(255);
      textSize(40);
      text(dispText, dX, dY);
    }
  }
  
  void display(String text,String dropdown) {
    l = width/3 - 50;
    a = 100;
    rectMode(CORNER);
    rect(x, y, l, a);
    fill(255);
    textSize(50);
    text(text, x+l/2, y + 65);
    if (hover()) {
      l = width/3 - 50;
      a = 150;
      fill(170, 0, 100);
      rect(x,y,l,a);
      fill(255);
      textSize(30);
      text(dropdown, x,y+10,l,a);
      
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
