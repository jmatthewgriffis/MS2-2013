// Game by MMM Studios

int stageID;
titleScreen titlescreen;

float masterSpeed;

avatar player1;
key r1UpperA;
key r1LowerA;
key r1UpperB;
key r1LowerB;
key f1Upper;
key f1Lower;

avatar player2;
key r2UpperA;
key r2LowerA;
key r2UpperB;
key r2LowerB;
key f2Upper;
key f2Lower;

avatar player3;
key r3UpperA;
key r3LowerA;
key r3UpperB;
key r3LowerB;
key f3Upper;
key f3Lower;

// There is some weirdness with certain buttons not registering simultaneous
// presses. It may have something to do with the keyboard design; I don't know.
// In any case, to get controls that work for everyone at the same time, I'm
// going to employ the arrow keys, which requires keyCode rather than key.
avatar player4;
keyCode r4UpperA;
//keyCode r4LowerA;
keyCode r4UpperB;
//keyCode r4LowerB;
keyCode f4Upper;
//keyCode f4Lower;

enemy enemy1;



void setup() {
  size(1024, 768);
  stageID = 1;
  masterSpeed = 3; // Give this an initial value. We'll update it in the Update.
  titlescreen = new titleScreen();

  player1 = new avatar(new PVector(0+100, 0+100), color(255, 0, 0), masterSpeed);
  r1UpperA = 'Q'; // player 1's key to rotate counter-clockwise (uppercase).
  r1LowerA = 'q'; // player 1's key to rotate counter-clockwise (lowercase).
  r1UpperB = 'E'; // player 1's key to rotate clockwise (uppercase).
  r1LowerB = 'e'; // player 1's key to rotate clockwise (lowercase).
  f1Upper = 'W'; // player 1's key to fire (uppercase).
  f1Lower = 'w'; // player 1's key to fire (lowercase).

  player2 = new avatar(new PVector(width-100, 0+100), color(0, 255, 0), masterSpeed);
  r2UpperA = 'J';
  r2LowerA = 'j';
  r2UpperB = 'L';
  r2LowerB = 'l';
  f2Upper = 'K';
  f2Lower = 'k';

  player3 = new avatar(new PVector(0+100, height-100), color(0, 0, 255), masterSpeed);
  r3UpperA = 'V';
  r3LowerA = 'v';
  r3UpperB = 'N';
  r3LowerB = 'n';
  f3Upper = 'B';
  f3Lower = 'b';

  player4 = new avatar(new PVector(width-100, height-100), color(0, 0, 0), masterSpeed);
  r4UpperA = LEFT;
  //r4LowerA = LEFT;
  r4UpperB = RIGHT;
  //r4LowerB = RIGHT;
  f4Upper = DOWN;
  //f4Lower = DOWN;

  enemy1 = new enemy(new PVector(400, 600), new PVector(2, 1), 100);
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
    player2.display();
    player3.display();
    player4.display();

    player1.update();
    player2.update();
    player3.update();
    player4.update();

    enemy1.update();
    break;
  case 2:
    //draw game over screen
    break;
  }
  
  //println(player1.notAngled);
  //println("addtox = " + player1.addToX + " addtoy = " + player1.addToY);
}
void keyPressed() {
  if (key == CODED) {
    switch(keyCode) {
    case r4UpperA:
      //case r4LowerA:
      player4.rotateCCwise = true;
      break;
    case r4UpperB:
      //case r4LowerB:
      player4.rotateCwise = true;
      break;
    case f4Upper:
      //case f4Lower:
      player4.fire = true;
      break;
    }
  }
  else {
    switch(key) {
    case r1UpperA:
    case r1LowerA:
      player1.rotateCCwise = true;
      break;
    case r1UpperB:
    case r1LowerB:
      player1.rotateCwise = true;
      break;
    case f1Upper:
    case f1Lower:
      player1.fire = true;
      break;

    case r2UpperA:
    case r2LowerA:
      player2.rotateCCwise = true;
      break;
    case r2UpperB:
    case r2LowerB:
      player2.rotateCwise = true;
      break;
    case f2Upper:
    case f2Lower:
      player2.fire = true;
      break;

    case r3UpperA:
    case r3LowerA:
      player3.rotateCCwise = true;
      break;
    case r3UpperB:
    case r3LowerB:
      player3.rotateCwise = true;
      break;
    case f3Upper:
    case f3Lower:
      player3.fire = true;
      break;
    }
  }
}

