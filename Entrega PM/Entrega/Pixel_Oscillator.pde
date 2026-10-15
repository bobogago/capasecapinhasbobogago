class PixelOscillator extends Ecra {
  PImage img;
  color[][] pixelC;
  int countC, countR, speed = 1, speedR = 1, freqRoof, freqCeil;
  String selected;
  boolean run = false;


  PixelOscillator() {
    //textSize(10);

    freqRoof = 100;
    freqCeil = 600;
    textSize(10);
    selectInput("Select a file to process:", "chooseImage");
  }

  void initiate(PImage image) {
    img = image;
    img.resize(500, 0);
    windowResize(img.width, img.height);
    image(img, 0, 0);

    red.play();
    green.play();
    blue.play();

    noStroke();


    run = true;
  }

  void getPixelC() {
    pixelC = new color[width][height];

    for (int i = 0; i<width; i++) {
      for (int j = 0; j <height; j++) {
        pixelC[i][j] = color(get(i, j));
      }
    }
  }
  void desenha() {
    if (!run) {
      background(0);
      fill(255);
      text("escolha uma imagem", width/2-50, height/2);
    } else {
      image(img, 0, 0);
      getPixelC();
      scan();
      playRed();
      playGreen();
      playBlue();
      info();
    }
  }

  void scan() {
    if (countC+speed < width) {
      fill(0);
      rect(countC, countR, 7, 7);
      fill(255);
      rect(countC+1, countR+1, 5, 5);
      countC += speed;
    } else {
      countC = 0;
      if (countR+speedR < height) {
        countR +=speedR;
      } else {
        countR = 0;
      }
    }
  }

  void playRed() {
    float rFreq = map(red(pixelC[countC][countR]), 0, 255, freqRoof, freqCeil);
    //println(countC,countR,red(pixelC[countC][countR]));
    red.freq(rFreq);
  }

  void playGreen() {
    float gFreq = map(green(pixelC[countC][countR]), 0, 255, freqRoof-50, freqCeil-50);
    //println(countC,countR,green(pixelC[countC][countR]));
    green.freq(gFreq);
  }

  void playBlue() {
    float bFreq = map(blue(pixelC[countC][countR]), 0, 255, freqRoof-100, freqCeil-100);
    //println(countC,countR,blue(pixelC[countC][countR]));
    blue.freq(bFreq);
  }
  void info() {
    float amt;

    fill(170, 0, 0);
    rect(width-120, height-60, 100, 5);
    fill(255, 0, 0);
    amt = map(red(pixelC[countC][countR]), 0, 255, 0, 100);
    rect(width-120, height-60, amt, 5);

    fill(0, 170, 0);
    rect(width-120, height-40, 100, 5);
    fill(0, 255, 0);
    amt = map(green(pixelC[countC][countR]), 0, 255, 0, 100);
    rect(width-120, height-40, amt, 5);

    fill(0, 0, 170);
    rect(width-120, height-20, 100, 5);
    fill(0, 0, 255);
    amt = map(blue(pixelC[countC][countR]), 0, 255, 0, 100);
    rect(width-120, height-20, amt, 5);

    fill(pixelC[countC][countR]);
    square(width-170, height-55, 40);
    //fill(0);
    text("Speed Horizontal: " + speed, width- 120, height-90);
    text("Speed Vertical: " + speedR, width- 120, height-70);
  }

  void mousePress() {
    countC = mouseX;
    countR = mouseY;
  }

  void keyPress() {
    if (key == 'd' && speed < width) {
      speed++;
    } else if (key == 'a' && speed > 0) {
      speed--;
    }
    if (key == 'w' && speed < width) {
      speedR++;
    } else if (key == 's' && speedR > 0) {
      speedR--;
    } else if (key == 'q') {
      red.stop();
      green.stop();
      blue.stop();
      run = false;

      countC = 0;
      countR = 0;
      selectInput("Select a file to process:", "chooseImage");
    }
  }
}
