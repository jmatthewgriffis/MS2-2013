PFont font;

int firstMsgDelay = 180;
int firstMsgTimer = 180;
int secondMsgDelay = 180;
int secondMsgTimer = 180;
int thirdMsgDelay = 180;
int thirdMsgTimer = 180;

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

  font = loadFont("font.vlw");

  cloud1 = new cloud(400, 100, 150, 1);
  cloud2 = new cloud(259, 75, 80, 1);
  cloud3 = new cloud(25, 400, 40, 1);
  rocket = new rocket(width/2-25, height-(height/3), 50, 100);
  myFire = new fire(width/2, height/2, 50, #F25911);
  test = new satellite(0, 225, 50, 100, 5);

  for (int i=0; i<numSatellites; i++) {
    mySatellites[i] = new satellite(-50, random(width), 50, 100, random(-4, 4));
  }
}

void draw() {
  background(0, 0, 255);

  cloud1.displayCloud();
  cloud2.displayCloud();
  cloud3.displayCloud();

  cloud1.updateCloud();
  cloud2.updateCloud();
  cloud3.updateCloud();

  if (test.delayEntrance <= 0) {
    test.displaySatellite();
    test.updateSatellite();
  }

  if (test.delayArrayEntrance <= 0) {
    for (int i=0; i<numSatellites; i++) {
      mySatellites[i].displaySatellite();
    }
    for (int i=0; i<numSatellites; i++) {
      mySatellites[i].updateSatellite();
    }
  }
  
  myFire.displayFire(rocket.xPos, rocket.yPos);

  for (int i=0; i<numSatellites; i++) {
    rocket.displayRocket(test.xPos, test.yPos, test.xVel, mySatellites[i].xPos, mySatellites[i].yPos, mySatellites[i].xVel);
  }
  rocket.updateRocket();

  if (test.delayEntrance > 0) {
    test.delayEntrance--;
  }

  if (test.delayEntrance <= 0) {
    if (test.delayArrayEntrance > 0) {
      test.delayArrayEntrance--;
    }
  }

  if (firstMsgDelay > 0) {
    firstMsgDelay--;
  }
  if (firstMsgDelay <= 0) {
    if (firstMsgTimer > 0) {
      firstMsgTimer--;
    }
  }
  if (firstMsgTimer <= 0) {
    if (secondMsgDelay > 0) {
      secondMsgDelay--;
    }
  }
  if (secondMsgDelay <= 0) {
    if (secondMsgTimer > 0) {
      secondMsgTimer--;
    }
  }
  if (secondMsgTimer <= 0) {
    if (thirdMsgDelay > 0) {
      thirdMsgDelay--;
    }
  }
  if (thirdMsgDelay <= 0) {
    if (thirdMsgTimer > 0) {
      thirdMsgTimer--;
    }
  }

  if (firstMsgDelay <= 0 && firstMsgTimer > 0) {
    fill(255);
    rect(width/2-100, height/2-45, 200, 80);
    textAlign(CENTER);
    fill(0);
    textFont(font, 24);
    text("Autopilot enabled.", width/2, height/2-20);
  }
  if (secondMsgDelay <= 0 && secondMsgTimer > 0) {
    fill(255);
    rect(width/2-100, height/2-45, 200, 80);
    textAlign(CENTER);
    fill(0);
    textFont(font, 24);
    text("What a beautiful day.", width/2, height/2-20);
  }
  if (thirdMsgDelay <= 0 && thirdMsgTimer > 0) {
    fill(255);
    rect(width/2-100, height/2-45, 200, 80);
    textAlign(CENTER);
    fill(0);
    textFont(font, 24);
    text("Clear skies for\na safe launch.", width/2, height/2-20);
  }
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

