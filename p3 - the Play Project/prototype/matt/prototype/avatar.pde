// This is the player-character class.

class avatar {

  int angle;
  float circX;
  float circY;
  boolean rotate;
  boolean fire;
  int rotateKey;
  //string fireKey;

  // WASD controls:
  /*boolean up;
   boolean left;
   boolean down;
   boolean right;*/

  void prep() {
    circX = width/2;
    circY = height/2;
    angle = 0;
    //rotateKey = ;
    //fireKey = 'q';
  }

  void display() {
    ellipse(circX, circY, 100, 100);

    pushMatrix();
    translate(circX, circY); // Move the origin to the center of the ellipse.
    rectMode(CENTER);
    rect(sin(angle)*50, cos(angle)*50, 50, 50); // Draw the rect on the circum.
    popMatrix(); // Revert to the regular coordinate system.
  }

  void update() {


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

    // WASD controls:
    /*if (up == true) {
     circY--;
     }
     if (left == true) {
     circX--;
     }
     if (down == true) {
     circY++;
     }
     if (right == true) {
     circX++;
     }*/

    if (keyPressed) {
      if (key == 'q') {
        rotate = true;
      }
      if (key == 'w') {
        fire = true;
      }
      /*if (key == 'q' && key != 'w') {
        rotate = true;
        fire = false;
      }
      if (key != 'q' && key == 'w') {
        rotate = false;
        fire = true;
      }*/
      /*if (key == 'w') {
        fire = true;
      }*/
    }
    
    if (rotate == true) {
      if (keyPressed == false) {
        if (key == 'q') {
          rotate = false;
        }
        /*else {
          rotate = false;
        }*/
      }
    }
    
    if (fire == true) {
      if (keyPressed == false) {
        if (key == 'w') {
          fire = false;
        }
        /*else {
          rotate = false;
        }*/
      }
    }
    
    /*if (keyReleased) {
      if (key == 'q') {
        rotate = false;
      }
    }*/
    /*if (keyPressed == false) {
      rotate = false;
      fire = false;
    }*/

    /*if (keyPressed(key = 'g') == false) {
        rotate = false;
      }
      
      if (keyPressed(key = 'w') == false) {
        fire = false;
      }*/
      /*if (keyPressed == false && key == 'w') {
        fire = false;
      }*/

      // WASD controls:
      /*case 'w':
       up = true;
       break;
       case 'a':
       left = true;
       break;
       case 's':
       down = true;
       break;
       case 'd':
       right = true;
       break;*/
    }
  

  /*void keyReleased() {
   switch(key) {
   case 'q':
   player1.rotate = false;
   break;
   case 'w':
   player1.fire = false;
   break;*/

  // WASD controls:
  /*case 'w':
   up = false;
   break;
   case 'a':
   left = false;
   break;
   case 's':
   down = false;
   break;
   case 'd':
   right = false;
   break;*/
  //}
  //}
}

