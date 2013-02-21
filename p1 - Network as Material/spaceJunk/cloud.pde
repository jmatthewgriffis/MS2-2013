// This tab coded by Matt (and possibly modified by Owen and/or Michael).

class cloud {
  float xPos;
  float yPos;
  float rad;
  int speed;
  int whichCloud;
  PImage cloud;

  cloud(float x, float y, float r, int s, int _whichCloud) {
    xPos = x;
    yPos = y;
    rad = r;
    speed = s;
    whichCloud = _whichCloud;
    cloud = loadImage("cloud" + str(whichCloud) + ".png");
    
  }

  void displayCloud() {
    fill(255);
    noStroke();
    image(cloud,xPos, yPos);
  }

  void updateCloud() {
    yPos += speed; // Scroll the clouds downward to simulate the sensation of flying upward.

    // If the cloud goes off the bottom of the screen, replace it above the screen at a random place and size:
    if (yPos > height + 50) {
      yPos = -100;
      xPos = random(width);
      rad = random(40, 200);
    }
  }
}

