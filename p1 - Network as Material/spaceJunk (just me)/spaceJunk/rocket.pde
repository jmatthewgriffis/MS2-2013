// This tab coded by Matt.
// This tab contains:
// *Rocket UI elements (health bar)
// *Movement rules
// *Collision detection with effects on movement and health

class rocket {
  float xPos;
  float yPos;
  float length;
  float wide;
  int speed = 3;
  float xVel = 0;
  float yVel = 0;
  float slow = 0.9; // This controls how quickly the rocket stops moving if it is knocked by a collision.
  float knockbackSpeed = 20; // This is how much the rocket is knocked by a collision.
  int rotateTimer; // This limits how long the rocket stays rotated.
  int rotateTimerLimit = 30; // And here is the limit.
  int health = 200;
  int thatHurts = 10; // This is how much damage a collision does.
  boolean ouch; // This turns damage on and off.
  color healthBar = #989890; // gray
  color healthBarStroke = #FFFFFF; // white

  boolean allowMove; // This prevents movement for the cinematic effect.
  boolean right; // These booleans allow movement in various directions.
  boolean left;
  boolean up;
  boolean down;
  boolean fireRight; // These booleans tell the fire where and how to be drawn.
  boolean fireLeft;
  boolean fireUp;
  boolean fireDown;
  boolean rotateRight; // These booleans let the rocket rotate upon impact.
  boolean rotateLeft;

  rocket(float x, float y, float w, float l) {
    xPos = x;
    yPos = y;
    length = l;
    wide = w;
  }

  // In order to do collision detection, we need to compare the rocket's position with the position
  // and velocity of the satellites. But those change during play. So we have to feed the changing values
  // into the rocket's display function so it can update accordingly. We do this by creating slots for values
  // in the function here, then filling those slots with the needed information when we call the function
  // on the main tab.
  void displayRocket(float x, float y, float v, float x2, float y2, float v2) {
    // Draw the health bar:
    stroke(healthBarStroke);
    noFill();
    rect(5, 5, 202, 20);
    noStroke();
    fill(healthBar);
    rect(6, 6, health, 18);

    // Prevent the rocket from going offscreen:
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

    // Take damage:
    if (ouch == true) {
      health -= thatHurts;
      ouch = false; // Hopefully using the boolean prevents multiple damage calls when there should only be one.
    }

    // Collision detection with the test satellite:

    // See if they overlap:
    if (xPos+wide>x && xPos<x+test.wide && yPos<y+test.length && yPos+length>y) {

      // I put the following line in to prevent the rocket from taking damage before the player gets control.
      // I realized this was necessary when I was playtesting and lost the game before I could even do anything.
      if (allowMove == true) {

        // For some reason, the collision with the test satellite does 10 times normal damage.
        // I don't know why and don't have the time to figure it out right now (maybe it's
        // compounding the effect somehow?) but dividing by 10 achieves the desired effect:
        health -= (thatHurts/10);
      }

      // This next big chunk handles the complexities of collision. Depending on how the rocket hits the
      // satellite, it will bounce away and rotate differently:
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

    // Collision detection with the satellite array (see the comments above):

    for (int i=0; i<numSatellites; i++) {

      if (xPos+wide>x2 && xPos<x2+mySatellites[i].wide && yPos<y2+mySatellites[i].length && yPos+length>y2) {
        ouch = true;
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

    // Let's draw the actual rocket! Right now it's a rectangle. First we give it color:
    fill(255, 0, 0);

    // Rotate the rocket upon impact:

    if (rotateRight == true) {
      pushMatrix();
      translate(xPos+(wide/2), yPos+(length/2)); // Put the origin at the rocket's center to make rotation easier.
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
      rect(xPos, yPos, wide, length); // Here's where we draw the default, non-rotated rectangle.
    }
  }

  void updateRocket() {
    xPos += xVel;
    yPos += yVel;

    if (rotateTimer > 0) { // If the rocket is rotated, count down to rotating it back to normal.
      rotateTimer--;
    }

    if (rotateTimer <= 0) {
      rotateRight = false;
      rotateLeft = false;
    }

    // With the following lines, we check if there's any y and x velocity and if so reduce it (like friction):
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

    // Move the rocket and draw the fire appropriately:
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

