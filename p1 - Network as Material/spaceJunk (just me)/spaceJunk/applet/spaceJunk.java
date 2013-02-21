import processing.core.*; 
import processing.xml.*; 

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class spaceJunk extends PApplet {

// This tab coded by Matt.
// This is the main tab of the sketch. It contains the primary setup and draw functions.
// This tab also contains:
// *All of stage1's text
// *All of stage1's UI elements except for rocket health
// *The transitions to later game screens / stages
// *The keyPressed and keyReleased functions

int gameState; // Use this variable to control the current level (which screen the game shows).

PFont font; // This is just the default serif. Feel free to change it.

int textBox = 0xffFFFF00; // This is the color of the text boxes. Currently yellow.
int textColor = 0xff000000; // This is the color of the text. Currently black.

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

public void setup() {
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
  myFire = new fire(width/2, height/2, 50, 0xffF25911);
  test = new satellite(0, 225, 50, 100, 5);

  // Use a for loop to create all the satellites in the array. The specs don't really matter as long
  // as they are created off-screen (the update function for the object will take care of the rest).
  for (int i=0; i<numSatellites; i++) {
    mySatellites[i] = new satellite(-50, random(height), 50, 100, random(-4, 4));
  }
}

public void draw() {

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
public void keyPressed() {
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

public void keyReleased() {
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

// This tab coded by Matt.

class cloud {
  float xPos;
  float yPos;
  float rad;
  int speed;

  cloud(float x, float y, float r, int s) {
    xPos = x;
    yPos = y;
    rad = r;
    speed = s;
  }

  public void displayCloud() {
    fill(255);
    noStroke();
    ellipse(xPos, yPos, rad, rad/2);
  }

  public void updateCloud() {
    yPos += speed; // Scroll the clouds downward to simulate the sensation of flying upward.

    // If the cloud goes off the bottom of the screen, replace it above the screen at a random place and size:
    if (yPos > height + 50) {
      yPos = -50;
      xPos = random(width);
      rad = random(40, 200);
    }
  }
}

// This tab coded by Matt.

class fire {
  float xPos;
  float yPos;
  float rad;
  int fiery;

  fire(float x, float y, float r, int c) {
    xPos = x;
    yPos = y;
    rad = r;
    fiery = c;
  }

  public void displayFire(float x, float y) {
    ellipseMode(CENTER);
    fill(fiery);
    // First we check if the player is pressing any movement keys:
    if (rocket.fireLeft == true || rocket.fireRight == true || 
      rocket.fireUp == true || rocket.fireDown == true) {
      if (rocket.fireLeft == true) { // Draw the fire in different places depending on which key is pressed.
        ellipse(x+rocket.wide, y+rocket.length+(rad/2)/2, rad/2, rad/2);
      }
      if (rocket.fireRight == true) { // Different sizes, too.
        ellipse(x, y+rocket.length+(rad/2)/2, rad/2, rad/2);
      }
      if (rocket.fireUp == true) {
        ellipse(x+(rocket.wide/2), y+rocket.length+(rad*1.5f)/2, rad*1.5f, rad*1.5f);
      }
      if (rocket.fireDown == true) {
        ellipse(x+(rocket.wide/2), y+rocket.length+(rad*0.75f)/2, rad*0.75f, rad*0.75f);
      }
    }
    else { // If no keys are pressed, draw the fire at a default place and size:
      ellipse(x+(rocket.wide/2), y+rocket.length+rad/2, rad, rad);
    }
  }
}

// This tab coded by Matt.
// This tab contains:
// *Rocket UI elements (health bar)
// *Movement rules
// *Collision detection with effects on movement and health

class rocket {
  float xPos;
  float yPos;
  float length;
  float wide;
  int speed = 3;
  float xVel = 0;
  float yVel = 0;
  float slow = 0.9f; // This controls how quickly the rocket stops moving if it is knocked by a collision.
  float knockbackSpeed = 20; // This is how much the rocket is knocked by a collision.
  int rotateTimer; // This limits how long the rocket stays rotated.
  int rotateTimerLimit = 30; // And here is the limit.
  int health = 200;
  int thatHurts = 10; // This is how much damage a collision does.
  boolean ouch; // This turns damage on and off.
  int healthBar = 0xff989890; // gray
  int healthBarStroke = 0xffFFFFFF; // white

  boolean allowMove; // This prevents movement for the cinematic effect.
  boolean right; // These booleans allow movement in various directions.
  boolean left;
  boolean up;
  boolean down;
  boolean fireRight; // These booleans tell the fire where and how to be drawn.
  boolean fireLeft;
  boolean fireUp;
  boolean fireDown;
  boolean rotateRight; // These booleans let the rocket rotate upon impact.
  boolean rotateLeft;

  rocket(float x, float y, float w, float l) {
    xPos = x;
    yPos = y;
    length = l;
    wide = w;
  }

  // In order to do collision detection, we need to compare the rocket's position with the position
  // and velocity of the satellites. But those change during play. So we have to feed the changing values
  // into the rocket's display function so it can update accordingly. We do this by creating slots for values
  // in the function here, then filling those slots with the needed information when we call the function
  // on the main tab.
  public void displayRocket(float x, float y, float v, float x2, float y2, float v2) {
    // Draw the health bar:
    stroke(healthBarStroke);
    noFill();
    rect(5, 5, 202, 20);
    noStroke();
    fill(healthBar);
    rect(6, 6, health, 18);

    // Prevent the rocket from going offscreen:
    if (yPos+length>height) {
      yPos=height-length;
    }
    if (yPos<0) {
      yPos=0;
    }
    if (xPos+wide>width) {
      xPos=width-wide;
    }
    if (xPos<0) {
      xPos=0;
    }

    // Take damage:
    if (ouch == true) {
      health -= thatHurts;
      ouch = false; // Hopefully using the boolean prevents multiple damage calls when there should only be one.
    }

    // Collision detection with the test satellite:

    // See if they overlap:
    if (xPos+wide>x && xPos<x+test.wide && yPos<y+test.length && yPos+length>y) {

      // I put the following line in to prevent the rocket from taking damage before the player gets control.
      // I realized this was necessary when I was playtesting and lost the game before I could even do anything.
      if (allowMove == true) {

        // For some reason, the collision with the test satellite does 10 times normal damage.
        // I don't know why and don't have the time to figure it out right now (maybe it's
        // compounding the effect somehow?) but dividing by 10 achieves the desired effect:
        health -= (thatHurts/10);
      }

      // This next big chunk handles the complexities of collision. Depending on how the rocket hits the
      // satellite, it will bounce away and rotate differently:
      if (yPos > y+(test.length-(test.length/3))) {
        yVel = knockbackSpeed/4;
        if (v>0) {
          rotateRight = true;
          rotateTimer = rotateTimerLimit;
        }
        if (v<0) {
          rotateLeft = true;
          rotateTimer = rotateTimerLimit;
        }
      }
      if (yPos+(length-(length/3)) < y+(test.length/3)) {
        yVel = -knockbackSpeed/4;
        if (v>0) {
          rotateLeft = true;
          rotateTimer = rotateTimerLimit;
        }
        if (v<0) {
          rotateRight = true;
          rotateTimer = rotateTimerLimit;
        }
      }
      if (v>0) {
        xVel = knockbackSpeed;
      }
      if (v<0) {
        xVel = -knockbackSpeed;
      }
    }

    // Collision detection with the satellite array (see the comments above):

    for (int i=0; i<numSatellites; i++) {

      if (xPos+wide>x2 && xPos<x2+mySatellites[i].wide && yPos<y2+mySatellites[i].length && yPos+length>y2) {
        ouch = true;
        if (yPos > y2+(mySatellites[i].length-(mySatellites[i].length/3))) {
          yVel = knockbackSpeed/4;
          if (v2>0) {
            rotateRight = true;
            rotateTimer = rotateTimerLimit;
          }
          if (v2<0) {
            rotateLeft = true;
            rotateTimer = rotateTimerLimit;
          }
        }
        if (yPos+(length-(length/3)) < y2+(mySatellites[i].length/3)) {
          yVel = -knockbackSpeed/4;
          if (v2>0) {
            rotateLeft = true;
            rotateTimer = rotateTimerLimit;
          }
          if (v2<0) {
            rotateRight = true;
            rotateTimer = rotateTimerLimit;
          }
        }
        if (v2>0) {
          xVel = knockbackSpeed;
        }
        if (v2<0) {
          xVel = -knockbackSpeed;
        }
      }
    }

    // Let's draw the actual rocket! Right now it's a rectangle. First we give it color:
    fill(255, 0, 0);

    // Rotate the rocket upon impact:

    if (rotateRight == true) {
      pushMatrix();
      translate(xPos+(wide/2), yPos+(length/2)); // Put the origin at the rocket's center to make rotation easier.
      rotate(10);
      rect(xPos-(xPos+(wide/2)), yPos-(yPos+(length/2)), wide, length);
      popMatrix();
    }

    else if (rotateLeft == true) {
      pushMatrix();
      translate(xPos+(wide/2), yPos+(length/2));
      rotate(-10);
      rect(xPos-(xPos+(wide/2)), yPos-(yPos+(length/2)), wide, length);
      popMatrix();
    }
    else {
      rect(xPos, yPos, wide, length); // Here's where we draw the default, non-rotated rectangle.
    }
  }

  public void updateRocket() {
    xPos += xVel;
    yPos += yVel;

    if (rotateTimer > 0) { // If the rocket is rotated, count down to rotating it back to normal.
      rotateTimer--;
    }

    if (rotateTimer <= 0) {
      rotateRight = false;
      rotateLeft = false;
    }

    // With the following lines, we check if there's any y and x velocity and if so reduce it (like friction):
    if (yVel != 0 ) {
      yVel *= slow;
    }

    if (xVel != 0) {
      xVel *= slow;
    }

    if (yVel <= 0.1f && yVel >= -0.1f) {
      yVel = 0;
    }

    if (xVel <= 0.1f && xVel >= -0.1f) {
      xVel = 0;
    }

    // Move the rocket and draw the fire appropriately:
    if (allowMove == true) {
      if (right == true) {
        if (xPos+wide<=width) {
          xPos+=speed;
          fireRight=true;
        }
      }
      if (left == true) {
        if (xPos>=0) {
          xPos-=speed;
          fireLeft=true;
        }
      }
      if (up == true) {
        if (yPos>=0) {
          yPos-=speed;
          fireUp=true;
        }
      }
      if (down == true) {
        if (yPos+length<=height) {
          yPos+=speed;
          fireDown=true;
        }
      }
    }
  }
}

// This tab coded by Matt.
// This tab contains:
// *Rules for randomly positioning the satellites

class satellite {
  float xPos;
  float yPos;
  float length;
  float wide;
  float xVel;
  int yVel;
  int delayEntrance=1130; // This controls when the first satellite shows up.
  int delayArrayEntrance = 460; // This controls when the array shows up. 
  int xPosOffset = 240; // Use this to position the satellites offscreen.
  boolean warpPosition; // Test whether the satellite should warp position.
  float die; // Use this to roll a die.

  satellite(float x, float y, float w, float l, float v) {
    xPos = x;
    yPos = y;
    length = l;
    wide = w;
    xVel = v;
  }

  public void displaySatellite() {
    fill(0, 255, 0);
    rect(xPos, yPos, wide, length);
  }

  public void updateSatellite() {
    yVel = cloud1.speed; // Scroll the satellites vertically the same as the clouds.
    yPos += yVel;
    xPos += xVel;

    // When the satellites go off screen, we want to move them to a random place either to the left
    // or to the right of the screen. We only want to warp once before letting the satellite reappear,
    // though, which is why we use a boolean to control warping, which turns on after one use and only
    // turns off again when the satellite comes onscreen:
    if (xPos<width && xPos>0) {
      if (warpPosition == true) {
        warpPosition = false;
      }
    }

    // If the satellite goes offscreen, we check if it's already warped. If it hasn't, warp it:
    if (xPos>width || xPos<0) {
      if (warpPosition == false) {
        yPos = random(height);

        // In order to randomly set the direction of movement, we roll a die:
        die = random(-1, 1);
        if (die <= 0) { // If it's less than 1, we bring the satellite in from the left:
          xPos = -xPosOffset;
          xVel = random(1, 4);
        }
        else if (die > 0) { // If it's greater than 1, we bring the satellite in from the right:
          xPos = width + xPosOffset;
          xVel = random(-4, -1);
        }

        warpPosition = true; // We turn on the boolean so the satellite doesn't warp again before appearing.
      }
    }
  }
}

  static public void main(String args[]) {
    PApplet.main(new String[] { "--bgcolor=#FFFFFF", "spaceJunk" });
  }
}
