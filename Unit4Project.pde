void setup() {
  size(800, 600);
  drawBackground();

  drawCityscape();
  drawTrees();
  drawClouds();
}

/////////////////////////////////////////
// BACKGROUND: SUNSET GRADIENT
/////////////////////////////////////////
void drawBackground() {
  int skyTop = color(255, 100, 80);    // reddish top
  int midSky = color(255, 180, 100);   // orange middle
  int skyBottom = color(255, 220, 150); // yellow bottom

  for (int y = 0; y < height; y++) {
    if (y < height / 3) {
      stroke(skyTop);
    } else if (y < 2 * height / 3) {
      stroke(midSky);
    } else {
      stroke(skyBottom);
    }
    line(0, y, width, y);
  }
}

/////////////////////////////////////////
// BUILDINGS
/////////////////////////////////////////
void drawCityscape() {
  for (int i = 0; i < width; i += 80) {
    float x = i + random(-10, 10);
    float h = random(200, 400);
    drawBuilding(x, height - h, 60, h);
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
  int cols = int(w / 15);
  int rows = int(h / 20);
  for (int i = 1; i < cols; i++) {
    for (int j = 1; j < rows; j++) {
      if (random(1) < 0.6) {
        rect(i * 12, j * 18, 8, 10);
      }
    }
  }
}

////////////
// TREES
////////////
void drawTrees() {
  for (int i = 0; i < width; i += 60) {
    float x = i + random(-10, 10);
    float y = height - 20;
    drawTree(x, y);
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
  for (int i = 0; i < 10; i++) {
    float angle = random(TWO_PI);
    float r = random(10, 25);
    ellipse(cos(angle) * r, sin(angle) * r - 10, 15, 15);
  }
}

/////////////////////////////////////////
// CLOUDS
/////////////////////////////////////////
void drawClouds() {
  for (int i = 0; i < 10; i++) {
    float x = random(width);
    float y = random(50, 200);
    drawCloud(x, y);
  }
}

void drawCloud(float x, float y) {
  pushMatrix();
  translate(x, y);
  scale(random(0.8, 1.5));
  fill(255, 255, 255, 200);
  noStroke();
  for (int i = 0; i < 8; i++) {
    ellipse(random(-30, 30), random(-10, 10), 30, 25);
  }
  popMatrix();
}
