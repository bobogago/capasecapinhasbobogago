class djPad extends Ecra {
  PImage bassImg, keysImg, drumsImg, bassDrumsImg, heyImg, kingBooImg;
  int bl = 100;
  Button[] sB = new Button[6];

  djPad() {
    windowResize(400, 400);

    bassImg = loadImage("Bass.png");
    keysImg = loadImage("Keys.png");
    drumsImg = loadImage("Drums.png");
    bassDrumsImg = loadImage("Bass Drums.png");
    heyImg = loadImage("HEY!.png");
    kingBooImg = loadImage("kingboo.png");

    sB[0] = new Button(50, 50, bl, bass, bassImg);
    sB[1] = new Button(width-150, 50, bl, keys, keysImg);
    sB[2] = new Button(50, height-150, bl, drums, drumsImg);
    sB[3] = new Button(width-150, height-150, bl, bassDrums, bassDrumsImg);
    sB[4] = new Button(width/2-50, height/2-50, bl, hey, heyImg,1);
    sB[5] = new Button(50, height/2-50, bl, kingBoo, kingBooImg,1);
  }

  void desenha() {
    background(100);

    for (int i = 0; i<sB.length; i++) {
      sB[i].desenha();
    }
  }

  void mousePress() {
    for (int i = 0; i < sB.length; i++) {
      if (sB[i].isInside()) {
        if (sB[i].hitB) {
          sB[i].hit();
        } else {
          sB[i].muteUnmute();
        }
      }
    }
  }
}
