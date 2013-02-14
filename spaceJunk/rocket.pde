class rocket {
  float xPos;
  float yPos;
  float length;
  float wide;
  int speed = 3;
  float xVel = 0;
  float yVel = 0;
  float slow = 0.9;
  float knockbackSpeed = 20;
  int rotateTimer;
  int rotateTimerLimit = 30;

  boolean allowMove;
  boolean right;
  boolean left;
  boolean up;
  boolean down;
  boolean fireRight;
  boolean fireLeft;
  boolean fireUp;
  boolean fireDown;
  boolean rotateRight;
  boolean rotateLeft;

  rocket(float x, float y, float w, float l) {
    xPos = x;
    yPos = y;
    length = l;
    wide = w;
  }

  void displayRocket(float x, float y, float v, float x2, float y2, float v2) {

    if (yPos+length>height) {
      yPos=height-length;
    }
    if (yPos<0) {
      yPos=0;
    }
    if (xPos+wide>width) {
      xPos=width-wide;
    }
    if (xPos<0) {
      xPos=0;
    }

    // Collision detection with the test satellite:

    if (xPos+wide>x && xPos<x+test.wide && yPos<y+test.length && yPos+length>y) {
      if (yPos > y+(test.length-(test.length/3))) {
        yVel = knockbackSpeed/4;
        if (v>0) {
          rotateRight = true;
          rotateTimer = rotateTimerLimit;
        }
        if (v<0) {
          rotateLeft = true;
          rotateTimer = rotateTimerLimit;
        }
      }
      if (yPos+(length-(length/3)) < y+(test.length/3)) {
        yVel = -knockbackSpeed/4;
        if (v>0) {
          rotateLeft = true;
          rotateTimer = rotateTimerLimit;
        }
        if (v<0) {
          rotateRight = true;
          rotateTimer = rotateTimerLimit;
        }
      }
      if (v>0) {
        xVel = knockbackSpeed;
      }
      if (v<0) {
        xVel = -knockbackSpeed;
      }
    }

    // Collision detection with the satellite array:

    for (int i=0; i<numSatellites; i++) {

      if (xPos+wide>x2 && xPos<x2+mySatellites[i].wide && yPos<y2+mySatellites[i].length && yPos+length>y2) {
        if (yPos > y2+(mySatellites[i].length-(mySatellites[i].length/3))) {
          yVel = knockbackSpeed/4;
          if (v2>0) {
            rotateRight = true;
            rotateTimer = rotateTimerLimit;
          }
          if (v2<0) {
            rotateLeft = true;
            rotateTimer = rotateTimerLimit;
          }
        }
        if (yPos+(length-(length/3)) < y2+(mySatellites[i].length/3)) {
          yVel = -knockbackSpeed/4;
          if (v2>0) {
            rotateLeft = true;
            rotateTimer = rotateTimerLimit;
          }
          if (v2<0) {
            rotateRight = true;
            rotateTimer = rotateTimerLimit;
          }
        }
        if (v2>0) {
          xVel = knockbackSpeed;
        }
        if (v2<0) {
          xVel = -knockbackSpeed;
        }
      }
    }

    fill(255, 0, 0);

    // Rotate the rocket upon impact:

    if (rotateRight == true) {
      pushMatrix();
      translate(xPos+(wide/2), yPos+(length/2));
      rotate(10);
      rect(xPos-(xPos+(wide/2)), yPos-(yPos+(length/2)), wide, length);
      popMatrix();
    }

    else if (rotateLeft == true) {
      pushMatrix();
      translate(xPos+(wide/2), yPos+(length/2));
      rotate(-10);
      rect(xPos-(xPos+(wide/2)), yPos-(yPos+(length/2)), wide, length);
      popMatrix();
    }
    else {
      rect(xPos, yPos, wide, length);
    }
  }

  void updateRocket() {
    xPos += xVel;
    yPos += yVel;

    if (rotateTimer > 0) {
      rotateTimer--;
    }

    if (rotateTimer <= 0) {
      rotateRight = false;
      rotateLeft = false;
    }

    if (yVel != 0 ) {
      yVel *= slow;
    }

    if (xVel != 0) {
      xVel *= slow;
    }

    if (yVel <= 0.1 && yVel >= -0.1) {
      yVel = 0;
    }

    if (xVel <= 0.1 && xVel >= -0.1) {
      xVel = 0;
    }

    if (allowMove == true) {
      if (right == true) {
        if (xPos+wide<=width) {
          xPos+=speed;
          fireRight=true;
        }
      }
      if (left == true) {
        if (xPos>=0) {
          xPos-=speed;
          fireLeft=true;
        }
      }
      if (up == true) {
        if (yPos>=0) {
          yPos-=speed;
          fireUp=true;
        }
      }
      if (down == true) {
        if (yPos+length<=height) {
          yPos+=speed;
          fireDown=true;
        }
      }
    }
  }
}

