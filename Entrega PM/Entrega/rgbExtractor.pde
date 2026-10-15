//class RGBExtractor extends Ecra {

//  PImage img, rgbImg;
//  IntDict rgb;

//  RGBExtractor() {
//    colorMode(HSB, 360, 100, 100);
//    img = createImage(500, 500, HSB);
//    rgbImg = createImage(500, 500, ARGB);
//    rgb = new IntDict();
//    rgb.set("r", 0);
//    rgb.set("g", 0);
//    rgb.set("b", 0);

//    cam.start();


//    windowResize(cam.width*2+50, cam.height);
//    img.resize(cam.width, cam.height);
//    rgbImg.resize(cam.width, cam.height);


//    cam.loadPixels();

//    cam.start();
//    imageMode(CORNER);
//    tint(255,255);
//  }

//  void desenha() {
//    if (cam.available()) {
//      // Reads the new frame
//      cam.read();
//    }

//    cam.loadPixels();
//    img.updatePixels();
//    rgbImg.updatePixels();
//    image(img, cam.width, 0);
//    push();
//    tint(255,20);
//    image(rgbImg, cam.width, 0);
//    pop();
//    image(rgbImg, cam.width*2, 0, 50, height);
//    image(cam, 0, 0);

//    for (int x = 0; x < cam.width; x++) {
//      for (int y = 0; y < cam.height; y++) {
//        color pixel = cam.pixels[y*cam.width+x];
//        rgb.add("r", ceil(red(pixel)));
//        rgb.add("g", ceil(green(pixel)));
//        rgb.add("b", ceil(blue(pixel)));
//      }
//    }

//    float r = abs(rgb.get("r"));
//    float g = abs(rgb.get("g"));
//    float b = abs(rgb.get("b"));
//    float total = abs(r+g+b);
//    float redPerc = r/total, greenPerc = g/total, bluPerc = b/total;
//    for (int y = 0; y < cam.height; y++) {
//      for (int x = 0; x < cam.width; x++) {
//        if (y <= cam.height*redPerc) {
//          rgbImg.pixels[y*cam.width+x] = color(255, 0, 0);
//        } else if (y <= cam.height*redPerc + cam.height*greenPerc) {
//          rgbImg.pixels[y*cam.width+x] = color(0, 255, 0);
//        } else {
//          rgbImg.pixels[y*cam.width+x] = color(0, 0, 255);
//        }
//      }
//    }

//    println("r: " + redPerc, "g: " + greenPerc, "b: " + bluPerc);
//  }

//  int nprint = 1;
//  void keyPress() {
//    img.save("foto_"+ nprint++ +".png");
//  }
//}
