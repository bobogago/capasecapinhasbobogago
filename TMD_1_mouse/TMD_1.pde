ArrayList<Letra> c = new ArrayList();
final PVector grav = new PVector(0, 1);
float floor;
final String palavra = "AlegriaAlegria";
char[] letras = new char[palavra.length()];

void setup() {
  fullScreen();
  //floor = height*4/5;
  
  rectMode(CENTER);
  textAlign(CENTER, BASELINE);
  textFont( createFont("Georgia", 32));
  
  floor = height+textAscent();
  for (int i = 0; i < palavra.length(); i++) {
    letras[i] = palavra.toUpperCase().charAt(i);
    adicPalavra();
  }

}


void draw() {
  background(0);
  int quantPalavras = round(map(dist(mouseX,mouseY,width/2,mouseY),0,width/2,18,34));
  
  //println(frameCount);
  for (int i = c.size() - 1; i>= 0; i--) {
    c.get(i).move();
    c.get(i).desenha();

    if (c.get(i).vida <= 0) {
      c.remove(i);
      if (c.size() < quantPalavras*palavra.length()) {
        adicPalavra();
      }
    }
  }
  println(c.size());

  //if (frameCount%500 == 0) {
  //  adicPalavra();
  //}
}

void adicPalavra() {
  println("vai adic");
  for (int cha = 0; cha < palavra.length(); cha++) {
    //c.add(new Letra(width/2-(palavra.length()+1)/2*25 + (25*(cha+1)), random(20, floor), letras[cha]));
    c.add(new Letra(width/(palavra.length()+1)*(cha+1), random(textAscent(), floor), letras[cha]));
  }
  println(frameCount);
  println("adic");
  println(c.size());
}
