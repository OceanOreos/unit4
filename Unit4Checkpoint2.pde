void setup() {
  size(600, 600);
  background(230); // light gray background

  int houseW = 60;
  int houseH = 60;
  int roofH = 30;
  int spacing = 30;

  drawNeighborhood(houseW, houseH, roofH, spacing);
}

void drawNeighborhood(int w, int h, int roofH, int spacing) {
  int startY = roofH + spacing;

  int y = startY;
  while (y + h <= height) {
    drawRowOfHouses(y, w, h, roofH, spacing);
    y += h + spacing;
  }
}

void drawRowOfHouses(int y, int w, int h, int roofH, int spacing) {
  int x = spacing;
  while (x + w <= width) {
    drawHouse(x, y, w, h, roofH);
    x += w + spacing;
  }
}

void drawHouse(int x, int y, int w, int h, int roofH) {
  color wall, roof, door, window;

  wall = color(random(255), random(255), random(255));
  roof = color(random(255), random(255), random(255));
  door = color(random(255), random(255), random(255));
  window = color(random(255), random(255), random(255));

  drawWalls(x, y, w, h, wall);
  drawRoof(x, y, w, roofH, roof);
  drawDoor(x, y, w, h, door);
  drawWindows(x, y, w, window);
}

void drawWalls(int x, int y, int w, int h, color c) {
  fill(c);
  stroke(0);
  rect(x, y, w, h);
}

void drawRoof(int x, int y, int w, int h, color c) {
  fill(c);
  stroke(0);
  triangle(x, y, x + w / 2, y - h, x + w, y);
}

void drawDoor(int x, int y, int w, int h, color c) {
  fill(c);
  stroke(0);
  rect(x + w / 2 - 8, y + h - 20, 16, 20);
}

void drawWindows(int x, int y, int w, color c) {
  fill(c);
  stroke(0);
  rect(x + 8, y + 15, 10, 10);
  rect(x + w - 18, y + 15, 10, 10);
}
