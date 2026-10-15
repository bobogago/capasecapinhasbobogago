class RGBExtractor extends Ecra {
  PImage img, hueImg;
  float[] hue;
  color[][] col;

  RGBExtractor() {
    windowResize(500, 500);
    colorMode(HSB, 360, 100, 100);
    cam.start();

    windowResize(cam.width*2+50, cam.height);
    img = cam.copy();
    hueImg = cam.copy();


    cam.loadPixels();
    hue = new float[cam.pixels.length];
    col = new color[cam.width][cam.height];

    smooth();

    cam.start();
  }

  void desenha() {
    cam.read();
    cam.loadPixels();
    img.updatePixels();
    hueImg.updatePixels();
    image(img, cam.width, 0);
    image(hueImg, cam.width*2, 0, 50, height);
    image(cam, 0, 0);

    for (int x = 0; x < cam.width; x++) {
      for (int y = 0; y < cam.height; y++) {
        hue[y*cam.width+x] = hue(cam.pixels[y*cam.width+x]);
      }
    }

    hue = sort(hue);

    for (int x = 0; x < cam.width; x++) {
      for (int y = 0; y < cam.height; y++) {
        hueImg.pixels[y*cam.width+x] = color(hue[y*cam.width+x], 100, 100);
        img.pixels[y*cam.width+x] = color(hue[y*cam.width+x], saturation(cam.pixels[y*cam.width+x]), brightness(cam.pixels[y*cam.width+x]));
      }
    }

    println(frameCount);
  }

  int nprint = 1;
  void keyPress() {
    img.save("foto_"+ nprint++ +".png");
  }
}
