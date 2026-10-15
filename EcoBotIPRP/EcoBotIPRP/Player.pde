class Player {
  float x, y, vx, vy, sp, hw, startSp;
  int timer;
  PImage eB;
  boolean halt = false, slowed, spedUp;

  Player() {
    x = width/2;
    y = height/2;
    vx = 0;
    vy = 0;
    sp = 8;
    startSp = sp;
    hw = 60;
    eB = loadImage("bot.png");
  }

  void update() {
    y += vy;
    x += vx;

    //  if (player.timer > 0){
    //  player.timer--;
    //}

    movimento();
    bermas();
    
    
    if (slowed) {
      sp = 1;
    } else if (spedUp) {
      if (timer > 0) {
        sp = 20;
        timer--;
      } else{
        spedUp = false;
      }
    } else {
      sp = startSp;
    }
    
    
    if (halt) {
      if (keyCode == UP) {
        vy = sp;
      } else if (keyCode == DOWN) {
        vy = -sp;
      } else if (keyCode == LEFT) {
        vx = sp;
      } else if (keyCode == RIGHT) {
        vx = -sp;
      }
    }
  }

  void show() {
    rectMode(CENTER);
    fill(190, 0, 100);
    tint(255, 255);
    image(eB, x, y, hw, hw);
    textSize(30);
    arc(x + hw/2+ hw/3, y - hw/2 + hw/3, hw/2, hw/2, 0 , map(timer, 0, time, 0, TWO_PI),PIE);
    //text("morkita linda", x, y-60);
    //square(x, y, hw);
  }

  void movimento() {
    if (keyPressed) {
      if (keyCode != LEFT && keyCode != RIGHT) {
        vx = 0;
      }
      if (keyCode != UP && keyCode != DOWN) {
        vy = 0;
      }
      if (keyCode == UP) {
        vy = -sp;
      } else if (keyCode == DOWN) {
        vy = sp;
      } else if (keyCode == LEFT) {
        vx = -sp;
      } else if (keyCode == RIGHT) {
        vx = sp;
      }
    } else {
      vx = 0;
      vy = 0;
    }
  }

  void bermas() {
    if (x-hw/2 <= 0) {
      vx = sp;
      vy = 0;
      hit.play();
    } else if (x+hw/2 >= width) {
      vx = -sp;
      hit.play();
    }
    if (y-hw/2 <= UIBox) {
      vy = sp;
      hit.play();
    } else if (y+hw/2 >= height) {
      vy = -sp;
      hit.play();
    }
  }
}
