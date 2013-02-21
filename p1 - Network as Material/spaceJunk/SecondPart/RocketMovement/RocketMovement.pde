// Mini Asteroids
// by Trevor Shaffer
 
Rocket rocket = new Rocket(200, 200, 0);
boolean right, left, up, down, space;
int lastFrame;
 
void setup() {
  background(0);
  size(500, 500);

  right = false;
  left = false;
  up = false;
  down = false;
  space = false;

}
 
void draw() {
  background(0);
 
    if (right)
      rocket.rotateClockwise();
    if (left)
      rocket.rotateCounterclockwise();
    if (up)
      rocket.fireThrusters();
    if (down)
      rocket.backThrusters();
 
    rocket.update();
    rocket.drawMe();
}
 
//Controls
void keyPressed() {
  switch (keyCode) {
  case RIGHT:
    right = true;
    break;
  case LEFT:
    left = true;
    break;
  case UP:
    up = true;
    break;
  case DOWN:
    down = true;
    break;
  }
}
 
void keyReleased() {
  switch (keyCode) {
  case RIGHT:
    right = false;
    break;
  case LEFT:
    left = false;
    break;
  case UP:
    up = false;
    break;
  case DOWN:
    down = false;
    break;
  }
}

