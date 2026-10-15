void drawCube(float x, float y, float z, float w, float h, float d) {
  float halfW = w/2;
  float halfH = h/2;
  float halfD = d/2;
  PVector pA = new PVector( x-halfW, y-halfH, z+halfD);
  PVector pB = new PVector( x+halfW, y-halfH, z+halfD);
  PVector pC = new PVector( x+halfW, y-halfH, z-halfD);
  PVector pD = new PVector( x-halfW, y-halfH, z-halfD);

  PVector pE = new PVector( x-halfW, y+halfH, z+halfD);
  PVector pF = new PVector( x+halfW, y+halfH, z+halfD);
  PVector pG = new PVector( x+halfW, y+halfH, z-halfD);
  PVector pH = new PVector( x-halfW, y+halfH, z-halfD);

  beginShape(QUADS);
  // Lado Cima (Y=-h)
  fill(255, 0, 0);
  vertex( pA.x, pA.y, pA.z); // A
  vertex( pD.x, pD.y, pD.z); // D
  vertex( pC.x, pC.y, pC.z); // C
  vertex( pB.x, pB.y, pB.z); // B

  // Lado Baixo (Y=h)
  fill(0, 255, 0);
  vertex( pF.x, pF.y, pF.z); // F
  vertex( pG.x, pG.y, pG.z); // G
  vertex( pH.x, pH.y, pH.z); // H
  vertex( pE.x, pE.y, pE.z); // E

  // implementar pelos alunos

  // Frente (Z=d)
  fill(0, 0, 255);
  vertex( pA.x, pA.y, pA.z); // A
  vertex( pB.x, pB.y, pB.z); // B
  vertex( pF.x, pF.y, pF.z); // F
  vertex( pE.x, pE.y, pE.z); // E

  // Tras (Z=-d)
  fill(0, 255, 255); // ciano
  vertex( pG.x, pG.y, pG.z); // G
  vertex( pC.x, pC.y, pC.z); // C
  vertex( pD.x, pD.y, pD.z); // D
  vertex( pH.x, pH.y, pH.z); // H
  // implementar pelos alunos


  // Lado direito (X=w)
  fill(255, 0, 255); // magenta
  // implementar pelos alunos
  vertex( pG.x, pG.y, pG.z); // G
  vertex( pF.x, pF.y, pF.z); // F
  vertex( pB.x, pB.y, pB.z); // B
  vertex( pC.x, pC.y, pC.z); // C

  // Lado esquerdo (X=-w)
  fill(255, 255, 0); // amarelo
  vertex( pH.x, pH.y, pH.z); // H
  vertex( pD.x, pD.y, pD.z); // D
  vertex( pA.x, pA.y, pA.z); // A
  vertex( pE.x, pE.y, pE.z); // E



  // implementar pelos alunos

  endShape(CLOSE);
}
void drawCube(float x, float y, float z, float w, float h, float d, color phil) {
  float halfW = w/2;
  float halfH = h/2;
  float halfD = d/2;
  PVector pA = new PVector( x-halfW, y-halfH, z+halfD);
  PVector pB = new PVector( x+halfW, y-halfH, z+halfD);
  PVector pC = new PVector( x+halfW, y-halfH, z-halfD);
  PVector pD = new PVector( x-halfW, y-halfH, z-halfD);

  PVector pE = new PVector( x-halfW, y+halfH, z+halfD);
  PVector pF = new PVector( x+halfW, y+halfH, z+halfD);
  PVector pG = new PVector( x+halfW, y+halfH, z-halfD);
  PVector pH = new PVector( x-halfW, y+halfH, z-halfD);
  fill(phil);
  beginShape(QUADS);
  // Lado Cima (Y=-h)
  vertex( pA.x, pA.y, pA.z); // A
  vertex( pD.x, pD.y, pD.z); // D
  vertex( pC.x, pC.y, pC.z); // C
  vertex( pB.x, pB.y, pB.z); // B

  // Lado Baixo (Y=h)
  vertex( pF.x, pF.y, pF.z); // F
  vertex( pG.x, pG.y, pG.z); // G
  vertex( pH.x, pH.y, pH.z); // H
  vertex( pE.x, pE.y, pE.z); // E

  // Frente (Z=d)
  vertex( pA.x, pA.y, pA.z); // A
  vertex( pB.x, pB.y, pB.z); // B
  vertex( pF.x, pF.y, pF.z); // F
  vertex( pE.x, pE.y, pE.z); // E

  // Tras (Z=-d)
  vertex( pG.x, pG.y, pG.z); // G
  vertex( pC.x, pC.y, pC.z); // C
  vertex( pD.x, pD.y, pD.z); // D
  vertex( pH.x, pH.y, pH.z); // H
  // implementar pelos alunos


  // Lado direito (X=w)
  vertex( pG.x, pG.y, pG.z); // G
  vertex( pF.x, pF.y, pF.z); // F
  vertex( pB.x, pB.y, pB.z); // B
  vertex( pC.x, pC.y, pC.z); // C

  // Lado esquerdo (X=-w)
  vertex( pH.x, pH.y, pH.z); // H
  vertex( pD.x, pD.y, pD.z); // D
  vertex( pA.x, pA.y, pA.z); // A
  vertex( pE.x, pE.y, pE.z); // E

  endShape(CLOSE);
}
void drawPrism(float x, float y, float z, float w, float h, float d) {
  float halfW = w / 2;
  float halfH = h / 2;
  float halfD = d / 2;
  PVector pA = new PVector(x+halfW, y-halfH, z+halfD);
  PVector pB = new PVector(x-halfW, y-halfH, z+halfD);
  PVector pC = new PVector(x, y+halfH, z+halfD);
  PVector pD = new PVector(x+halfW, y-halfH, z-halfD);
  PVector pE = new PVector(x-halfW, y-halfH, z-halfD);
  PVector pF = new PVector(x, y+halfH, z-halfD);

  beginShape(TRIANGLES);

  // Frente (Z=d)
  fill(255, 0, 0);
  // implementar pelos alunos
  vertex(pA.x, pA.y, pA.z);
  vertex(pB.x, pB.y, pB.z);
  vertex(pC.x, pC.y, pC.z);

  // Tras (Z=-d)
  fill(0, 255, 0);
  // implementar pelos alunos
  vertex(pD.x, pD.y, pD.z);
  vertex(pE.x, pE.y, pE.z);
  vertex(pF.x, pF.y, pF.z);
  endShape(CLOSE);

  beginShape(QUADS);
  // Esquerdo (X=-w)
  vertex(pC.x, pC.y, pC.z);
  vertex(pB.x, pB.y, pB.z);
  vertex(pE.x, pE.y, pE.z);
  vertex(pF.x, pF.y, pF.z);
  // implementar pelos alunos


  // Direito (X=w)
  fill(255, 255, 0); // yellow
  // implementar pelos alunos
  vertex(pA.x, pA.y, pA.z);
  vertex(pC.x, pC.y, pC.z);
  vertex(pF.x, pF.y, pF.z);
  vertex(pD.x, pD.y, pD.z);

  // Baixo (Y=-h)
  fill(255, 0, 255); // magenta
  vertex(pA.x, pA.y, pA.z);
  vertex(pB.x, pB.y, pB.z);
  vertex(pE.x, pE.y, pE.z);
  vertex(pD.x, pD.y, pD.z);
  // implementar pelos alunos


  endShape(CLOSE);
}
void drawPrism(float x, float y, float z, float w, float h, float d, color phil) {
  float halfW = w / 2;
  float halfH = h / 2;
  float halfD = d / 2;
  PVector pA = new PVector(x+halfW, y-halfH, z+halfD);
  PVector pB = new PVector(x-halfW, y-halfH, z+halfD);
  PVector pC = new PVector(x, y+halfH, z+halfD);
  PVector pD = new PVector(x+halfW, y-halfH, z-halfD);
  PVector pE = new PVector(x-halfW, y-halfH, z-halfD);
  PVector pF = new PVector(x, y+halfH, z-halfD);

  beginShape(TRIANGLES);

  // Frente (Z=d)
  fill(phil);
  // implementar pelos alunos
  vertex(pA.x, pA.y, pA.z);
  vertex(pB.x, pB.y, pB.z);
  vertex(pC.x, pC.y, pC.z);

  // Tras (Z=-d)

  // implementar pelos alunos
  vertex(pD.x, pD.y, pD.z);
  vertex(pE.x, pE.y, pE.z);
  vertex(pF.x, pF.y, pF.z);
  endShape(CLOSE);

  beginShape(QUADS);
  // Esquerdo (X=-w)
  vertex(pC.x, pC.y, pC.z);
  vertex(pB.x, pB.y, pB.z);
  vertex(pE.x, pE.y, pE.z);
  vertex(pF.x, pF.y, pF.z);
  // implementar pelos alunos


  // Direito (X=w)
  // implementar pelos alunos
  vertex(pA.x, pA.y, pA.z);
  vertex(pC.x, pC.y, pC.z);
  vertex(pF.x, pF.y, pF.z);
  vertex(pD.x, pD.y, pD.z);

  // Baixo (Y=-h)
  vertex(pA.x, pA.y, pA.z);
  vertex(pB.x, pB.y, pB.z);
  vertex(pE.x, pE.y, pE.z);
  vertex(pD.x, pD.y, pD.z);
  // implementar pelos alunos


  endShape(CLOSE);
}


