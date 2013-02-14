class satellite {
  float xPos;
  float yPos;
  float length;
  float wide;
  float xVel;
  int yVel;
  int delayEntrance=1100;
  int delayArrayEntrance = 460;
  int xPosOffset = 240;
  boolean warpPosition;
  float die;

  satellite(float x, float y, float w, float l, float v) {
    xPos = x;
    yPos = y;
    length = l;
    wide = w;
    xVel = v;
  }

  void displaySatellite() {
    fill(0, 255, 0);
    rect(xPos, yPos, wide, length);
  }

  void updateSatellite() {
    yVel = cloud1.speed;
    yPos += yVel;
    xPos += xVel;

    if (xPos<width && xPos>0) {
      if (warpPosition == true) {
        warpPosition = false;
      }
    }

    if (xPos>width || xPos<0) {
      if (warpPosition == false) {
        yPos = random(height);

        die = random(-1, 1);
        if (die <= 0) {
          xPos = -xPosOffset;
          xVel = random(1, 4);
        }
        else if (die > 0) {
          xPos = width + xPosOffset;
          xVel = random(-4, -1);
        }

        warpPosition = true;
      }
    }

    // No bouncing satellite anymore:
    //    if (xPos+wide > width || xPos <= 0) {
    //      xVel*=-1;
    //    }
  }
}

