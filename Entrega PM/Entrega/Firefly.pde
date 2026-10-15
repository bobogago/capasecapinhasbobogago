class Firefly {
  int r,rIn;
  PVector pos, vel, acel, target;
  int i;
  float massa;
  color c;
  float rapIn, distIn;

  Firefly(int r, int x, int y, PVector in) {
    this.r = r;
    rIn = r;
    massa = r/10;
    pos = new PVector(x, y);
    vel = in.copy();
    acel = new PVector(0, 0);
    c = color(random(255),random(255),random(255));
    rapIn = map(r,5,35,10,0.5);
    
    target = generateTarget();
    distIn = PVector.dist(pos, target);
  }

  void desenha() {
    fill(255,100);
    circle(pos.x, pos.y, r*2);
    fill(c);
    //circle(pos.x, pos.y, r*2);
    circle(target.x, target.y, r);
    tint(c);
    image(fir,pos.x-r/2,pos.y,rIn*2,rIn*2);
  }
  void desenha(int n) {
    fill(255,100);
    circle(pos.x, pos.y, r*2);
    //fill(c);
    //circle(pos.x, pos.y, r*2);
    //circle(target.x, target.y, r);
    tint(c);
    image(fir,pos.x-r/2,pos.y,rIn*2,rIn*2);
  }

  void move() {
    PVector dir = PVector.sub(target, pos);
    float rap = map(PVector.dist(pos, target),distIn,r,rapIn,1);
    dir.setMag(rap);
    pos.add(dir);
    
    if (PVector.dist(pos, target) < r) {
      target = generateTarget();
      distIn = PVector.dist(pos, target);
      r-=random(1,10);
    }

    verificaLimites();
  }
  
  void move(int n) {
    PVector dir = PVector.sub(target, pos);
    float rap = map(PVector.dist(pos, target),width,r,rapIn,1);
    dir.setMag(rap);
    pos.add(dir);
    
    if (PVector.dist(pos, target) < r) {
      pos = new PVector(random(r,width-r),random(r,height-r));
      r-=random(1,10);
    }

    verificaLimites();
  }

  void aplicaForca(PVector f) {
    acel.add(f);
    acel.mult(massa);
  }

  void verificaLimites() {
    if (pos.x > width-r) {
      pos.x = width-r;
      vel.x = vel.x * -1;
    } else if (pos.x < r) {
      pos.x = r;
      vel.x = vel.x * -1;
    }
    if (pos.y > height-r) {
      pos.y = height-r;
      vel.y = vel.y * -1;
    } else if ( pos.y < r) {
      pos.y = r;
      vel.y = vel.y * -1;
    }
  }


  PVector generateTarget() {
    return new PVector(random(r, width-r), random(r, height-r));
  }
}