void drawPyramid(int x, int y, int z, int w, int h, int d) {
  int halfW = w / 2;
  int halfD = d / 2;

  // apice
  float apexX = x;
  float apexY = y + h;
  float apexZ = z;

  PVector pA = new PVector(x+halfW, y, z+halfD);
  PVector pB = new PVector(x+halfW, y, z-halfD);
  PVector pC = new PVector(x-halfW, y, z-halfD);
  PVector pD = new PVector(x-halfW, y, z+halfD);
  PVector pApex = new PVector(apexX, apexY, apexZ);


  // implementar pelos alunos
  beginShape(QUADS);
  fill(255, 0, 255); // magenta
  vertex(pA.x, pA.y, pA.z);
  vertex(pB.x, pB.y, pB.z);
  vertex(pC.x, pC.y, pC.z);
  vertex(pD.x, pD.y, pD.z);
  endShape(CLOSE);
  beginShape(TRIANGLES);
  fill(255, 0, 0);
  vertex(pA.x, pA.y, pA.z);
  vertex(pB.x, pB.y, pB.z);
  vertex(pApex.x, pApex.y, pApex.z);

  fill(255, 255, 0);
  vertex(pC.x, pC.y, pC.z);
  vertex(pApex.x, pApex.y, pApex.z);
  vertex(pB.x, pB.y, pB.z);

  fill(0, 255, 255);
  vertex(pC.x, pC.y, pC.z);
  vertex(pD.x, pD.y, pD.z);
  vertex(pApex.x, pApex.y, pApex.z);

  fill(0, 0, 255);
  vertex(pD.x, pD.y, pD.z);
  vertex(pApex.x, pApex.y, pApex.z);
  vertex(pA.x, pA.y, pA.z);
  endShape(CLOSE);
}
void drawCylinder(float x, float y, float z, float r, float d, int lados) {
  // implementar pelos alunos
  beginShape();
  for (int i = 0; i < lados; i++) {
    float px = x+r*cos(TWO_PI/lados*i);
    float py = y+r*sin(TWO_PI/lados*i);
    vertex(px, py, z-d/2);
  }
  endShape(CLOSE);
  beginShape();
  for (int i = 0; i < lados; i++) {
    float px = x+r*cos(TWO_PI/lados*i);
    float py = y+r*sin(TWO_PI/lados*i);
    vertex(px, py, z+d/2);
  }
  endShape(CLOSE);
  for (int i = 0; i < lados; i++) {
    beginShape(QUADS);

    float pAx = x+r*cos(TWO_PI/lados*i);
    float pAy = y+r*sin(TWO_PI/lados*i);
    float pBx = x+r*cos(TWO_PI/lados*(i+1));
    float pBy = y+r*sin(TWO_PI/lados*(i+1));

    vertex(pAx, pAy, z-d/2);
    vertex(pAx, pAy, z+d/2);
    vertex(pBx, pBy, z+d/2);
    vertex(pBx, pBy, z-d/2);

    endShape(CLOSE);
  }
}

