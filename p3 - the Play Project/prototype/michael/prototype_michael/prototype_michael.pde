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

ArrayList<bullet> bullets;

void setup() {
  size(1024, 768);
  stageID = 1;
  titlescreen = new titleScreen();
  overScreen = loadImage("gameOver.png");
  mapScreen = loadImage("background.png");

  bullets = new ArrayList();


  player1 = new avatar(new PVector(0+100, 0+100), color(255, 0, 0));
  r1UpperA = 'Q'; // player 1's key to rotate counter-clockwise (uppercase).
  r1LowerA = 'q'; // player 1's key to rotate counter-clockwise (lowercase).
  r1UpperB = 'E'; // player 1's key to rotate clockwise (uppercase).
  r1LowerB = 'e'; // player 1's key to rotate clockwise (lowercase).
  f1Upper = 'W'; // player 1's key to fire (uppercase).
  f1Lower = 'w'; // player 1's key to fire (lowercase).

  player2 = new avatar(new PVector(width-100, 0+100), color(0, 255, 0));
  r2UpperA = 'I';
  r2LowerA = 'i';
  r2UpperB = 'P';
  r2LowerB = 'p';
  f2Upper = 'O';
  f2Lower = 'o';

  player3 = new avatar(new PVector(0+100, height-100), color(0, 0, 255));
  r3UpperA = 'V';
  r3LowerA = 'v';
  r3UpperB = 'N';
  r3LowerB = 'n';
  f3Upper = 'B';
  f3Lower = 'b';

  player4 = new avatar(new PVector(width-100, height-100), color(0, 0, 0));
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
  println(bullets.size());//just to make sure that the bullets offscreen are removed.

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

    //draw bullets

    if (bullets.isEmpty()==false) {   //
      for (int i=0; i<bullets.size(); i++) {  //check size of array list and run through every element 
        bullet temp = bullets.get(i); //how we retrieve data inside of an array list.
        temp.update();  //display bullets
      }
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
  
   if (key == 'l') {
//    if (shot==false) {   //to stop it from firing automatically while holding space bar. 
      shot = true;
      bullet temp = new bullet(player1.circPos.x, player1.circPos.y, 5*cos(PI/4), 5*sin(PI/4)); //creates new bullet. This version changes the velocity of the bullet to be diagonal (going up)
      bullets.add(temp);  //adds new bullet to araylist

/*
      //Version 2 makes two bullets shoot out with diagonal movement...this adds the second bullet with a diagonal velocity
      bullet temp2 = new bullet(hero.loc.x, hero.loc.y, 5*cos(-PI/4), 5*sin(-PI/4)); //creates new bullet  
      bullets.add(temp2);  //adds new bullet to araylist

      //third straight bullet
      bullet temp3 = new bullet(hero.loc.x, hero.loc.y, 5, 0); //creates new bullet  
      bullets.add(temp3);  //adds new bullet to araylist*/

      //resource management problem... Array list grows a lot. Multiplies by three every time space is pressed.
      // Once bullet goes off the screen it should delete itself
//    }
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

