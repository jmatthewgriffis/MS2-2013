// This is the player-character class.

class avatar {
  PVector circPos;
  int rad;
  float angle;
  float angleInc;
  boolean rotateCwise; // clockwise.
  boolean rotateCCwise; // counter-clockwise.
  boolean fire;
  color myColor;
  float health;
  int inc;
  float velocity;
  float storeBaseSpeed;
  boolean notAngled;
  float spdModifer;
  boolean addToSpd; 

  avatar(PVector _loc, color colorMe, float speed) {
    circPos= _loc;
    rad = 50;
    angle = 0;
    myColor = colorMe;
    angleInc = 1/15; // Controls the speed of rotation. Bigger means faster.
    health=100;
    inc = 15; // How much latitude to control direction of movement.
    notAngled = false;
    storeBaseSpeed = speed;
    velocity = storeBaseSpeed;
    spdModifer = 1;
  }

  void display() {
    noFill();
    stroke(myColor);
    ellipseMode(RADIUS);
    ellipse(circPos.x, circPos.y, rad, rad);

    pushMatrix();
    translate(circPos.x, circPos.y); // Move the origin to the center of the ellipse.
    rectMode(CENTER);
    rect(sin(angle)*50, cos(angle)*50, 50, 50); // Draw the rect on the circum.
    popMatrix(); // Revert to the regular coordinate system.
  }

  void update() {

    velocity = storeBaseSpeed * spdModifer;

    if (circPos.x + rad > width) {
      circPos.x = width - rad;
    }
    if (circPos.x - rad < 0) {
      circPos.x = 0 + rad;
    }
    if (circPos.y + rad > height) {
      circPos.y = height - rad;
    }
    if (circPos.y - rad < 0) {
      circPos.y = 0 + rad;
    }

    // The rectangle is drawn at a point on the ellipse's circumference based
    // on angle, so to rotate we change the angle:
    if (rotateCCwise == true) {
      angle += angleInc; // Change this to 1 for an interesting visual effect.
    }
    if (rotateCwise == true) {
      angle -= angleInc; // Change this to 1 for an interesting visual effect.
    }

    if (angle > 2*PI) { // If the angle gets bigger than a full circle...
      angle = 0; // ...reset it so it doesn't get too big.
    }
    if (angle < 0) { // If the angle gets negative...
      angle = 2*PI; // ...reset it to a full circle, which is the same.
    }

    if ((angle < (PI/inc) || angle > (PI*2)-(PI/inc)) || 
      (angle < PI+(PI/inc) && angle > PI-(PI/inc)) || 
      (angle < (PI/2+PI/inc) && angle > (PI/2-PI/inc)) || 
      (angle < (3*PI/2+PI/inc) && angle > (3*PI/2-PI/inc))) {
      notAngled = true;
    }
    else {
      notAngled = false;
    }

    if (addToSpd == true) {
      if (velocity <= 4 * storeBaseSpeed) {
        spdModifer += (0.25 * 1/60);
      }
    }

    else {
      spdModifer = 0.75;
    }

    if (fire == true) {

      addToSpd = true;

      // Fire to propel the avatar. We check the current angle to determine
      // which direction the avatar should move:
      // Move straight up:
      if (angle < (PI/inc) || angle > (PI*2)-(PI/inc)) {
        // Bottom of circle is zero, increases counter-clockwise.
        circPos.y -= velocity;
        //addToY--;
      }

      // Move straight down:
      if (angle < PI+(PI/inc) && angle > PI-(PI/inc)) {
        // Bottom of circle is zero, increases counter-clockwise.
        circPos.y += velocity;
        //addToY++;
      }

      // Move straight left:
      if (angle < (PI/2+PI/inc) && angle > (PI/2-PI/inc)) {
        // Bottom of circle is zero, increases counter-clockwise.
        circPos.x -= velocity;
        //addToX--;
      }

      // Move straight right:
      if (angle < (3*PI/2+PI/inc) && angle > (3*PI/2-PI/inc)) {
        // Bottom of circle is zero, increases counter-clockwise.
        circPos.x += velocity;
        //addToX++;
      }

      if (notAngled == false) {
        if (angle < PI/2) { // Lower-right of the circle.
          circPos.y -= velocity; 
          circPos.x -= velocity;
          //addToY--;
          //addToX--;
        }
        else if (angle >= PI/2 && angle < PI) { // Upper-right of the circle.
          circPos.y += velocity;
          circPos.x -= velocity;
          //addToY++;
          //addToX--;
        }
        else if (angle >= PI && angle < 3*PI/2) { // Upper-left of the circle.
          circPos.y += velocity;
          circPos.x += velocity;
          //addToY++;
          //addToX++;
        }
        else if (angle >= 3*PI/2 && angle < 2*PI) { // Lower-left of the circle.
          circPos.y -= velocity;
          circPos.x += velocity;
          //addToY--;
          //addToX++;
        }
      }
    }
    else {
      addToSpd = false;
    }

    if (health<1) {
      health=0;
      circPos.y=-300;
      circPos.x=-300;
    }
  }
}

