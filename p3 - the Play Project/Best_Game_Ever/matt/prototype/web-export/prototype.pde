// Game by MMM Studios

avatar player1;
key r1Upper;
key r1Lower;
key f1Upper;
key f1Lower;

avatar player2;
key r2Upper;
key r2Lower;
key f2Upper;
key f2Lower;

avatar player3;
key r3Upper;
key r3Lower;
key f3Upper;
key f3Lower;

avatar player4;
key r4Upper;
key r4Lower;
key f4Upper;
key f4Lower;

void setup() {
  size(1024, 768);
  smooth();
  noFill();
  //noStroke();
  frameRate(60);

  player1 = new avatar();
  r1Upper = 'W'; // player 1's key to rotate (uppercase).
  r1Lower = 'w'; // player 1's key to rotate (lowercase).
  f1Upper = 'Q'; // player 1's key to fire (uppercase).
  f1Lower = 'q'; // player 1's key to fire (lowercase).

  player2 = new avatar();
  r2Upper = 'P';
  r2Lower = 'p';
  f2Upper = 'O';
  f2Lower = 'o';

  player3 = new avatar();
  r3Upper = 'V';
  r3Lower = 'v';
  f3Upper = 'C';
  f3Lower = 'c';

  player4 = new avatar();
  r4Upper = 'M';
  r4Lower = 'm';
  f4Upper = 'N';
  f4Lower = 'n';

  player1.prep();
  player2.prep();
  player3.prep();
  player4.prep();
}

void draw() {
  background(255);

  player1.display();
  player2.display();
  player3.display();
  player4.display();

  player1.update();
  player2.update();
  player3.update();
  player4.update();
}

void keyPressed() {
  switch(key) {
  case r1Upper:
  case r1Lower:
    player1.rotate = true;
    break;
  case f1Upper:
  case f1Lower:
    player1.fire = true;
    break;

  case r2Upper:
  case r2Lower:
    player2.rotate = true;
    break;
  case f2Upper:
  case f2Lower:
    player2.fire = true;
    break;

  case r3Upper:
  case r3Lower:
    player3.rotate = true;
    break;
  case f3Upper:
  case f3Lower:
    player3.fire = true;
    break;

  case r4Upper:
  case r4Lower:
    player4.rotate = true;
    break;
  case f4Upper:
  case f4Lower:
    player4.fire = true;
    break;
  }
}

void keyReleased() {
  switch(key) {
  case r1Upper:
  case r1Lower:
    player1.rotate = false;
    break;
  case f1Upper:
  case f1Lower:
    player1.fire = false;
    break;

  case r2Upper:
  case r2Lower:
    player2.rotate = false;
    break;
  case f2Upper:
  case f2Lower:
    player2.fire = false;
    break;

  case r3Upper:
  case r3Lower:
    player3.rotate = false;
    break;
  case f3Upper:
  case f3Lower:
    player3.fire = false;
    break;

  case r4Upper:
  case r4Lower:
    player4.rotate = false;
    break;
  case f4Upper:
  case f4Lower:
    player4.fire = false;
    break;
  }
}

// This is the player-character class.

class avatar {

  float circX;
  float circY;
  int rad;
  int angle;
  boolean rotate;
  boolean fire;

  void prep() {
    circX = width/2;
    circY = height/2;
    rad = 50;
    angle = 0;
  }

  void display() {
    ellipseMode(RADIUS);
    ellipse(circX, circY, rad, rad);

    pushMatrix();
    translate(circX, circY); // Move the origin to the center of the ellipse.
    rectMode(CENTER);
    rect(sin(angle)*50, cos(angle)*50, 50, 50); // Draw the rect on the circum.
    popMatrix(); // Revert to the regular coordinate system.
  }

  void update() {
    
    // I commented this out because for some reason colliding with the
    // edge of the screen causes the game to freeze. We can present without
    // boundaries tomorrow and we can figure out the issues later. -m
    // Prevent the circle from moving offscreen:
    /*if (circX + rad > width) {
      circX + rad = width;
    }
    if (circX - rad < 0) {
      circX - rad = 0;
    }
    if (circY + rad > height) {
      circY + rad = height;
    }
    if (circY - rad < 0) {
      circY - rad = 0;
    }*/

    // The rectangle is drawn at a point on the ellipse's circumference based
    // on angle, so to rotate we change the angle:
    if (rotate == true) {
      angle += (1/30); // Change this to 1 for an interesting visual effect.
    }

    if (angle > 2*PI) { // If the angle gets bigger than a full circle...
      angle = 0; // ...reset it so it doesn't get too big.
    }

    if (fire == true) {
      // Fire to propel the avatar. We check the current angle to determine
      // which direction the avatar should move:
      if (angle <= PI/2) { // Lower-right of the circle.
        circY--;
        circX--;
      }
      else if (angle >= PI/2 && angle < PI) { // Upper-right of the circle.
        circY++;
        circX--;
      }
      else if (angle >= PI && angle < 3*PI/2) { // Upper-left of the circle.
        circY++;
        circX++;
      }
      else if (angle >= 3*PI/2 && angle < 2*PI) { // Lower-left of the circle.
        circY--;
        circX++;
      }
    }
  }
}


