class cloud {
  float xPos;
  float yPos;
  float rad;
  int speed;

  cloud(float x, float y, float r, int s) {
    xPos = x;
    yPos = y;
    rad = r;
    speed = s;
  }

  void displayCloud() {
    fill(255);
    noStroke();
    ellipse(xPos, yPos, rad, rad/2);
  }

  void updateCloud() {
    yPos += speed;

    if (yPos > height + 50) {
      yPos = -50;
      xPos = random(width);
      rad = random(40, 200);
    }
  }
}

