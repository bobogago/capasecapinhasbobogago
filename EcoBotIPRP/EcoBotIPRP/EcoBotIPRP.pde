import processing.sound.*;
Player player;
Lixo[] li;
Pedra[] p;
//Tronco[] t;
Arvore[] a;
Station[] sta;
Mud[] m;
BotaoUI[] b;
SpeedUp su;
TimeStop ts;

int score, highScore = 0;
color ebc;
int volume = 1;
int nível = 1;
int time;
int lixoMax, liAp, liApDisp;
int aAp, aMax, aApDisp;
int staMax, tMax, mMax, pMax;
float UIBox = 75, nrg, ebx, eby= UIBox/2, nrgMax = 500, nrgLoss = nrgMax/20;
boolean modoArcada = false, nrgDecay = false, menu = true, modoDesafio = false, spUpSpw = false, tsSpw = false, nrgDecayPaused = false;
PImage title, bg, terreno, iconLi, iconA;
SoundFile hit, station, water, pickup, sUp, tick, menuBg, hardBg;

void setup() {
  fullScreen();
  textAlign(CENTER);
  imageMode(CENTER);

  b = new BotaoUI[6];

  b[0] = new BotaoUI(25, height/2, 1);
  b[1] = new BotaoUI(width/3 + 25, height/2, 2);
  b[2] = new BotaoUI(2*width/3+ 25, height/2, 3);
  b[3] = new BotaoUI(width/3+ 25, 2*height/3, 0);
  b[4] = new BotaoUI(2*width/3+ 25, 2*height/3, -4);
  b[5] = new BotaoUI(25, 2*height/3, -4);

  iconLi = loadImage("trash1.png");
  iconA = loadImage("arHidr.png");
  title = loadImage("TitleCard.png");
  bg = loadImage("Bg.png");
  terreno = loadImage("Terreno.png");
  terreno.resize(width, height);


  hit = new SoundFile(this, "hit.aif");
  station = new SoundFile(this, "sta.aif");
  water = new SoundFile(this, "water.aif");
  pickup = new SoundFile(this, "Pickup.aif");
  sUp = new SoundFile(this, "speedup.aif");
  tick = new SoundFile(this, "clock.aif");
  menuBg = new SoundFile(this, "Menu.aif");
  hardBg = new SoundFile(this, "Difícil.aif");
  ebx = width/2;
  player = new Player();
  nrg = nrgMax;
  ebc = color(0, 0, 255);
  menuBg.loop();
}

void draw() {
  if (menu) {
    menu();
  } else {
    game();
  }
}

