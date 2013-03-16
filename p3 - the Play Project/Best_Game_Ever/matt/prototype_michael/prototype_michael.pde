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

