void setup() {
  size(600, 600);
  background(255);

  house(150, 300);
}

void house(float x, float y) {
  pushMatrix();
  translate(x, y);
  
  drawWalls();
  drawRoof();
  drawDoor();
  
  popMatrix();
}

void drawWalls() {
  rect(0, 0, 200, 200);
}

void drawRoof() {
  triangle(0, 0, 100, -100, 200, 0);
}

void drawDoor() {
  rect(90, 120, 40, 80);
}
