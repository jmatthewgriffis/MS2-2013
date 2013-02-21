// This tab coded by Matt.
// This is the main tab of the sketch. It contains the primary setup and draw functions.
// This tab also contains:
// *All of stage1's text
// *All of stage1's UI elements except for rocket health
// *The transitions to later game screens / stages
// *The keyPressed and keyReleased functions

int gameState; // Use this variable to control the current level (which screen the game shows).

PFont font; // This is just the default serif. Feel free to change it.

color textBox = #FFFF00; // This is the color of the text boxes. Currently yellow.
color textColor = #000000; // This is the color of the text. Currently black.

int fontSize = 24; // I created the font at 48 but I'm setting a variable at half that.

int firstMsgDelay; // These variables will all be used to control the display of messages.
int firstMsgTimer; // Delay is how long before the message appears. Timer is how long it appears.
int secondMsgDelay;
int secondMsgTimer;
int thirdMsgDelay;
int thirdMsgTimer;
int dodgeMsgTimer;

int timeTillOrbit; // This controls how long stage 1 lasts.
int secondCounter; // This counts seconds to use for displaying the remaining time.
int switchToOrbit; // This controls how long gameState 2 appears.

// Declare some objects;
cloud cloud1;
cloud cloud2;
cloud cloud3;
rocket rocket;
fire myFire;
satellite test;

int numSatellites = 10; // This is how many objects we'll use in the array.

satellite[] mySatellites = new satellite[numSatellites]; // And here's the array.

