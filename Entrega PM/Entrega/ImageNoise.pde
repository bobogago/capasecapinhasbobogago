//class ImageNoise extends Ecra {
//  PImage img, cursor;
//  color[][] pixelC;
//  boolean[][] stuck;
//  int countC, countR, strength = 7, maxWidth=1000;
//  float avoidDist = 50;
//  boolean loaded = false, run = false, eraser = false, showUI = true, mute = false;
//  String selected;
//  BrownNoise wN;

//  ImageNoise() {
//    windowResize(1000, 1000);
//    //wN = new BrownNoise(this);
//    selectInput("Select a file to process:", "chooseImage");
//  }

//  void resizeImg() {
//    while (img.width > maxWidth) {
//      img.resize(int(img.width * 0.9), int(img.height * 0.9));
//    }
//    windowResize(img.width, img.height);
//    image(img, 0, 0);
//  }

//  void getPixels() {
//    pixelC = new color[width][height];
//    stuck = new boolean[width][height];

//    for (int i = 0; i<width; i++) {
//      for (int j = 0; j <height; j++) {
//        pixelC[i][j] = color(get(i, j));
//        stuck[i][j] = false;
//      }
//    }
//  }

//  void chooseImage(File selection) {
//    selected = selection.getAbsolutePath();
//    img = loadImage(selected);
//    wN.play();
//    run = true;
//  }

//  void loadImg() {
//    img = loadImage(selected);

//    resizeImg();

//    getPixels();

//    loaded = true;
//  }

//  void createNoise() {
//    for (int i = 0; i < height; i++) {
//      for (int j = 0; j<width; j++) {
//        if (dist(mouseX, mouseY, j, i)>avoidDist && !stuck[j][i]) {
//          int offset = constrain(i+int(random(-strength, strength)), 0, height-1);
//          int latoffset = constrain(j+int(random(-strength, strength)), 0, width-1);
//          set(j, i, pixelC[latoffset][offset]);
//        }
//      }
//    }
//  }

//  void desenha() {
//    if (!run) {
//      background(0);
//      fill(255);
//      text("escolha uma imagem", width/2-50, height/2);
//    } else {
//      if (mute) {
//        wN.amp(0);
//      } else {
//        wN.amp(map(strength, 0, 50, 0, 1));
//      }
//      if (!loaded) {
//        loadImg();
//      } else {
//        createNoise();
//        UI();
//      }
//    }
//  }

//  void UI() {
//    if (showUI) {
//      float l = width/4, a = height/3, gap = a/10;
//      fill(0, 100);
//      rect(0, 0, width, height);
//      noStroke();
//      fill(0);
//      rect(width/2-l/2, height/2-a/2, l, a);
//      fill(255);
//      textAlign(CENTER);
//      text("A: Increase noise strength", width/2, height/2-gap*4);
//      text("S: Decrease noise strength", width/2, height/2-gap*3);
//      text("E: Brush/Eraser toggle", width/2, height/2-gap*2);
//      text("F: Increase Brush size", width/2, height/2-gap*1);
//      text("R: Decrease Brush size", width/2, height/2);
//      text("W: Wipe noise mask", width/2, height/2+gap*1);
//      text("C: Screen Capture", width/2, height/2+gap*2);
//      text("M: Mute/Unmute White Noise", width/2, height/2+gap*3);
//      text("U: Toggle UI (WILL RESET NOISE MASK)", width/2, height/2+gap*4);
//    }
//  }

//  void mouseDrag() {
//    for (int i = 0; i < height; i++) {
//      for (int j = 0; j<width; j++) {
//        if (dist(mouseX, mouseY, j, i)<avoidDist) {
//          if (eraser) {
//            stuck[j][i] = false;
//          } else {
//            stuck[j][i] = true;
//          }
//        }
//      }
//    }
//  }


//  void keyPress() {
//    if (key == 'a' || key == 'A') {
//      strength++;
//    } else if ((key == 's'||key == 'S') && strength > 0) {
//      strength--;
//    } else if (key == 'u'||key == 'U') {
//      showUI = !showUI;
//      loadImg();
//    } else if (key == 'e' || key == 'E') {
//      eraser = !eraser;
//      if (eraser) {
//        cursor(HAND);
//      } else {
//        cursor(CROSS);
//      }
//    } else if (key == 'w' || key == 'W') {
//      for (int i = 0; i < height; i++) {
//        for (int j = 0; j<width; j++) {
//          stuck[j][i] = false;
//        }
//      }
//    } else if (key == 'f'|| key == 'F') {
//      avoidDist += 1;
//    } else if (key == 'r'|| key == 'R') {
//      avoidDist -= 1;
//    } else if (key == 'm' || key == 'M') {
//      mute = !mute;
//    }//else if(key == 'q'|| key == 'Q'){
//    //  selectInput("Select a file to process:", "chooseImage");
//    //}

//    if (key == 'c'|| key == 'C') {
//      saveFrame("Capture-##.png");
//      println("Capture-"+ frameCount + ".png");
//    }
//  }
//}
