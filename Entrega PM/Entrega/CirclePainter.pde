class CirclePainter extends Ecra {
  float amp, rate;
  PImage i, i2;
  int largura, altura, r = 25, r2 = 80, max = 5, count = 0;
  float nPontos = 10;
  BotaoUI toggle;
  boolean v1 = true;
  color bg = color(255);

  CirclePainter() {
    noStroke();
    s.loop();
    p.input(s);
    b.input(s);
    a.input(s);


    i = loadImage("porto.jpg");
    i.resize(400, 0);
    largura = i.width;
    altura = i.height;

    i2 = createImage(largura, altura, ARGB);

    windowResize(largura, altura);
    toggle = new BotaoUI(0, height-100);

    background(255); //tela branca na frente
  }

  void desenha() {
    if (v1) {
      versao1();
      toggle();
      fill(255);
      textSize(15);
      text("1", toggle.x+toggle.l/2, toggle.y+toggle.a/2+25);
    } else {
      versao2();
      toggle();
      fill(255);
      textSize(15);
      text("2", toggle.x+toggle.l/2, toggle.y+toggle.a/2+25);
    }
  }

  void versao2() {
    noFill();
    circle(mouseX, mouseY, r2*2);
    float amp = a.analyze();
    nPontos = map(amp, 0, 0.5, 200, 300); //melhorar??!!
    //println(amp);

    float rate = map(mouseY, 0, height, 0.5, 2); //acelerar
    s.rate(rate);


    for (int j = 0; j < nPontos; j++) {

      float x = random(0, width);
      float y = random(0, height);
      color cor;


      if (dist(x, y, mouseX, mouseY) < r2) {
        cor = i.get(round(x), round(y)); //pegar as cores dos pixeis da imagem
      } else {
        cor = color(bg);
      }

      float raio = random(3, 5);
      fill(cor);
      circle(x, y, raio*2); //desenhar circulos com as cores da imagem
    }
  }

  void versao1() {
    amp = a.analyze();
    rate = map(mouseY, 0, height, 0.5, 2); //acelerar
    nPontos = map(amp, 0, 1, 1, 20);
    s.rate(rate);

    //if (b.isBeat()) {
    max = constrain(round(map(p.analyze(0), 50, 300, 1, 5)), 1, 5);
    r = round(map(p.analyze(0), 50, 300, 15, 50));
    // }


    for (int p = 0; p < nPontos; p++) {
      {
        int x = round(random(mouseX-r, mouseX+r));
        int y = round(random(mouseY-r, mouseY+r));

        if (dist(mouseX, mouseY, x, y) < r) {
          color cor = i.get(round(x), round(y)); //pegar as cores dos pixeis da imagem


          //ellipseMode(CENTER);
          //float raio = map(amp, 0, 2, 3, 9);
          float raio = random(3, max);
          fill(cor);
          circle(x, y, raio*2); //desenhar circulos com as cores da imagem
        }
      }
      image(i2, 0, 0);
    }
  }

  void keyPress() {
    if (key == 'f'|| key == 'F') {
      background(255);
    } else if (key == 'r'|| key == 'R') {
      s.jump(0);
    }
  }

  void toggle() {
    toggle.display("Switch");

    if (toggle.hover() && clickedGate()) {
      v1 = !v1;
    }
  }

  boolean clickedGate() {
    boolean cl = false;
    if (mousePressed && !clickedPrev) {
      clickedPrev = true;
    } else if (clickedPrev && !mousePressed) {
      clickedPrev = false;
      cl = true;
    }
    return cl;
  }
}
