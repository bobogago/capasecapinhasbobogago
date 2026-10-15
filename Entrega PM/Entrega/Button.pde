class Button {
  float x, y, l;
  SoundFile sound;
  String name;
  float amp = 0;
  PImage img;
  boolean lit = false, hitB = false;

  Button(float x, float y, float l, SoundFile sound, PImage img) {
    this.x = x;
    this.y = y;
    this.l = l;
    this.sound = sound;
    this.img = img;
    sound.loop();
    sound.amp(amp);
  }

  Button(float x, float y, float l, SoundFile sound, PImage img, int n) {
    this.x = x;
    this.y = y;
    this.l = l;
    this.sound = sound;
    this.img = img;
    sound.amp(amp);
    hitB = true;
  }

  void desenha() {
    if (hitB) {
      println(sound.position());
      println(sound.duration());
    }
    if (sound.position() >= sound.duration()-sound.duration()/3 && hitB) {
      lit = false;
      sound.amp(0);
      sound.jump(0);
    }

    if (lit) {
      if (hitB) {
        fill(170, 0, 200);
      } else{
        fill(170, 200, 0);
      }
    } else {
      fill(255);
    }

    rect(x, y, l, l);
    image(img, x, y, l, l);
  }

  boolean isInside() {
    if (mouseX > x && mouseX < x + l && mouseY > y && mouseY < y+l) {
      return true;
    }

    return false;
  }
  void muteUnmute() {
    if (amp == 0) {
      amp = 1;
      lit = true;
    } else {
      amp = 0;
      lit = false;
    }
    sound.amp(amp);
  }
  void hit() {
    sound.stop();
    amp = 1;
    sound.play();
    lit = true;
  }
}