void keyPressed() {
  if (key == 's' && key == 'S') {
    if (volume != 0) {
      volume = 0;
    } else {
      volume = 1;
    }
    hit.amp(volume);
    station.amp(volume);
    water.amp(volume);
    pickup.amp(volume);
    sUp.amp(volume);
    tick.amp(volume);
    menuBg.amp(volume);
    hardBg.amp(volume);
  }
}
void menu() {
  rectMode(CORNER);
  background(#6596E8);
  textSize(50);

  image(bg, width/2, 2*height/3);
  image(title, width/2, height/6);

  b[0].update(color(0, 170, 0));
  b[0].display("Fácil");

  b[1].update(color(170, 170, 0));
  b[1].display("Médio");

  b[2].update(color(170, 0, 0));
  b[2].display("Difícil");

  b[3].update(color(170, 0, 100));
  b[3].display("Modo Arcada", "Atinge o máximo de pontos até acabar a energia.", width/2, 7*height/8);

  b[4].update(color(100, 0, 170));
  b[4].display("Modo Desafio", "Ao fim de cada fase aumenta a dificuldade", width/2, 7*height/8);


  b[5].update(color(0, 100, 170));
  b[5].display("Tutorial", "M para voltar ao Menu; Barra de espaço para regar; Setas de direção para mexer; S para silenciar; Apanhar todos os lixos e regar todas as plantas para vencer!");


  for (int i = 0; i < b.length; i++) {
    if (b[i].hover() && mousePressed) {
      if (i !=5) {
        nível = b[i].info;
        aAp = 0;
        liAp = 0;
        menuBg.stop();
        spawn(nível);
        if (i == 4) {
          hardBg.loop();
          modoDesafio = true;
        }
        menu = false;
      }
    }
  }
}

void game() {
  //background(30, 150, 70);
  background(terreno);

  if (keyPressed) {
    if (key == 'm' || key == 'M') {
      modoDesafio = false;
      modoArcada = false;
      nrg = nrgMax;
      hardBg.stop();
      menuBg.loop();
      nível = -5;
      menu = true;
    }
    if (!nrgDecayPaused) {
      nrgDecay = true;
    }
  }

  if (nrg > 0 && nrgDecay && focused) {
    //ebc = color(0,0,255);
    nrg -= nrgMax/2000;
  }

  //Verificar se as Árvores estão a ser regadas;
  for (int i = 0; i < a.length; i++) {
    if (a[i].collision(player.x, player.y, 0)) {
      if (keyPressed && key == ' ') {
        if (a[i].c == a[i].desid) {
          nrg -= nrgLoss;
          aAp ++;
          aApDisp++;
          water.play(1, volume);
        }
        a[i].c = a[i].hidr;
        a[i].arvore = loadImage("arHidr.png");
      }
    }
  }

  for (int i = 0; i < p.length; i++) {
    player.halt = p[i].collision(player.x, player.y, player.hw);
    if (player.halt) {
      hit.play(1, volume);
      if (nrg > 0) {
        nrg -= nrgLoss/20;
        //ebc = color(255,0,0);
      }
      break;
    }
  }

  for (int i = 0; i < m.length; i++) {
    player.slowed = m[i].collision(player.x, player.y, 0);
    if (player.slowed) {
      if (nrg > 0) {
        //ebc = color(255,100,0);
        nrg -= nrgLoss/150;
      }
      break;
    }
  }

  player.update();

  for (int i = 0; i < li.length; i++) {
    if (li[i].collision(player.x, player.y, 0, true)) {
      pickup.play(1, volume);
      nrg -= nrgLoss;
      liAp ++;
      liApDisp ++;
    }
  }

  for (int i = 0; i < sta.length; i++) {
    if (sta[i].collision(player.x, player.y, 0)) {
      if (nrg + 2*nrgLoss > nrgMax) {
        nrg = nrgMax;
      } else {
        nrg += 2*nrgLoss;
      }
      station.play(1, volume);
    }
  }

  if (spUpSpw == true) {
    if (su.collision(player.x, player.y, player.hw)) {
      time = 40;
      player.timer = time;
      player.spedUp = true;
      sUp.play(1, volume);
    }
  }


  if (tsSpw == true) {
    if (ts.collision(player.x, player.y, player.hw)) {
      time = 200;
      player.timer = 200;
      nrgDecayPaused = true;
      //player.spedUp = true;
      tick.play(1, volume);
    }
    if (player.timer > 0) {
      if (nrgDecayPaused) {
        nrgDecay = false;
        player.timer--;
      }
    } else {
      nrgDecayPaused = false;
      nrgDecay = true;
    }
  }

  for (int i = 0; i < m.length; i++) {
    m[i].show();
  }

  //Mostrar Troncos
  //for (int i = 0; i < t.length; i++) {
  //  t[i].show();
  //}
  //Mostrar Pedras
  for (int i = 0; i < p.length; i++) {
    p[i].show();
  }
  //Mostrar Lixo
  for (int i = 0; i < li.length; i++) {
    li[i].show();
  }
  for (int i = 0; i < sta.length; i++) {
    sta[i].show();
  }

  if (spUpSpw) {
    su.show();
  }

  if (tsSpw) {
    ts.show();
  }

  //Mostrar Árvores
  for (int i = 0; i < a.length; i++) {
    a[i].show();
  }

  player.show();

  UI();
}
void spawn(int dif) {
  if (nível == -4 && modoDesafio) {
    lixoMax = 1;
    aMax = 1;
    staMax = 0;
    //tMax = 0;
    mMax = 0;
    pMax = 1;
  } else if (modoDesafio) {
    lixoMax = round(map(dif, -4, 3, 2, 10));
    aMax = round(map(dif, -4, 3, 1, 6));
    staMax = round(map(dif, -4, 3, 0, 7));
    //tMax = 0;
    mMax = round(map(dif, -4, 3, 0, 4));
    pMax = round(map(dif, -4, 3, 1, 15));
  } else if (dif == 0) {
    modoArcada = true;
    lixoMax = 5;
    aMax = 2;
    staMax = 5;
    //tMax = 0;
    mMax = 2;
    pMax = 10;
  } else if (dif == 1) {
    lixoMax = 5;
    aMax = 2;
    staMax = 2;
    //tMax = 0;
    mMax = 2;
    pMax = 5;
  } else if (dif == 2) {
    lixoMax = 7;
    aMax = 4;
    staMax = 5;
    //tMax = 0;
    mMax = 3;
    pMax = 10;
  } else if (dif == 3) {
    hardBg.loop();
    lixoMax = 10;
    aMax = 6;
    staMax = 7;
    //tMax = 0;
    mMax = 5;
    pMax = 15;
  }


  if (!modoArcada) {
    player = new Player();
  }

  a = new Arvore[aMax];
  for (int i = 0; i < a.length; i++) {
    a[i] = new Arvore();
  }

  li = new Lixo[lixoMax];
  for (int i = 0; i < li.length; i++) {
    li[i] = new Lixo();
    li[i].apanhado = false;
    if (li[i].collision(player.x, player.y, player.hw)) {
      li[i].newPlace();
    }
  }

  //t = new Tronco[tMax];
  //for (int i = 0; i < t.length; i++) {
  //  t[i] = new Tronco();
  //  for (int j = 0; j < li.length; j++) {
  //    if (li[j].collision(t[i].x, t[i].y, 80)) {
  //      t[i].newPlace();
  //    }
  //  }
  //  if (t[i].collision(player.x, player.y, 0)) {
  //    t[i].newPlace();
  //  }
  //}

  p = new Pedra[pMax];
  for (int i = 0; i < p.length; i++) {
    p[i] = new Pedra();
    for (int j = 0; j < li.length; j++) {
      if (li[j].collision(p[i].x, p[i].y, 80)) {
        p[i].newPlace();
      }
    }
    if (p[i].collision(player.x, player.y, player.hw)) {
      p[i].newPlace();
    }
  }

  sta = new Station[staMax];
  for (int i = 0; i < sta.length; i++) {
    sta[i] = new Station();
    if (sta[i].collision(player.x, player.y, player.hw)) {
      sta[i].newPlace();
    }
  }

  if (random(1) < 0.2) {
    su = new SpeedUp();
    spUpSpw = true;
    if (su.collision(player.x, player.y, player.hw)) {
      su.newPlace();
    }
  }

  if (random(1) < 0.2) {
    ts = new TimeStop();
    tsSpw = true;
    if (ts.collision(player.x, player.y, player.hw)) {
      ts.newPlace();
    }
  }

  m = new Mud[mMax];
  for (int i = 0; i < m.length; i++) {
    m[i] = new Mud();
    if (m[i].collision(player.x, player.y, player.hw)) {
      m[i].newPlace();
    }
  }
}


void UI() {
  score = aApDisp*10+liApDisp*5;
  if (score > highScore) {
    highScore = score;
  }
  fill(0);
  rect(width/2, UIBox/2, width, UIBox);
  fill(0, 0, 100);
  rect(ebx, eby, nrgMax, UIBox/2);
  nrgBar();
  rectMode(CENTER);
  fill(255);
  textSize(40);
  text("Pontos: " + score, 6*width/8, 50);
  text("High Score: " + highScore, 7*width/8, 50);
  if (modoArcada) {
    image(iconLi, width/8-55, 35, 50, 50);
    text(liApDisp, width/8, 50);
    image(iconA, 2*width/8-55, 35, 50, 50);
    text(aApDisp, 2*width/8, 50);
  } else {
    image(iconLi, width/8-55, 35, 50, 50);
    text(liAp + "/" + lixoMax, width/8, 50);
    image(iconA, 2*width/8-55, 35, 50, 50);
    text(aAp + "/" + aMax, 2*width/8, 50);
    if (modoDesafio) {
      textSize(40);
      text(nível+5, width/2+ nrgMax/2 + 50, 50);
    }
  }

  if (nrg <= 0) {
    perdeu();
  }
  if (liAp >= lixoMax && aAp >= aMax) {
    if (modoArcada) {
      restart();
    } else {
      ganhou();
    }
  }
}

void nrgBar() {
  rectMode(CORNER);
  fill(ebc);
  rect(ebx - nrgMax/2, eby- UIBox/4, nrg, UIBox/2);
}

void restart() {
  if (!modoArcada) {
    nrg = nrgMax;
    liApDisp = 0;
    aApDisp = 0;
  }
  liAp = 0;
  aAp = 0;
  tsSpw = false;
  nrgDecay = false;
  player.sp = player.startSp;

  spawn(nível);
}

boolean ganho = false;

void perdeu() {
  if (!ganho) {
    nrg = 0;
    player.sp = 0;
    fill(0);
    rect(width/2, height/2, width/2, height/4);
    fill(255);
    if (modoDesafio) {
      textSize(100);
      text("Perdeste o desafio", width/2, height/2);
      nível = -4;
    } else {
      textSize(100);
      text("Perdeste", width/2, height/2);
    }
    textSize(50);
    text("Experimenta de novo com R", width/2, height/2+height/16);

    if (keyPressed && key == 'r') {
      if (modoArcada) {
        nrg = nrgMax;
      }
      restart();
    }
  }
}

void ganhou() {
  nrgDecay = false;
  ganho = true;
  textSize(100);
  player.sp = 0;
  fill(0);
  rect(width/2, height/2, width/2, height/4);
  fill(255);
  textSize(100);
  text("Ganhaste", width/2, height/2);
  if (modoDesafio) {
    textSize(50);
    text("Avança para o nível seguinte com R", width/2, height/2+height/16);
  } else {
    textSize(50);
    text("Reinicia o nível com R", width/2, height/2+height/16);
  }
  if (keyPressed && key == 'r') {
    if (modoDesafio) {
      nível++;
    }
    ganho = false;
    restart();
  }
}
