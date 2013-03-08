int angle;
float circX;
float circY;
boolean rotate;
boolean up;
boolean left;
boolean down;
boolean right;

void setup() {
  size(1024,768);
  smooth();
  noFill();
  //noStroke();
  frameRate(60);
  
  circX = width/2;
  circY = height/2;
  angle = 0;
}

void draw() {
  background(255);
  ellipse(circX, circY, 100, 100);
  pushMatrix();
  
  update();
  
  translate(circX, circY);
  rectMode(CENTER);
  rect(sin(angle)*50, cos(angle)*50, 50, 50);
  popMatrix();
}

void update() {
  if (rotate == true) {
    angle++;
  }
  
  if (angle > 360) {
    angle = 0;
  }
  
  if (up == true) {
    circY--;
  }
  if (left == true) {
    circX--;
  }
  if (down == true) {
    circY++;
  }
  if (right == true) {
    circX++;
  }
}

void keyPressed() {
  switch(key) {
  case ' ':
    rotate = true;
    break;
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

void keyReleased() {
  switch(key) {
  case ' ':
    rotate = false;
    break;
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

