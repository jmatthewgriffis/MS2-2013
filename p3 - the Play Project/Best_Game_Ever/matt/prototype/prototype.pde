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

