// Game by MMM Studios

int stageID;
titleScreen titlescreen;
PImage overScreen;
PImage mapScreen;
PImage winScreen;


avatar player1;
key r1UpperA;
key r1LowerA;
key r1UpperB;
key r1LowerB;
key f1Upper;
key f1Lower;
int shotCount1;

avatar player2;
key r2UpperA;
key r2LowerA;
key r2UpperB;
key r2LowerB;
key f2Upper;
key f2Lower;
int shotCount2;


avatar player3;
key r3UpperA;
key r3LowerA;
key r3UpperB;
key r3LowerB;
key f3Upper;
key f3Lower;
int shotCount3;


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
int shotCount4;


float shotTimer;

//reset 
key reset;

enemy enemy1;

boolean attack;
float attackCounter;

ArrayList<bullet> bullets;

void setup() {
  size(1024, 768);
  stageID = 1;
  titlescreen = new titleScreen();
  overScreen = loadImage("gameOver.png");
  mapScreen = loadImage("background.png");
  winScreen = loadImage("win.png");


  bullets = new ArrayList();

  shotTimer=0;

  player1 = new avatar(new PVector(0+100, 0+100), color(255, 0, 0));
  r1UpperA = 'Q'; // player 1's key to rotate counter-clockwise (uppercase).
  r1LowerA = 'q'; // player 1's key to rotate counter-clockwise (lowercase).
  r1UpperB = 'E'; // player 1's key to rotate clockwise (uppercase).
  r1LowerB = 'e'; // player 1's key to rotate clockwise (lowercase).
  f1Upper = 'W'; // player 1's key to fire (uppercase).
  f1Lower = 'w'; // player 1's key to fire (lowercase).
  shotCount1 = 0;

  player2 = new avatar(new PVector(width-100, 0+100), color(0, 255, 0));
  r2UpperA = 'I';
  r2LowerA = 'i';
  r2UpperB = 'P';
  r2LowerB = 'p';
  f2Upper = 'O';
  f2Lower = 'o';
  shotCount2 = 0;


  player3 = new avatar(new PVector(0+100, height-100), color(0, 0, 255));
  r3UpperA = 'V';
  r3LowerA = 'v';
  r3UpperB = 'N';
  r3LowerB = 'n';
  f3Upper = 'B';
  f3Lower = 'b';
  shotCount3 = 0;


  player4 = new avatar(new PVector(width-100, height-100), color(255, 255, 255));
  r4UpperA = LEFT;
  //r4LowerA = LEFT;
  r4UpperB = RIGHT;
  //r4LowerB = RIGHT;
  f4Upper = DOWN;
  //f4Lower = DOWN;
  shotCount4 = 0;


  reset = 'r';

  enemy1 = new enemy(new PVector(400, 600), new PVector(2, 1), 100);
}

void draw() {
  //  println(bullets.size());//just to make sure that the bullets offscreen are removed.
  //  println(shotCount1);
  switch(stageID) {
  case 0:
    //draw title screen
    titlescreen.update();
    break;
  case 1:
    //draw gameplay
    background(255);
    shotTimer++;
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
    fill(255, 255, 255);
    rect(width-120, height-15, player4.health, 5);
    //draw enemy health rectangle
    fill(100);
    rect(164, 10, enemy1.health, 15);

    //draw bullets

    if (bullets.isEmpty()==false) {   //
      for (int i=0; i<bullets.size(); i++) {  //check size of array list and run through every element 
        bullet temp = bullets.get(i); //how we retrieve data inside of an array list.
        temp.update();  //display bullets
      }
    }

    //add bullets
    //player 1
    if (shotCount1==2) {
      bullet temp = new bullet(player1.circPos.x, player1.circPos.y, 2, 0); 
      bullets.add(temp);  //adds new bullet to araylist
      shotCount1=0;
    }
    //player 2
    if (shotCount2==2) {
      bullet temp = new bullet(player2.circPos.x, player2.circPos.y, 2, 0); 
      bullets.add(temp);  //adds new bullet to araylist
      shotCount2=0;
    }    
    //player 3
    if (shotCount3==2) {
      bullet temp = new bullet(player3.circPos.x, player3.circPos.y, 2, 0); 
      bullets.add(temp);  //adds new bullet to araylist
      shotCount3=0;
    }    
    //player 4
    if (shotCount4==2) {
      bullet temp = new bullet(player4.circPos.x, player4.circPos.y, 2, 0); 
      bullets.add(temp);  //adds new bullet to araylist
      shotCount4=0;
    }

    if (shotTimer>50) {  //makes it so you have to quickly tap thrust to fire bullet
      shotCount1=0;
      shotCount2=0;
      shotCount3=0;
      shotCount4=0;

      shotTimer=0;
    }


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
  case 3:
    //draw win screen
    image(winScreen, 0, 0);
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
  /*
  if (key == 'l') {
   shot = true;
   bullet temp = new bullet(player1.circPos.x, player1.circPos.y, 2, 0); 
   bullets.add(temp);  //adds new bullet to araylist
   }
   
   if (key == ']') {
   shot = true;
   bullet temp = new bullet(player2.circPos.x, player2.circPos.y, 2, 0); 
   bullets.add(temp);  //adds new bullet to araylist
   }
   */
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
      shotCount4++;
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
      shotCount1++;
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
      shotCount2++;
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
      shotCount3++;
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

  avatar(PVector _loc, color colorMe) {
    circPos= _loc;
    rad = 50;
    angle = 0;
    myColor = colorMe;
    angleInc = 1/30;
    health=100;
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

//this was added during class
class bullet {
  PVector pos;
  PVector vel;

  bullet(float _x, float _y, float _xsp, float _ysp) {
    pos = new PVector(_x, _y);
    vel = new PVector(_xsp, _ysp);
  }

  void update() {
    pos.add(vel);

    //resource management (referenced in note at bottom of main class)
    if (pos.x < 0 || pos.x>width || pos.y<0 || pos.y>height) {
      bullets.remove(this); //take this particular instance out of array list if the bullet goes off screen.
    }

    //collision detection 
    if (pos.dist(enemy1.loc)<enemy1.size) {
      bullets.remove(this); //remove bullet so it doesn't go though the object it kills
      enemy1.health=enemy1.health-100;
    }



    pushMatrix();
    translate(pos.x, pos.y);   //sets the center of the spaceship at zero zero so bullets at zero zero will come out of spaceship
    //    rotate(atan2(vel.y,vel.x)); //paramater y, x. This is to rotate the bullet based on the angle. 
    fill(255);
    rect(0, 0, 5, 2);
    fill(255, 0, 0);
    rect(-2, 0, 2, 2);
    popMatrix();
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

    if (attack) {
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
    if (health<1) {
      health=0;
      stageID=3;
    }
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


