class Mosquito {
  int x, y, z, sd;
  float w, h, d;
  color cl;
  float wingAng = 0, legAng;
  PVector pos, target, direction, velocity;
  int ret = 1;
  float speed = 2, landingSpeed = 3, topSpeed = 3;
  boolean flying = true, moves, landing = false, grounded = false;
  Mosquito(int x, int y, int z, float w, float h, float d, int sd, boolean moves) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.w = w;
    this.h = h;
    this.d = d;
    cl = color(#46312A);
    this.sd = sd;
    pos = new PVector(x, y, z);
    target = new PVector(0, 0, 0);
    direction = new PVector(0, 0, 0);
    velocity = new PVector(0, 0, 0);
    generateTarget();
    this.moves = moves;
  }

  void generateTarget() {
    speed = random(1, topSpeed);
    target.x = constrain(random(pos.x-100, pos.x+100), -400, 400);
    if (flying) {
      target.y = constrain(random(pos.y-100, pos.y+100), -400, 200);
    }
    target.z = constrain(random(pos.z-100, pos.z+100), -400, 400);
  }

  void seekTarget() {
    if (keyPressed && key == 't') {
      generateTarget();
    }

    float distancia = dist(pos.x, pos.y, pos.z, target.x, target.y, target.z);
    if (distancia > w) {
      direction = target.copy().sub(pos).normalize();

      velocity.sub(velocity.copy().setMag(velocity.mag()/40));
      velocity.add(direction.copy().setMag(map(distancia, w, 200, 0.1, speed)));

      pos.add(velocity);
    } else if (flying || landing) {
      generateTarget();
    }
    //drawCube(target.x, target.y, target.z, w, w, w);
  }

  void desenha() {
    //println("F", flying);
    //println("L", landing);
    //println("G", grounded);
    int actualHeight = 2;
    if (moves && (flying||landing)) {
      
      if (landing && target.y < floor-h*actualHeight) {
        target.y+=landingSpeed;
      } else if (target.y > floor-h*actualHeight) {
        grounded = true;
        landing = false;
      }
      seekTarget();
    }
    pos.y = constrain(pos.y,-1000,floor-h*actualHeight);

    if (random(1) < 0.01 && moves) {
      if (flying && random(1) < 0.1) {
        grounded = false;
        flying = false;
        landing = true;
      } else if (grounded) {
        grounded = false;
        flying = true;
        landing = false;
      }
    }

    if (!grounded) {
      if (legAng > -TWO_PI/10) {
        legAng -= TWO_PI/50;
      }
      if (wingAng > 0 || wingAng < -PI/10) {
        ret *= -1;
      }
      wingAng += ret*PI/10;
    } else {
      if (legAng < 0) {
        legAng += TWO_PI/100;
      } else if (legAng > -0) {
        legAng = 0;
      }
      wingAng = 0;
    }

    cl = color(#CBA684);
    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    rotateY(atan2(direction.x, direction.z));

    pushMatrix();
    rotateX(wingAng);
    rotateX(PI/6);
    rotateZ(PI/4);
    wing(0, -h*1, d*2, w/2, h/2, d*5, cl);
    rotateZ(-PI/2);
    wing(0, -h*1, d*2, w/2, h/2, d*5, cl);
    popMatrix();

    cl = color(#8B2323);
    head(0, 0, d, w, h, d, cl, sd);
    cl = color(#46312A);
    body(0, 0, 0, w-w/10, h, d, sd, cl);

    for (int i = 0; i < 12; i++) {
      if (i == 11 || i ==0 || i ==1 || i ==5 || i ==6 || i ==7) {
        pushMatrix();
        rotateX(legAng);
        rotateY(TWO_PI/12*i);
        translate(0, 0, d);
        leg(0, h*2, 0, w/20, h*4, d, sd, cl);
        popMatrix();
      }
    }
    popMatrix();
  }
  //int x, int y, int z, float r, int d, int lados
  void leg(float xl, float yl, float zl, float wl, float hl, float dl, int lados, color col) {
    pushMatrix();
    fill(col);
    translate(w*0.5, yl-hl/4, zl-dl*1);
    rotateZ(PI/3);
    rotateX(PI/2);
    drawCylinder(0, 0, zl, wl, hl, lados);
    rotateY(-PI/4);
    drawCylinder(wl*6.5, 0, zl-dl*0.3, wl, hl, lados);
    rotateY(-PI/4);
    drawCylinder(wl*-4.9, 0, zl-dl*2.3, wl, hl*1.5, lados);
    popMatrix();
  }

  void wing(float xw, float yw, float zw, float ww, float hw, float dw, color col) {
    drawCube(xw, yw-hw*6, zw-dw, ww, hw, dw, col);
  }

  void body(float xb, float yb, float zb, float wb, float hb, float db, int lados, color col) {
    drawFrustum(xb, yb-hb, zb, wb, wb/2, db, lados, col);
    drawFrustum(xb, yb-hb, zb-db, 4*wb/5, wb, db, lados, col);
    drawFrustum(xb, yb+hb*6, zb-db*3, xb, yb-hb, zb-db*2, wb/4, 4*wb/6, db, lados, col);
    drawFrustum(xb, yb+hb*6, zb-db*4, wb/16, wb/4, db, lados, col);
  }

  void head(float xc, float yc, float zc, float wc, float hc, float dc, color col, int sides) {
    float arcSta = PI;
    float arcSto = TWO_PI;

    //BaseCabeça
    float wBCabeca = wc;
    float hBCabeca = hc;
    float dBCabeca = dc;


    drawCylinder(xc, yc-hBCabeca/2, zc, wBCabeca/2, dBCabeca, sides, arcSta, arcSto, col);
    drawPrism(xc, yc, zc, wBCabeca, hBCabeca, dBCabeca, col);
    float rCabeca = wBCabeca/9;
    //float hCabeca = 100;
    float dCabeca = dBCabeca*3;
    arcSta = PI*3/4;
    arcSto = TWO_PI+ QUARTER_PI;
    //Bico?
    //float x, float y, float z, float r, float apexX, float apexY,float apexZ, int lados
    drawCone(xc, yc-hBCabeca/2, zc+dBCabeca/2, rCabeca, xc, yc-hBCabeca/2, zc+dCabeca, sides);
    //Olhos
    float tamanhoOlhos = rCabeca*1;

    drawCylinder(xc-rCabeca-tamanhoOlhos, yc-hBCabeca, zc+dBCabeca/2+tamanhoOlhos/4, tamanhoOlhos, tamanhoOlhos/2, 10, 0, TWO_PI, color(0));
    drawCylinder(xc+rCabeca+tamanhoOlhos, yc-hBCabeca, zc+dBCabeca/2+tamanhoOlhos/4, tamanhoOlhos, tamanhoOlhos/2, 10, 0, TWO_PI, color(0));
  }
}
