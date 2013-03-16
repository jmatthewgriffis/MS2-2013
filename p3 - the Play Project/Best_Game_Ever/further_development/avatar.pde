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
  PImage spaceShip;
  PImage propeller;
  PVector bulletVel;
  float bulletSpeed;

  avatar(PVector _loc, color colorMe, float speed, PImage _spaceShip) {
    circPos= _loc; // set the variable entered through the constructor equal to
    // an external variable so we can use it elsewhere.
    rad = 50; // size of avatar.
    angle = 0; // Position of engine rect.
    myColor = colorMe;
    angleInc = 1/15; // Controls the speed of rotation. Bigger means faster.
    health=100;
    inc = 15; // How much latitude to control direction of movement.
    notAngled = false; // Control whether moving diagonally or not.
    storeBaseSpeed = speed; // set the variable entered through the constructor equal to
    // an external variable so we can use it elsewhere.
    velocity = storeBaseSpeed; // We will use this extra variable to modify how quickly the
    // avatar moves without changing the original value of base speed so we can reuse it.
    spdModifer = 1; // This will modify speed over time when accelerating.
    spaceShip = _spaceShip;
    propeller = loadImage("propeller.png");
    bulletSpeed=4;
    bulletVel= new PVector(0, 0);
  }

  void display() {
    noFill();
    stroke(0);
    ellipseMode(RADIUS);
    ellipse(circPos.x, circPos.y, rad, rad);

    pushMatrix();
    translate(circPos.x, circPos.y); // Move the origin to the center of the ellipse.
    rectMode(CENTER);
    noStroke();
    imageMode(CENTER);
    rect(sin(angle)*50, cos(angle)*50, 50, 50); // Draw the rect on the circum.
    image(propeller, sin(angle)*50, cos(angle)*50);//propeller
    popMatrix(); // Revert to the regular coordinate system.
    image(spaceShip, circPos.x, circPos.y);//Draws the Spaceship
    imageMode(CORNER);
  }

  void update() {

    velocity = storeBaseSpeed * spdModifer; // We use this to strictly control
    // how fast the avatar moves. It goes faster with acceleration but reverts
    // to the starting speed when the player lets off the gas. storeBaseSpeed
    // stays the same; spdModifier changes, and with it, the velocity.

    // Prevent the avatars from moving offscreen:
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
      angle += angleInc; // Change the angleInc to 1 for an interesting visual effect.
    }
    if (rotateCwise == true) {
      angle -= angleInc;
    }

    if (angle > 2*PI) { // If the angle gets bigger than a full circle...
      angle = 0; // ...reset it so it doesn't get too big.
    }
    if (angle < 0) { // If the angle gets negative...
      angle = 2*PI; // ...reset it to a full circle, which is the same as zero.
    }

    // This ugly thing just says check if the engine is positioned for movement
    // in one of the four cardinal directions.
    if ((angle < (PI/inc) || angle > (PI*2)-(PI/inc)) || 
      (angle < PI+(PI/inc) && angle > PI-(PI/inc)) || 
      (angle < (PI/2+PI/inc) && angle > (PI/2-PI/inc)) || 
      (angle < (3*PI/2+PI/inc) && angle > (3*PI/2-PI/inc))) {
      notAngled = true; // In that case we don't have angled movement.
    }
    else {
      notAngled = false; // Otherwise we do!
    }

    if (addToSpd == true) {
      if (velocity <= 4 * storeBaseSpeed) {
        spdModifer += (0.25 * 1/60); // Here we change the velocity if accelerating.
      }
    }

    else {
      spdModifer = 0.75; // And here we reset it when not accelerating.
    }

    if (fire == true) {

      addToSpd = true; // Fire is the same as accelerate, so we should pick up speed.

      // Fire to propel the avatar. We check the current angle to determine
      // which direction the avatar should move:

      // Move straight up:
      if (angle < (PI/inc) || angle > (PI*2)-(PI/inc)) {
        // Bottom of circle is zero, increases counter-clockwise.
        circPos.y -= velocity;
        bulletVel.y=-bulletSpeed;
        bulletVel.x=0;
        //addToY--;
      }

      // Move straight down:
      if (angle < PI+(PI/inc) && angle > PI-(PI/inc)) {
        // Bottom of circle is zero, increases counter-clockwise.
        circPos.y += velocity;
        bulletVel.y=bulletSpeed;
        bulletVel.x=0;
        //addToY++;
      }

      // Move straight left:
      if (angle < (PI/2+PI/inc) && angle > (PI/2-PI/inc)) {
        // Bottom of circle is zero, increases counter-clockwise.
        circPos.x -= velocity;
        bulletVel.y=0;
        bulletVel.x=-bulletSpeed;
        //addToX--;
      }

      // Move straight right:
      if (angle < (3*PI/2+PI/inc) && angle > (3*PI/2-PI/inc)) {
        // Bottom of circle is zero, increases counter-clockwise.
        circPos.x += velocity;
        bulletVel.y=0;
        bulletVel.x=bulletSpeed;
        //addToX++;
      }

      if (notAngled == false) {
        if (angle < PI/2) { // Lower-right of the circle.
          circPos.y -= velocity; 
          circPos.x -= velocity;
          bulletVel.y=-bulletSpeed;
          bulletVel.x=-bulletSpeed;
          //addToY--;
          //addToX--;
        }
        else if (angle >= PI/2 && angle < PI) { // Upper-right of the circle.
          circPos.y += velocity;
          circPos.x -= velocity;
          bulletVel.y= bulletSpeed;
          bulletVel.x= -bulletSpeed;
          //addToY++;
          //addToX--;
        }
        else if (angle >= PI && angle < 3*PI/2) { // Upper-left of the circle.
          circPos.y += velocity;
          circPos.x += velocity;
          bulletVel.y= bulletSpeed;
          bulletVel.x= bulletSpeed;
          //addToY++;
          //addToX++;
        }
        else if (angle >= 3*PI/2 && angle < 2*PI) { // Lower-left of the circle.
          circPos.y -= velocity;
          circPos.x += velocity;
          bulletVel.y= -bulletSpeed;
          bulletVel.x= bulletSpeed;
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
      circPos.y=-3000;
      circPos.x=-3000;
    }
  }
}

