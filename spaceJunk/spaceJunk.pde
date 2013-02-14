cloud cloud1;
cloud cloud2;
cloud cloud3;
rocket rocket;
fire myFire;
satellite test;
int numSatellites = 10;
satellite[] mySatellites = new satellite[numSatellites];

void setup() {
  size(800, 600);
  frameRate(60);
  smooth();
  noStroke();
  noFill();
  
  cloud1 = new cloud(400, 100, 150, 1);
  cloud2 = new cloud(259, 75, 80, 1);
  cloud3 = new cloud(25, 400, 40, 1);
  rocket = new rocket(width/2, height-(height/5), 50, 100);
  myFire = new fire(width/2, height/2, 50, #F25911);
  test = new satellite(-50, 50, 50, 100, 3);
  
  for (int i=0; i<numSatellites; i++) {
    mySatellites[i] = new satellite(-50, random(width), 50, 100, random(-4,4));
  }
}

void draw() {
  println(rocket.rotateRight);
  background(0, 0, 255);

  cloud1.displayCloud();
  cloud2.displayCloud();
  cloud3.displayCloud();

  cloud1.updateCloud();
  cloud2.updateCloud();
  cloud3.updateCloud();
  
  test.displaySatellite();
  test.updateSatellite();
  
  for (int i=0; i<numSatellites; i++) {
  mySatellites[i].displaySatellite();
  }
  for (int i=0; i<numSatellites; i++) {
  mySatellites[i].updateSatellite();
  }

  for (int i=0; i<numSatellites; i++) {
  rocket.displayRocket(test.xPos, test.yPos, test.xVel, mySatellites[i].xPos, mySatellites[i].yPos, mySatellites[i].xVel);
  }
  rocket.updateRocket();
  
  myFire.displayFire(rocket.xPos, rocket.yPos);
}

void keyPressed() {
  switch(keyCode) {
  case LEFT:
    rocket.left = true;
    break;
  case RIGHT:
    rocket.right = true;
    break;
    case UP:
    rocket.up = true;
    break;
  case DOWN:
    rocket.down = true;
    break;
  }
}

void keyReleased() {
  switch(keyCode) {
  case LEFT:
    rocket.left = false;
    rocket.fireLeft = false;
    break;
  case RIGHT:
    rocket.right = false;
    rocket.fireRight = false;
    break;
    case UP:
    rocket.up = false;
    rocket.fireUp = false;
    break;
  case DOWN:
    rocket.down = false;
    rocket.fireDown = false;
    break;
  }
}