void keyReleased() {
  if (key == CODED) {
    switch(keyCode) {
    case r4UpperA:
      //case r4LowerA:
      player4.rotateCCwise = false;
      break;
    case r4UpperB:
      //case r4LowerB:
      player4.rotateCwise = false;
      break;
    case f4Upper:
      //case f4Lower:
      player4.fire = false;
      break;
    }
  }
  else {
    switch(key) {
    case r1UpperA:
    case r1LowerA:
      player1.rotateCCwise = false;
      break;
    case r1UpperB:
    case r1LowerB:
      player1.rotateCwise = false;
      break;
    case f1Upper:
    case f1Lower:
      player1.fire = false;
      break;

    case r2UpperA:
    case r2LowerA:
      player2.rotateCCwise = false;
      break;
    case r2UpperB:
    case r2LowerB:
      player2.rotateCwise = false;
      break;
    case f2Upper:
    case f2Lower:
      player2.fire = false;
      break;

    case r3UpperA:
    case r3LowerA:
      player3.rotateCCwise = false;
      break;
    case r3UpperB:
    case r3LowerB:
      player3.rotateCwise = false;
      break;
    case f3Upper:
    case f3Lower:
      player3.fire = false;
      break;
    }
  }
}

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
  int inc;
  float velocity;
  float storeBaseSpeed;
  boolean notAngled;
  float spdModifer;
  boolean addToSpd;
  //float addToY;
  //float addToX;
  //float reduceMomentum;

  avatar(PVector _loc, color colorMe, float speed) {
    circPos= _loc;
    rad = 50;
    angle = 0;
    myColor = colorMe;
    angleInc = 1/15; // Controls the speed of rotation. Bigger means faster.
    inc = 15; // How much latitude to control direction of movement.
    notAngled = false;
    storeBaseSpeed = speed;
    velocity = storeBaseSpeed;
    spdModifer = 1;
    //addToY = 0;
    //addToX = 0;
    //reduceMomentum = 0.7;
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
      //circPos.y += addToY/15;
      //circPos.x += addToX/15;

      /*if (addToY != 0) {
        addToY *= reduceMomentum;
      }

      if (addToY > -1 && addToY < 1) {
        addToY = 0;
      }

      if (addToX != 0) {
        addToX *= reduceMomentum;
      }

      if (addToX > -1 && addToX < 1) {
        addToX = 0;
      }*/
    }
  }
}

class enemy {
  PVector loc;
  PVector vel; 
  float size; 
  float d1, d2, d3, d4;

  enemy(PVector _loc, PVector _v, float _s) {
    loc= _loc;
    vel = _v;
    size = _s;
  }

  void update() {
    fill(155);
    ellipse(loc.x, loc.y, size, size); 

    //Find closest enemy. 
    d1 = loc.dist(player1.circPos);
    d2 = loc.dist(player2.circPos);
    d3 = loc.dist(player3.circPos);
    d4 = loc.dist(player4.circPos);

    if (d1 < d2 && d1 < d3 && d1<d4) {
      loc.x=lerp(loc.x, player1.circPos.x, 0.02);    
      loc.y=lerp(loc.y, player1.circPos.y, 0.02);
    }
    if (d2 < d1 && d2 < d3 && d2<d4) {
      loc.x=lerp(loc.x, player2.circPos.x, 0.02);    
      loc.y=lerp(loc.y, player2.circPos.y, 0.02);
    } 
    if (d3 < d1 && d3 < d2 && d3<d4) {
      loc.x=lerp(loc.x, player3.circPos.x, 0.02);    
      loc.y=lerp(loc.y, player3.circPos.y, 0.02);
    }
    if (d4 < d1 && d4 < d2 && d4<d3) {
      loc.x=lerp(loc.x, player4.circPos.x, 0.02);    
      loc.y=lerp(loc.y, player4.circPos.y, 0.02);
    }

    //bounce off walls
    if (loc.x>1024) vel.x=vel.x*-1;
    if (loc.x<0) vel.x=vel.x*-1;
    if (loc.y>768) vel.y=vel.y*-1;
    if (loc.y<0) vel.y=vel.y*-1;


    loc.add(vel);
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

