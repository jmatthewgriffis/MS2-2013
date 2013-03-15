// Game by MMM Studios

int stageID;
titleScreen titlescreen;
PImage overScreen;
PImage mapScreen;

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

//reset 
key reset;

enemy enemy1;

boolean attack;
float attackCounter;


void setup() {
  size(1024, 768);
  stageID = 1;
  titlescreen = new titleScreen();
  overScreen = loadImage("gameOver.png");
  mapScreen = loadImage("background.png");


  player1 = new avatar(new PVector(0+100, 0+100), color(255, 0, 0), loadImage("avatar1.png"));
  r1UpperA = 'Q'; // player 1's key to rotate counter-clockwise (uppercase).
  r1LowerA = 'q'; // player 1's key to rotate counter-clockwise (lowercase).
  r1UpperB = 'E'; // player 1's key to rotate clockwise (uppercase).
  r1LowerB = 'e'; // player 1's key to rotate clockwise (lowercase).
  f1Upper = 'W'; // player 1's key to fire (uppercase).
  f1Lower = 'w'; // player 1's key to fire (lowercase).

  player2 = new avatar(new PVector(width-100, 0+100), color(0, 255, 0), loadImage("avatar2.png"));
  r2UpperA = 'I';
  r2LowerA = 'i';
  r2UpperB = 'P';
  r2LowerB = 'p';
  f2Upper = 'O';
  f2Lower = 'o';

  player3 = new avatar(new PVector(0+100, height-100), color(0, 0, 255), loadImage("avatar1.png"));
  r3UpperA = 'V';
  r3LowerA = 'v';
  r3UpperB = 'N';
  r3LowerB = 'n';
  f3Upper = 'B';
  f3Lower = 'b';

  player4 = new avatar(new PVector(width-100, height-100), color(0, 0, 0), loadImage("avatar1.png"));
  r4UpperA = LEFT;
  //r4LowerA = LEFT;
  r4UpperB = RIGHT;
  //r4LowerB = RIGHT;
  f4Upper = DOWN;
  //f4Lower = DOWN;

  reset = 'r';

  enemy1 = new enemy(new PVector(400, 600), new PVector(2, 1), 100);
}

void draw() {
  println(stageID);

  switch(stageID) {
  case 0:
    //draw title screen
    titlescreen.update();
    break;
  case 1:
    //draw gameplay
    background(255);
    image(mapScreen, 0, 0);

    if (player1.health>0) player1.display();
    if (player2.health>0) player2.display();
    if (player3.health>0) player3.display();
    if (player4.health>0) player4.display();

    player1.update();
    player2.update();
    player3.update();
    player4.update();

    enemy1.update();
    attackCounter++;
    if (attackCounter>300 && attackCounter<500) {
      attack=true;
    }
    else {
      attack=false;
    }
    if (attackCounter>1000) {
      attackCounter=0;
    }
    //    println(attackCounter);
    //    println(attack);

    //draw health rectangles
    rectMode(CORNER);
    fill(255, 0, 0);
    rect(20, 20, player1.health, 5);
    fill(0, 255, 0);
    rect(width-120, 20, player2.health, 5);
    fill(0, 0, 255);
    rect(20, height-15, player3.health, 5);
    fill(0, 0, 0);
    rect(width-120, height-15, player4.health, 5);
    //draw enemy health rectangle
    fill(100);
    rectMode(CENTER);
    rect(width/2, 10, enemy1.health, 10);
    rectMode(CORNER);

    // collision of avatars

    if (player1.circPos.dist(player2.circPos) < (player1.rad*2)) {
      player1.health=player1.health-0.25;
      player2.health=player2.health-0.25;
    }
    if (player1.circPos.dist(player3.circPos) < (player1.rad*2)) {
      player1.health=player1.health-0.25;
      player3.health=player3.health-0.25;
    }
    if (player1.circPos.dist(player4.circPos) < (player1.rad*2)) {
      player1.health=player1.health-0.25;
      player4.health=player4.health-0.25;
    }
    if (player2.circPos.dist(player3.circPos) < (player1.rad*2)) {
      player2.health=player2.health-0.25;
      player3.health=player3.health-0.25;
    }
    if (player2.circPos.dist(player4.circPos) < (player1.rad*2)) {
      player2.health=player2.health-0.25;
      player4.health=player4.health-0.25;
    }
    if (player3.circPos.dist(player4.circPos) < (player1.rad*2)) {
      player3.health=player3.health-0.25;
      player4.health=player4.health-0.25;
    }

    //collision of enemy with avatar 

    if (enemy1.loc.dist(player1.circPos) < (player1.rad+enemy1.size)) {
      player1.health=player1.health-0.25;
    }
    if (enemy1.loc.dist(player2.circPos) < (player1.rad+enemy1.size)) {
      player2.health=player2.health-0.25;
    }    
    if (enemy1.loc.dist(player3.circPos) < (player1.rad+enemy1.size)) {
      player3.health=player3.health-0.25;
    }    
    if (enemy1.loc.dist(player4.circPos) < (player1.rad+enemy1.size)) {
      player4.health=player4.health-0.25;
    }    

    //Damage to Enemy 

    //Game over
    if (player1.health<1 && player2.health<1 && player3.health<1 && player4.health<1) stageID=2;
    break;
  case 2:
    //draw game over screen
    image(overScreen, 0, 0);
    break;
  }
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

    case reset:
      setup();
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
  float health;
  PImage spaceShip;
  PImage propeller;

  avatar(PVector _loc, color colorMe, PImage _spaceShip) {
    circPos= _loc;
    rad = 50;
    angle = 0;
    myColor = colorMe;
    angleInc = 1/30;
    health=100;
   spaceShip = _spaceShip;
   propeller = loadImage("propeller.png");
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
    image(propeller,sin(angle)*50, cos(angle)*50);
    popMatrix(); // Revert to the regular coordinate system.    
    image(spaceShip, circPos.x, circPos.y);//Draws the Spaceship
    imageMode(CORNER);
  }

  void update() {

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

    if (fire == true) {
      // Fire to propel the avatar. We check the current angle to determine
      // which direction the avatar should move:
      if (angle <= PI/2) { // Lower-right of the circle.
        circPos.y--; 
        circPos.x--;
      }
      else if (angle >= PI/2 && angle < PI) { // Upper-right of the circle.
        circPos.y++;
        circPos.x--;
      }
      else if (angle >= PI && angle < 3*PI/2) { // Upper-left of the circle.
        circPos.y++;
        circPos.x++;
      }
      else if (angle >= 3*PI/2 && angle < 2*PI) { // Lower-left of the circle.
        circPos.y--;
        circPos.x++;
      }
    }

    if (health<1) {
      health=0;
      circPos.y=-300;
      circPos.x=-300;
    }
  }
}

class enemy {
  PVector loc;
  PVector vel; 
  float size; 
  float d1, d2, d3, d4;
  float health;

  enemy(PVector _loc, PVector _v, float _s) {
    loc= _loc;
    vel = _v;
    size = _s;
    health=700;
  }

  void update() {
    fill(155);
    noStroke();
    ellipse(loc.x, loc.y, size, size); 

    //Find closest enemy. 
    d1 = loc.dist(player1.circPos);
    d2 = loc.dist(player2.circPos);
    d3 = loc.dist(player3.circPos);
    d4 = loc.dist(player4.circPos);

if(attack){
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


