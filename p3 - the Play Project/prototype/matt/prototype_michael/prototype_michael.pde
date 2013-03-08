// Game by MMM Studios

int stageID;
titleScreen titlescreen;

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

avatar player4;
key r4UpperA;
key r4LowerA;
key r4UpperB;
key r4LowerB;
key f4Upper;
key f4Lower;

enemy enemy1;



void setup() {
  size(1024, 768);
  stageID = 0;
  titlescreen = new titleScreen();

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
  r3UpperA = 'Z';
  r3LowerA = 'z';
  r3UpperB = 'C';
  r3LowerB = 'c';
  f3Upper = 'X';
  f3Lower = 'x';

  player4 = new avatar(new PVector(width-100, height-100), color(0, 0, 0));
  r4UpperA = 'M';
  r4LowerA = 'm';
  r4UpperB = '>';
  r4LowerB = '.';
  f4Upper = '<';
  f4Lower = ',';

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
}
void keyPressed() {
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

  case r4UpperA:
  case r4LowerA:
    player4.rotateCCwise = true;
    break;
  case r4UpperB:
  case r4LowerB:
    player4.rotateCwise = true;
    break;
  case f4Upper:
  case f4Lower:
    player4.fire = true;
    break;
  }
}

void keyReleased() {
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

  case r4UpperA:
  case r4LowerA:
    player4.rotateCCwise = false;
    break;
  case r4UpperB:
  case r4LowerB:
    player4.rotateCwise = false;
    break;
  case f4Upper:
  case f4Lower:
    player4.fire = false;
    break;
  }
}