void setup() {
  size(800, 600);
  frameRate(60);
  smooth();
  noStroke();
  noFill();

  font = loadFont("font.vlw");

  gameState = 1; // gameState 1 is the first level (stage 1). We could make a title screen gameState 0.

  firstMsgDelay = 180;
  firstMsgTimer = 180;
  secondMsgDelay = 180;
  secondMsgTimer = 180;
  thirdMsgDelay = 180;
  thirdMsgTimer = 180;
  dodgeMsgTimer = 180;

  timeTillOrbit = 90;
  secondCounter = 60;
  switchToOrbit = 240;

  cloud1 = new cloud(400, 100, 150, 1);
  cloud2 = new cloud(259, 75, 80, 1);
  cloud3 = new cloud(25, 400, 40, 1);
  rocket = new rocket(width/2-25, height-(height/3), 50, 100);
  myFire = new fire(width/2, height/2, 50, #F25911);
  test = new satellite(0, 225, 50, 100, 5);

  // Use a for loop to create all the satellites in the array. The specs don't really matter as long
  // as they are created off-screen (the update function for the object will take care of the rest).
  for (int i=0; i<numSatellites; i++) {
    mySatellites[i] = new satellite(-50, random(height), 50, 100, random(-4, 4));
  }
}

void draw() {

  if (gameState == 1) { // If it is stage 1...
    background(0, 0, 255);

    cloud1.displayCloud();
    cloud2.displayCloud();
    cloud3.displayCloud();

    cloud1.updateCloud();
    cloud2.updateCloud();
    cloud3.updateCloud();

    if (test.delayEntrance <= 0) { // If time has passed and the first satellite should apepar...
      test.displaySatellite();
      test.updateSatellite();
    }

    if (test.delayArrayEntrance <= 0) { // If time has passed and the array should appear...
      for (int i=0; i<numSatellites; i++) {
        mySatellites[i].displaySatellite();
      }
      for (int i=0; i<numSatellites; i++) {
        mySatellites[i].updateSatellite();
      }
    }

    if (rocket.health > 0) { // If the rocket is not destroyed...
      myFire.displayFire(rocket.xPos, rocket.yPos); // Draw the engine fire. We feed it the location of the rocket.

      for (int i=0; i<numSatellites; i++) {
        // Draw the rocket, too. We feed it the location and velocity of the first satellite and all the ones in the array:
        rocket.displayRocket(test.xPos, test.yPos, test.xVel, mySatellites[i].xPos, mySatellites[i].yPos, mySatellites[i].xVel);
      }
    }
    else { // If the rocket is destroyed, draw a message of loss:
      fill(255, 0, 0);
      rect(width/2-300, height/2-50, 600, 80);
      textAlign(CENTER);
      fill(textColor);
      textFont(font, fontSize*2);
      text("KABOOM! Press 'r' to restart.", width/2, height/2);
    }
    rocket.updateRocket();

    if (test.delayEntrance > 0) { // If time should pass...
      test.delayEntrance--; // ...pass time.
    }

    if (test.delayEntrance <= 0) {
      if (test.delayArrayEntrance > 0) { // If time should pass...
        test.delayArrayEntrance--; // ...pass time.
      }
    }

    // Run through all the message timers in sequence:
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

    // Let's draw some well-timed text!
    if (firstMsgDelay <= 0 && firstMsgTimer > 0) {
      fill(textBox);
      rect(width/2-100-(25/2), height/2-45, 225, 80);
      textAlign(CENTER);
      fill(textColor);
      textFont(font, fontSize);
      text("Autopilot enabled.", width/2, height/2);
    }
    if (secondMsgDelay <= 0 && secondMsgTimer > 0) {
      fill(textBox);
      rect(width/2-100-(25/2), height/2-45, 225, 80);
      textAlign(CENTER);
      fill(textColor);
      textFont(font, fontSize);
      text("What a beautiful day.", width/2, height/2);
    }
    if (thirdMsgDelay <= 0 && thirdMsgTimer > 0) {
      fill(textBox);
      rect(width/2-100-(25/2), height/2-45, 225, 80);
      textAlign(CENTER);
      fill(textColor);
      textFont(font, fontSize);
      text("Clear skies for\na safe launch.", width/2, height/2-15);
    }
    if (test.delayArrayEntrance <= 0) {
      rocket.allowMove = true;
      if (dodgeMsgTimer > 0) {
        dodgeMsgTimer--;
        fill(textBox);
        rect(width/2-100-(25/2), height/2-60, 225, 115);
        textAlign(CENTER);
        fill(textColor);
        textFont(font, fontSize);
        text("Autopilot disabled.\nShields down.", width/2, height/2-40);
        textFont(font, fontSize*2);
        text("Dodge!", width/2, height/2+40);
      }
    }
    // Draw the countdown till the next stage:
    fill(255);
    rect(width-230, 5, 220, 30);
    textAlign(CENTER);
    fill(textColor);
    textFont(font, fontSize);
    text("Time Till Orbit: " + timeTillOrbit, width-120, 25);

    // Count down to the next stage.
    if (timeTillOrbit > 0) {
      secondCounter--;
      if (secondCounter <= 0) {
        timeTillOrbit--;
        secondCounter = 60;
      }
    }

    if (timeTillOrbit <= 0) {
      gameState = 2; // Switch to the next screen.
    }
  } // End "if (gameState == 1)"

  if (gameState == 2) { // This is an intermediary between stage 1 and stage 2.
    background(0);
    textAlign(CENTER);
    fill(255);
    textFont(font, fontSize);
    text("Now entering orbit...", width/2, height/2);

    // Count down time to stage 2:
    if (switchToOrbit > 0) {
      switchToOrbit--;
    }
    if (switchToOrbit <= 0) {
      gameState = 3; // Switch to stage 2 (which is gameState 3).
    }
  } // End "if (gameState == 2)"

  if (gameState == 3) {

    // Second part of game "draw" function goes here.
  } // End "if (gameState == 3)"
}

// Use booleans for smooth movement when pressing and releasing keys:
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

  // Set a restart option:
  if (key == 'r' || key == 'R') {
    delay(1000); // Some visual pizazz.
    setup();
  }
}

void keyReleased() {
  switch(keyCode) {
  case LEFT:
    rocket.left = false;
    rocket.fireLeft = false; // With these lines we make sure the fire defaults back to normal.
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

