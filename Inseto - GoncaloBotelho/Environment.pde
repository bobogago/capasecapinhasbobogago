PVector cameraV, /*cameraOr,*/ cameraLA;
float raioC = 300;
float lightAng=0;
int floor = 250;
float angC = TWO_PI/3;

void doEnvironment() {
  background(255);
  lights();
  beLight();
  moveCamera();
  cam();

  drawFloor(0, floor, 0, 1000, 1000);
  drawWall(0, -250, -500, 1000, 1000);
  pushMatrix();
  rotateY(-PI/2);
  drawWall(0, -250, -500, 1000, 1000);
  popMatrix();
}

void cam() {
  cameraLA = new PVector(0, 0, 0);

  cameraV.x = cameraLA.x + raioC*cos(angC);
  cameraV.z = cameraLA.z + raioC*sin(angC);
  cameraV.y = constrain(cameraV.y, -raioC, floor-10);

  camera(cameraV.x, cameraV.y, cameraV.z, cameraLA.x, cameraLA.y, cameraLA.z, 0, 1, 0);

  if (mudarCam%2 == 0) {
    ortho(-width/2, width/2, -height/2, height/2, 0, 3500);
  } else {
    perspective(PI/2, float(width)/float(height), 30.1, 10000);
  }
}

void keyPressed() {
  switch(key) {
  case' ':
    bug.flying = !bug.flying;
    bug.grounded = !bug.grounded;
    break;
  case 'p':
    mudarCam++;
    break;
  }
}

void moveCamera() {
  if (keyPressed) {
    float angInc = PI/map(raioC, 100, 1000, 100,250);
    float yInc = map(raioC, 100, 1000, 5,10);
    switch(str(key).toLowerCase()) {
    case "+":
      raioC-=10;
      break;
    case "-":
      raioC+=10;
      break;
    case "w":
      cameraV.y -= yInc;
      break;
    case "s":
      cameraV.y += yInc;
      break;
    case "a":
      angC += angInc;
      break;
    case "d":
      angC -= angInc;
      break;
    case "c":
      cameraV.y = 0;
      raioC = 100;
      angC = PI/2;
      break;
    }

    raioC = constrain(raioC, 100, 1000);
    println(raioC);
  }
}

void drawFloor(int x, int y, int z, int w, int d) {
  float halfW = w/2;
  float halfD = d/2;

  PVector pA = new PVector( x-halfW, y, z+halfD);
  PVector pB = new PVector( x+halfW, y, z+halfD);
  PVector pC = new PVector( x+halfW, y, z-halfD);
  PVector pD = new PVector( x-halfW, y, z-halfD);

  beginShape(QUADS);
  fill(188, 159, 103);

  vertex( pD.x, pD.y, pD.z, 0, 1000); // D
  vertex( pC.x, pC.y, pC.z, 1000, 1000); // C
  vertex( pB.x, pB.y, pB.z, 1000, 0); // B
  vertex( pA.x, pA.y, pA.z, 0, 0); // A
  endShape();
}
void drawWall(int x, int y, int z, int w, int h) {
  float halfW = w/2;
  float halfH = h/2;

  PVector pA = new PVector( x-halfW, y+halfH, z);
  PVector pB = new PVector( x+halfW, y+halfH, z);
  PVector pC = new PVector( x+halfW, y-halfH, z);
  PVector pD = new PVector( x-halfW, y-halfH, z);

  beginShape(QUADS);
  fill(100, 100, 180);

  vertex( pD.x, pD.y, pD.z, 0, 1000); // D
  vertex( pC.x, pC.y, pC.z, 1000, 1000); // C
  vertex( pB.x, pB.y, pB.z, 1000, 0); // B
  vertex( pA.x, pA.y, pA.z, 0, 0); // A
  endShape();
}

void beLight() {
  lightAng += TWO_PI/1000;
  float cX = 250*cos(lightAng);
  float cY = -250;
  float cZ = 250*sin(lightAng);
  int cC = 255;
  drawCube(cX, cY, cZ, 10, 10, 10);
  pointLight(cC, cC, cC, cX, cY, cZ);
}
