class FireflyField extends Ecra {
  ArrayList<Firefly> f = new ArrayList();
  boolean paused;
  PVector maisBrilhante;
  BotaoUI toggle;
  int v = 0;

  FireflyField() {
    windowResize(1000, 700);
    noStroke();
    fir = loadImage("fireflies.png");
    imageMode(CENTER);
    maisBrilhante = new PVector(0, 0);
    cam.start();
    cam.read();
    toggle = new BotaoUI(0, height-100);
  }

  void desenha() {
    if (v%3 == 0) {
      brightestTargetMode();
    } else if (v%3 == 1) {
      mouseTargetMode();
    } else {
      randomTargetMode();
    }
    toggle();
  }

  void randomTargetMode() {
    background(50);
    for (int i = f.size()-1; i >= 0; i--) {
      f.get(i).desenha();
      if (!paused) {
        f.get(i).move();
        if (f.get(i).r < 5) {
          f.remove(i);
        }
      }
    }
  }

  void brightestTargetMode() {
    tint(100, 255);
    cam.read();
    image(cam, width/2, height/2, width, height);

    maisBrilhante = detetarBrilho(cam).copy();

    fill(255);
    circle(maisBrilhante.x, maisBrilhante.y, 20);
    for (int i = f.size()-1; i >= 0; i--) {
      f.get(i).desenha(0);
      if (!paused) {
        f.get(i).move(0);
        f.get(i).target = maisBrilhante.copy();
        if (f.get(i).r < 5) {
          f.remove(i);
        }
      }
    }
  }

  void mouseTargetMode() {
    background(50);
    fill(255);
    circle(mouseX, mouseY, 20);
    for (int i = f.size()-1; i >= 0; i--) {
      f.get(i).desenha(0);
      if (!paused) {
        f.get(i).move(0);
        f.get(i).target = new PVector(mouseX, mouseY);
        if (f.get(i).r < 5) {
          f.remove(i);
        }
      }
    }
  }

  PVector detetarBrilho(PImage img) {
    PVector vec = new PVector(0, 0);
    float mb = -1;

    for (int x=0; x<img.width; x ++) {
      for (int y=0; y<img.width; y++) {
        float b = brightness(get(x, y));
        if (b > mb) {
          mb = b;
          vec.x = x;
          vec.y = y;
        }
      }
    }

    return vec;
  }


  void mousePress() {
    if (!toggle.hover()) {
      if (v%3 == 1) {
        int r = round(random(15, 35));
        f.add(new Firefly(r, round(random(r,width-r)),round(random(r,height-r)), new PVector(0, 0)));
      } else {
        f.add(new Firefly(round(random(15, 35)), mouseX, mouseY, new PVector(0, 0)));
      }
    }
  }

  void keyPress() {
    if (key == 'p' || key == 'P') {
      paused = !paused;
    }
  }

  void toggle() {
    toggle.display("Switch");

    if (toggle.hover() && clickedGate()) {
      v++;
      if (v%3 == 2) {
        for (int i = f.size()-1; i >= 0; i--) {
          f.get(i).target = f.get(i).generateTarget();
        }
      }
    }
  }

  boolean clickedGate() {
    boolean cl = false;
    if (mousePressed && !clickedPrev) {
      clickedPrev = true;
    } else if (clickedPrev && !mousePressed) {
      clickedPrev = false;
      cl = true;
    }
    return cl;
  }
}
