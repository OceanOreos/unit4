void setup() {
  size(600, 600);
  background(255);

  house(150, 300); // Draw one big house at (150, 300)
}

void house(float x, float y) {
  pushMatrix();
  translate(x, y);

  // Bigger walls: 200x200
  rect(0, 0, 200, 200);

  // Bigger roof
  triangle(0, 0, 100, -100, 200, 0);

  // Bigger door
  rect(90, 120, 40, 80);

  popMatrix();
}
