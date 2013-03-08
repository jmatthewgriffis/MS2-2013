int stageID;
titleScreen titlescreen;
avatar player1;


void setup() {
  size(1024, 768);
  stageID = 0;
  titlescreen = new titleScreen();

  player1 = new avatar();

  player1.prep();
}

void draw() {
  switch(stageID) {
  case 0:
    //draw title screen
    titlescreen.update();
    break;
  case 1:
    //draw gameplay
    background(255);
    player1.display();
    player1.update();
    break;
  case 2:
    //draw game over screen
    break;
  }
}


void keyReleased() {
  switch(key) {
  case 'q':
    player1.rotate = false;
    break;
  case 'w':
    player1.fire = false;
    break;

    // WASD controls:
  case 'w':
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
    break;
  }
}

void keyPressed() {
  switch(key) {
  case 'q':
    player1.rotate = true;
    break;
  case 'w':
    player1.fire = true;
    break;
  case 'k':
    if(player1.healthMeter>0)
    player1.healthMeter-=10;
    break;
    // WASD controls:
  case 'w':
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
    break;
  }
}

// This is the player-character class.

class avatar {

  int angle;
  float circX;
  float circY;
  boolean rotate;
  boolean fire;
  
  //
  int healthMeter;
  int playerNumber;

  // WASD controls:
  /*boolean up;
   boolean left;
   boolean down;
   boolean right;*/

  void prep() {
    circX = width/2;
    circY = height/2;
    angle = 0;
    healthMeter = 100;
    //
    playerNumber=1;
  }

  void display() {
    noFill();
    ellipse(circX, circY, 100, 100);

    pushMatrix();
    translate(circX, circY); // Move the origin to the center of the ellipse.
    rectMode(CENTER);
    rect(sin(angle)*50, cos(angle)*50, 50, 50); // Draw the rect on the circum.
    popMatrix(); // Revert to the regular coordinate system.
    
    //
    if(playerNumber == 1){
      fill(0);
      rectMode(CORNER);
      rect(25,25, healthMeter,20); 
    }
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
  }
}

class titleScreen {
  PImage screen;
  titleScreen() {
    screen = loadImage("titleScreen.png");
  }
  void update() {
    //display title screen image
    image(screen, 0, 0);
    //check to see if mouse is clicking the start button
    //the start button on the template is at x = 460, y = 520
    //the size of the button: width = 230 height = 75
    if (mousePressed) {
      if (mouseX>589 && mouseX<589+297 && mouseY>675 && mouseY<675+80) {
        //start button is pressed
        //change stage to the next one
        //reset any timer variable if necessary
        stageID = 1;
      }
    }
  }
}