boolean arcCalc(float i, float arcStart, float arcStop, float lados) {
  if (i<arcStop) {
    return true;
  }
  return false;
}
void drawCylinder(float x, float y, float z, float r, float d, float lados, float arcStart, float arcStop, color phil) {
  // implementar pelos alunos
  lados = constrain(lados, 4, lados);
  fill(phil);
  beginShape();
  for (float i = arcStart; i < arcStop; i+=TWO_PI/lados) {
    if (arcCalc(i, arcStart, arcStop, lados)) {
      float px = x+r*cos(i);
      float py = y+r*sin(i);
      vertex(px, py, z-d/2);
    }
  }
  float pCx = x+r*cos(arcStop);
  float pCy = y+r*sin(arcStop);
  vertex(pCx, pCy, z-d/2);
  endShape(CLOSE);

  beginShape();
  for (float i = arcStart; i < arcStop; i+=TWO_PI/lados) {
    if (arcCalc(i, arcStart, arcStop, lados)) {
      float px = x+r*cos(i);
      float py = y+r*sin(i);
      vertex(px, py, z+d/2);
    }
  }
  pCx = x+r*cos(arcStop);
  pCy = y+r*sin(arcStop);
  vertex(pCx, pCy, z+d/2);
  endShape(CLOSE);

  for (float i = arcStart; i < arcStop; i+=TWO_PI/lados) {
    if (arcCalc(i-TWO_PI/lados, arcStart, arcStop, lados)) {
      beginShape(QUADS);

      float pAx = x+r*cos(i);
      float pAy = y+r*sin(i);
      float pBx = x+r*cos(i+TWO_PI/lados);
      float pBy = y+r*sin(i+TWO_PI/lados);

      if (arcCalc(i+TWO_PI/lados, arcStart, arcStop, lados)) {
        vertex(pAx, pAy, z-d/2);
        vertex(pAx, pAy, z+d/2);
        vertex(pBx, pBy, z+d/2);
        vertex(pBx, pBy, z-d/2);
      } else {
        pBx = x+r*cos(arcStop);
        pBy = y+r*sin(arcStop);
        vertex(pAx, pAy, z-d/2);
        vertex(pAx, pAy, z+d/2);
        vertex(pBx, pBy, z+d/2);
        vertex(pBx, pBy, z-d/2);

        pAx = x+r*cos(arcStop);
        pAy = y+r*sin(arcStop);
        pBx = x+r*cos(arcStart);
        pBy = y+r*sin(arcStart);
        vertex(pAx, pAy, z-d/2);
        vertex(pAx, pAy, z+d/2);
        vertex(pBx, pBy, z+d/2);
        vertex(pBx, pBy, z-d/2);
      }
      endShape(CLOSE);
    }
  }
}

