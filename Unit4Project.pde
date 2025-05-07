void setup() {
  size(800, 600);
  drawBackground();
  drawCityscape();
  drawTrees();
  drawClouds();
  drawRoad();  
}

// BACKGROUND //
void drawBackground() {
  int skyTop = color(255, 100, 80);
  int midSky = color(255, 180, 100);
  int skyBottom = color(255, 220, 150);

  int y = 0;
  while (y < height) {
    if (y < height / 3) {
      stroke(skyTop);
    } else if (y < 2 * height / 3) {
      stroke(midSky);
    } else {
      stroke(skyBottom);
    }
    line(0, y, width, y);
    y = y + 1;
  }
}

// MAIN BUILDINGS
void drawCityscape() {
  int x = 0;
  while (x < width) {
    float h = random(200, 400);
    drawBuilding(x, height - h, 60, h);
    x = x + 80;
  }
}

void drawBuilding(float x, float y, float w, float h) {
  pushMatrix();
  translate(x, y);
  drawBuildingBody(w, h);
  drawWindows(w, h);
  popMatrix();
}

void drawBuildingBody(float w, float h) {
  fill(50, 50, 70);
  stroke(0);
  rect(0, 0, w, h);
}

void drawWindows(float w, float h) {
  fill(255, 230, 150);
  float x = 12;
  while (x + 8 < w) {
    float y = 18;
    while (y + 10 < h) {
      if (random(1) < 0.6) {
        rect(x, y, 8, 10);
      }
      y = y + 18;
    }
    x = x + 12;
  }
}

// TREES //
void drawTrees() {
  int x = 0;
  while (x < width) {
    drawTree(x, height - 20);
    x = x + 60;
  }
}

void drawTree(float x, float y) {
  pushMatrix();
  translate(x, y);
  scale(random(0.8, 1.2));
  drawTrunk();
  drawLeaves();
  popMatrix();
}

void drawTrunk() {
  fill(90, 60, 30);
  rect(-5, 0, 10, 20);
}

void drawLeaves() {
  fill(30, random(100, 200), 30, 220);
  int i = 0;
  while (i < 10) {
    float x = random(-15, 15);
    float y = random(-25, 0);
    ellipse(x, y, 15, 15);
    i = i + 1;
  }
}

// CLOUDS //
void drawClouds (){
  int count = 0;
  while (count < 10) {
    float x = random(width);
    float y = random(50, 200);
    drawCloud(x, y);
    count = count + 1;
  }
}

void drawCloud(float x, float y) {
  pushMatrix();
  translate(x, y);
  scale(random(0.8, 1.5));
  fill(255, 255, 255, 200);
  noStroke();

  int i = 0;
  while (i < 8) {
    float dx = random(-30, 30);
    float dy = random(-10, 10);
    ellipse(dx, dy, 30, 25);
    i = i + 1;
  }
  popMatrix();
}

// ROAD //
void drawRoad() {
  fill(60);
  noStroke();
  rect(0, height - 40, width, 40);

  fill(255, 220, 0);
  float dashX = 0;
  while (dashX < width) {
    rect(dashX, height - 22, 20, 4);
    dashX = dashX + 40;
  }
}
