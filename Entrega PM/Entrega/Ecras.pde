class Ecra {
  String selected;
  PImage title;
  boolean run;
  BotaoUI[] bUI = new BotaoUI[6];

  Ecra() {
    windowResize(1000, 800);
    bUI[0] = new BotaoUI(25, height/2, loadImage("Circle Painter.png"));
    bUI[1] = new BotaoUI(width/3 + 25, height/2, loadImage("Dj Pad.png"));
    bUI[2] = new BotaoUI(2*width/3+ 25, height/2, loadImage("Image Noise.png"));
    bUI[3] = new BotaoUI(width/3+ 25, 2*height/3, loadImage("Pixel Oscillator.png"));
    bUI[4] = new BotaoUI(2*width/3+ 25, 2*height/3, loadImage("Hue Extractor.png"));
    bUI[5] = new BotaoUI(25, 2*height/3, loadImage("Firefly Field.png"));

    title = loadImage("title.png");
    title.resize(0, 100);


    //bUI[0] = new BotaoUI(25, height/2);
    //bUI[1] = new BotaoUI(width/3 + 25, height/2);
    //bUI[2] = new BotaoUI(2*width/3+ 25, height/2);
    //bUI[3] = new BotaoUI(width/3+ 25, 2*height/3);
    //bUI[4] = new BotaoUI(2*width/3+ 25, 2*height/3);
    //bUI[5] = new BotaoUI(25, 2*height/3);
  }

  void desenha() {
    rectMode(CORNER);
    imageMode(CORNER);
    background(0);
    textSize(50);

    bUI[0].display("CirclePainter");

    bUI[1].display("DJ Pad");

    bUI[2].display("ImageNoise");

    bUI[3].display("PixelOscillator");

    bUI[4].display("HueExtractor");

    bUI[5].display("FireflyField");

    push();
    imageMode(CENTER);
    tint(255, 255);
    image(title, width/2, height/4);
    pop();

    for (int i = 0; i < bUI.length; i++) {
      if (mousePressed && bUI[i].hover()) {
        switch(i+1) {
        case 1:
          e = new CirclePainter();
          break;
        case 2:
          //e = new CirclePainter2();
          e = new djPad();
          break;
        case 3:
          e = new ImageNoise();
          break;
        case 4:
          e = new PixelOscillator();
          break;
        case 5:
          e = new RGBExtractor();
          break;
        case 6:
          e = new FireflyField();
          break;
        default:
          e = new Ecra();
          break;
        }
      }
    }
  }

  void keyPress() {
  }

  void mousePress() {
  }

  void initiate(PImage image) {
  }

  boolean clickedGate() {
    return false;
  }

  void mouseDrag() {
  }
}