void drawFrustum(float x, float y, float z, float r1, float r2, float d, float lados, color phil) {

  // implementar pelos alunos
  fill(phil);
  beginShape();
  for (int i = 0; i < lados; i++) {
    float px = x+r1*cos(TWO_PI/lados*i);
    float py = y+r1*sin(TWO_PI/lados*i);
    vertex(px, py, z-d/2);
  }
  endShape(CLOSE);

  beginShape();
  for (int i = 0; i < lados; i++) {
    float px = x+r2*cos(TWO_PI/lados*i);
    float py = y+r2*sin(TWO_PI/lados*i);
    vertex(px, py, z+d/2);
  }
  endShape(CLOSE);

  for (int i = 0; i < lados; i++) {
    beginShape(QUADS);

    float pAx = x+r1*cos(TWO_PI/lados*i);
    float pAy = y+r1*sin(TWO_PI/lados*i);
    float pBx = x+r1*cos(TWO_PI/lados*(i+1));
    float pBy = y+r1*sin(TWO_PI/lados*(i+1));

    vertex(pBx, pBy, z-d/2);
    vertex(pAx, pAy, z-d/2);
    pAx = x+r2*cos(TWO_PI/lados*i);
    pAy = y+r2*sin(TWO_PI/lados*i);
    pBx = x+r2*cos(TWO_PI/lados*(i+1));
    pBy = y+r2*sin(TWO_PI/lados*(i+1));
    vertex(pAx, pAy, z+d/2);
    vertex(pBx, pBy, z+d/2);

    endShape(CLOSE);
  }
}

void drawFrustum(float x1, float y1, float z1, float x2, float y2, float z2, float r1, float r2, float d, float lados, color phil) {

  // implementar pelos alunos
  fill(phil);
  beginShape();
  for (int i = 0; i < lados; i++) {
    float px = x1+r1*cos(TWO_PI/lados*i);
    float py = y1+r1*sin(TWO_PI/lados*i);
    vertex(px, py, z1-d/2);
  }
  endShape(CLOSE);

  beginShape();
  for (int i = 0; i < lados; i++) {
    float px = x2+r2*cos(TWO_PI/lados*i);
    float py = y2+r2*sin(TWO_PI/lados*i);
    vertex(px, py, z2+d/2);
  }
  endShape(CLOSE);

  for (int i = 0; i < lados; i++) {
    beginShape(QUADS);

    float pAx = x1+r1*cos(TWO_PI/lados*i);
    float pAy = y1+r1*sin(TWO_PI/lados*i);
    float pBx = x1+r1*cos(TWO_PI/lados*(i+1));
    float pBy = y1+r1*sin(TWO_PI/lados*(i+1));

    vertex(pBx, pBy, z1-d/2);
    vertex(pAx, pAy, z1-d/2);

    pAx = x2+r2*cos(TWO_PI/lados*i);
    pAy = y2+r2*sin(TWO_PI/lados*i);
    pBx = x2+r2*cos(TWO_PI/lados*(i+1));
    pBy = y2+r2*sin(TWO_PI/lados*(i+1));
    vertex(pAx, pAy, z2+d/2);
    vertex(pBx, pBy, z2+d/2);

    endShape(CLOSE);
  }
}
void drawCone(float x, float y, float z, float r, float apexX, float apexY,float apexZ, int lados) {
  beginShape();
  for (int i = 0; i < lados; i++) {
    float px = x+r*cos(TWO_PI/lados*i);
    float py = y+r*sin(TWO_PI/lados*i);
    vertex(px, py, z);
  }
  endShape(CLOSE);
  
  for (int i = 0; i < lados; i++) {
    beginShape();
    
    float px = x+r*cos(TWO_PI/lados*i);
    float py = y+r*sin(TWO_PI/lados*i);
    vertex(apexX, apexY, apexZ);
    vertex(px, py, z);
    px = x+r*cos(TWO_PI/lados*(i+1));
    py = y+r*sin(TWO_PI/lados*(i+1));
    vertex(px, py, z);
    endShape(CLOSE);
  }
}
