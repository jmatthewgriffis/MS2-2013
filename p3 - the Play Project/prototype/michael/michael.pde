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

