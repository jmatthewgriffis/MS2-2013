// Game by MMM Studios

avatar player1;

void setup() {
  size(1024, 768);
  smooth();
  noFill();
  //noStroke();
  frameRate(60);

  player1 = new avatar();

  player1.prep();
}

void draw() {
  background(255);

  player1.display();
  player1.update();
}

/*void keyPressed() {
  switch(key) {
  case 'q':
    player1.rotate = true;
    break;
  case 'w':
    player1.fire = true;
    break;*/

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
  //}
//}

/*void keyReleased() {
  switch(key) {
  case 'q':
    player1.rotate = false;
    break;
  case 'w':
    player1.fire = false;
    break;*/

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
  //}
//}

