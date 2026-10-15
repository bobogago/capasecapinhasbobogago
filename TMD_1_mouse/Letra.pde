class Letra {
  PVector pos, vel, acel;
  float l;
  float raioDet, raioOrb;
  color cDet;
  boolean det;
  float speed = 3;
  boolean right = true;
  float vidaMax = 500;
  float vida = random(vidaMax/7, vidaMax/5);
  float hue;
  char letra;
  int tempoVivo = 0;

  Letra(float x, float y, char letra) {
    this.letra = letra;
    vel = new PVector(0, 0);
    pos = new PVector(x, y);
    acel = new PVector(0, 0);
    l = height/8;
    raioDet = l*4;
    raioOrb = l;
    speed = random(1, 4);
    hue = random(360);
    right= random(1) < 0.5;
  }

  void desenha() {
    detect();
    //noFill();
    //stroke(cDet);
    //circle(pos.x, pos.y, raioDet);

    stroke(0);
    push();
    colorMode(HSB, 360, 255, 255);
    float col = map(vida, vidaMax, 0, 255, 0);
    //tint(125, 100, 100, map(tempoVivo, 0, 1000, 0, 500));
    if (det) {
      float saturation = map(dist(mouseX, mouseY, width/2, mouseY), 0, width/2, 150, 0);
      float brightness = map(dist(mouseX, mouseY, width/2, mouseY), 0, width/2, 150, col*1.5);
      fill(hue, saturation, brightness, vida*1.5);
    } else {
      fill(hue, col, col*2, vida*2);
    }
    textSize(l);
    //rect(pos.x, pos.y, l, l*1.5);
    text(letra, pos.x, pos.y);
    pop();
  }

  void move() {
    raioDet = map(dist(mouseX, mouseY, width/2, mouseY), 0, width/2, l*10, l);
    if (det) {
      PVector vetorMouse = new PVector(0, 0);
      vetorMouse = PVector.fromAngle(atan2(mouseY-pos.y, mouseX-pos.x));
      raioOrb *= 1.5;

      if (dist(mouseX, mouseY, pos.x, pos.y) < raioOrb) {
        float rot;
        if (right) {
          rot = HALF_PI;
        } else {
          rot = -HALF_PI;
        }
        PVector v2 = vetorMouse.copy().rotate(rot).setMag(speed*random(1, 4));
        vel.add(v2);
      } else {
        raioOrb = l;
        ;
        vel= vetorMouse.setMag(speed);
        acel.x = vetorMouse.x;
      }
    } else if (pos.y < floor) {
      vel.add(acel);
      acel = acel.copy().setMag(acel.mag()*1);
      vel.add(grav);
    }

    pos.add(vel);

    pos.y = constrain(pos.y, 0, floor);

    vel = new PVector(0, 0);

    tempoVivo++;
  }

  void detect() {
    det = dist(mouseX, mouseY, pos.x, pos.y) < raioDet/2;
    float perda = map(tempoVivo, 0, 100, 0, 2);

    if (det) {
      cDet = color(0, 255, 0);
      vida = constrain(vida+=perda*1.5, 0, 255);
    } else {
      cDet = color(255, 0, 0);


      if (pos.y >= floor) {
        vida-=30;
      } else {
        vida-=perda;
      }
    }
  }
}
