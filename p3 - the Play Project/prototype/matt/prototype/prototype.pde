// Game by MMM Studios

avatar player1;
key r1Upper;
key r1Lower;
key f1Upper;
key f1Lower;

void setup() {
  size(1024, 768);
  smooth();
  noFill();
  //noStroke();
  frameRate(60);

  player1 = new avatar();
  r1Upper = 'W';
  r1Lower = 'w';
  f1Upper = 'Q';
  f1Lower = 'q';

  player1.prep();
}

void draw() {
  background(255);

  player1.display();
  player1.update();
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
  }
}

