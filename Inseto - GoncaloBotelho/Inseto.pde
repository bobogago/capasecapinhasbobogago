Mosquito bug;
Mosquito[] bugs = new Mosquito[50];
float tst = 5;
int mudarCam = 1;
void setup() {
  size(800, 600, P3D);
  translate(400, 300, 0);
  noStroke();

  bug = new Mosquito(0, 0, 0, 80/tst, 20/tst, 50/tst, 10, false);
  bug.flying = !bug.flying;
  bug.grounded = !bug.grounded;

  cameraV = new PVector();

  cameraV.y = -50;

  for (int i = 0; i < bugs.length; i++) {
    tst = random(15, 20);
    bugs[i] = new Mosquito(0, 0, 0, 80/tst, 20/tst, 50/tst, 10, true);
  }
}

void draw() {
  doEnvironment();
  bug.desenha();
  for (int i = 0; i < bugs.length; i++) {
    bugs[i].desenha();
  }
}
