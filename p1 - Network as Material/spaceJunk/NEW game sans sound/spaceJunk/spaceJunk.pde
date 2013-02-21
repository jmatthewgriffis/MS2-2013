// This tab coded by Matt (and possibly modified by Owen and/or Michael).
// This is the main tab of the sketch. It contains the primary setup and draw functions.
// This tab also contains:
// *All of stage1's text
// *All of stage1's UI elements except for rocket health
// *The transitions to later game screens / stages
// *The keyPressed and keyReleased functions

int gameState; // Use this variable to control the current level (which screen the game shows).

import ddf.minim.*; // Prepare for music by importing the necessary library to play audio.

PFont font; // This is just the default serif. Feel free to change it.
PImage title; //Image for the game title (gameState 0)
int titleFade;

PImage interlude;//text for gameState 2

PImage background; //gradient background for gameState 0 and 1

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

Minim myMinim; // Minim object, necessary to run music.
AudioPlayer music1; // Music for stage 1.
AudioPlayer music2; // Music for stage 2.
cloud cloud1;
cloud cloud2;
cloud cloud3;
rocket rocket;
fire myFire;
satellite test;

int numSatellites = 10; // This is how many objects we'll use in the array.

satellite[] mySatellites = new satellite[numSatellites]; // And here's the array.

//below are variables for second part of game

//audio stuff
import ddf.minim.*;
Minim minim;
AudioSnippet thud;
AudioSnippet shipExplosion;
//text stuff
PFont fontPart2;

//
int livesLeft;
//SpaceJunk orbit stuff
int cx;
int cy;
int orbitSize;
float orbitTime;
int circleSize;
ArrayList spaceJunkList = new ArrayList();

//art stuff
PImage earth;
int starAmount =100;
Star[] stars = new Star[starAmount];

//event stuff
Event[] events = new Event[12];

//timers
int spaceJunkTimer;

Rocket2 rocket2 = new Rocket2(400, 300, 0);
boolean right, left, up, down, space, rocketHitCheck;
int lastFrame;
int collisionCounter;

int initialJunkAmount = 60;
int rocketColorTimer;

void setup() {
  size(800, 600);
  frameRate(60);
  smooth();
  noStroke();
  noFill();

  font = loadFont("font.vlw");

  gameState = 0; // gameState 1 is the first level (stage 1). We could make a title screen gameState 0.

  title = loadImage("Title.png");
  titleFade = 255;

  interlude = loadImage("interlude.png");

  background = loadImage("background.png");

  firstMsgDelay = 180;
  firstMsgTimer = 180;
  secondMsgDelay = 180;
  secondMsgTimer = 180;
  thirdMsgDelay = 180;
  thirdMsgTimer = 180;
  dodgeMsgTimer = 180;

  timeTillOrbit = 90;
  secondCounter = 60;
  switchToOrbit = 400;

  minim = new Minim(this); // Prep the minim.
  //music1 = myMinim.loadFile("music.mp3");
  //music2 = myMinim.loadFile("music.mp3");
  cloud1 = new cloud(400, 100, 150, 1, 1);
  cloud2 = new cloud(259, 75, 80, 1, 2);
  cloud3 = new cloud(25, 400, 40, 1, 3);
  rocket = new rocket(width/2-25, height-(height/3), 50, 100);
  myFire = new fire(width/2, height/2, 50, #F25911);
  test = new satellite(0, 225, 50, 100, 5);

  // Use a for loop to create all the satellites in the array. The specs don't really matter as long
  // as they are created off-screen (the update function for the object will take care of the rest).
  for (int i=0; i<numSatellites; i++) {
    mySatellites[i] = new satellite(-50, random(height), 50, 100, random(-4, 4));
  }

  //below is setup for second part of game
  earth = loadImage("Earth.png");
  minim = new Minim(this);
  thud = minim.loadSnippet("thud.mp3");
  shipExplosion = minim.loadSnippet("shipExplosion.mp3");
  spaceJunkTimer =0;
  collisionCounter=0;
  rocketColorTimer=0;
  rocketHitCheck=false;
  fontPart2 = loadFont("AdobeGothicStd-Bold-20.vlw");


  //orbit stuff
  cx = width/2;
  cy = height/2;
  orbitSize = 200;
  orbitTime = 1000.0;
  circleSize = 50;
  //rocket movement
  right = false;
  left = false;
  up = false;
  down = false;
  space = false;

  //create initial space junks
  for (int i= 0; i<initialJunkAmount; i++) {
    spaceJunkList.add(new Satellite2(width/2, height/2));
  }

  //create stars
  for (int k=0; k<starAmount; k++) {
    stars[k] = new Star();
  }

  //create event array
  for (int m=0; m<12; m++) {
    events[m] = new Event(m+1);
  }
}

void draw() {

  if (gameState == 0) {
    image(background, 0, 0);
    image(title, 0, 0);
    titleFade--;

    if (titleFade <= 0) {
      gameState = 1;
    }
  }

  if (gameState == 1) { // If it is stage 1...
    tint(255, 255);
    image(background, 0, 0);

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

    //draw stars
    for (int k=0; k < starAmount; k++) { // display stars
      stars[k].display();
    }

    image(interlude, 0, 0);

    //    textAlign(CENTER);
    //    fill(255);
    //    textFont(font, fontSize);
    //    text("Now entering orbit...", width/2, height/2);

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
    noStroke();
    background(0);
    tint(255, 255);
    image(earth, width/2-75, height/2-75);
    spaceJunkTimer++;
    livesLeft = 5-collisionCounter; //calculate lives left

    fill(0);
    //  ellipse(width/2, height/2, 100, 100);


    //display space junks
    for (int i=0; i<spaceJunkList.size(); i++) {
      Satellite2 temp = (Satellite2) spaceJunkList.get(i);
      temp.display();
    }

    //junk collision
    for (int i=0; i<spaceJunkList.size(); i++) {
      for (int j=0; j<spaceJunkList.size(); j++) {
        Satellite2 satellite1 =(Satellite2) spaceJunkList.get(i);
        Satellite2 satellite2 =(Satellite2) spaceJunkList.get(j);

        float d=dist(satellite1.x, satellite1.y, satellite2.x, satellite2.y);
        if (d<((satellite1.circleSize+satellite2.circleSize)/2) && d>0) {
          satellite1.circleColor=color(255, 0, 0);
          float tempSize1=satellite1.circleSize;
          float tempSize2=satellite2.circleSize;
          //decrease size 
          if (satellite1.circleSize>2) satellite1.circleSize=tempSize1/1.05;//decrease size of involved satellites
          if (satellite2.circleSize>2) satellite2.circleSize=tempSize2/1.05;



          if (satellite1.split==true) { 
            //          spaceJunkList.add(new Satellite((int)satellite1.x, (int)satellite1.y));
            spaceJunkList.add(new Satellite2(width/2, height/2)); //add new sattelite
            Satellite2 satellite3 = (Satellite2) spaceJunkList.get(spaceJunkList.size()-1);
            satellite3.orbitSize = satellite1.orbitSize;
            satellite3.cx = satellite1.cx+satellite1.circleSize; //then give it location near collision
            satellite3.cy = satellite1.cy+satellite1.circleSize;
            satellite3.orbitTime = satellite1.orbitTime;
            int sound = int(random(4));
            if (sound < 2) {
              thud.play();
              thud.rewind();
              satellite1.split=false;
              satellite3.split=false;
            }
          }


          if (satellite2.split==true) { 
            //          spaceJunkList.add(new Satellite((int)satellite1.x, (int)satellite1.y));
            spaceJunkList.add(new Satellite2(width/2, height/2));
            Satellite2 satellite4 = (Satellite2) spaceJunkList.get(spaceJunkList.size()-1);
            satellite4.orbitSize = satellite2.orbitSize;
            satellite4.cx = satellite2.cx+satellite2.circleSize;
            satellite4.cy = satellite2.cy+satellite2.circleSize;
            satellite4.orbitTime = satellite2.orbitTime;
            int sound = int(random(4));
            if (sound < 2) {
              thud.play();
              thud.rewind();
            }
            satellite2.split=false;
            satellite4.split=false;
          }
          //        if(satellite2.split==true){ 
          //          spaceJunkList.add(new Satellite((int)satellite2.x, (int)satellite2.y));
          //          satellite2.split=false;
          //        }
        }
        else {
          satellite1.circleColor=color(0, 255, 0);
          satellite2.circleColor=color(0, 255, 0);
        }
      }
    }
    //satellite rocket collision
    for (int i=0; i<spaceJunkList.size(); i++) {
      Satellite2 satellite1 =(Satellite2) spaceJunkList.get(i);


      float d=dist(satellite1.x, satellite1.y, rocket2.xPos, rocket2.yPos);
      if (d<((satellite1.circleSize+rocket2.halfWidth)/2) && d>0 && satellite1.shipCollisionCheck==true) {
        rocketHitCheck=true;
        collisionCounter++;
        satellite1.shipCollisionCheck=false;


        if (collisionCounter==5) {
          int randExplosion= (int)random(27, 30); //make ship explode into 27 to 30 pieces
          for (int j =0; j<randExplosion; j++) {
            spaceJunkList.add(new Satellite2(width/2, height/2));
            Satellite2 satellite3 = (Satellite2) spaceJunkList.get(spaceJunkList.size()-1);
            satellite3.orbitSize = satellite1.orbitSize;
            satellite3.cx = satellite1.cx+random(0, 20);
            satellite3.cy = satellite1.cy+random(0, 20);
            satellite3.orbitTime = satellite1.orbitTime;
            shipExplosion.play();
            shipExplosion.rewind();
          }
          collisionCounter=0; //reset rocket in center with zero velocity
          rocket2.xPos=400;
          rocket2.yPos=300;
          rocket2.velocityX=0;
          rocket2.velocityY=0;
        }
      }
    }
    //println(rocketHitCheck);
    rocketColorTimer++;

    if (rocketColorTimer>30) {
      //    rocket.rocketColor= color(255);
      rocketHitCheck=false;
      rocketColorTimer=0;
    }




    ////////////////////////////////////

    for (int k=0; k < starAmount; k++) { // display stars
      stars[k].display();
    }


    if (collisionCounter <5) { //only display rocket if collision less than 5

        if (right)
        rocket2.rotateClockwise();
      if (left)
        rocket2.rotateCounterclockwise();
      if (up)
        rocket2.fireThrusters();
      if (down)
        rocket2.backThrusters();

      rocket2.update();
      rocket2.drawMe();
    }

    if (spaceJunkTimer==150) {             //add spacejunks periodically 
      int randNum = (int)random(0, 5);
      for (int i=0;i<randNum;i++) {
        Satellite2 temp = new Satellite2(width/2, height/2);
        spaceJunkList.add(temp);
      }
      spaceJunkTimer=0;
    }

    //shield meter
    fill(255);
    rectMode(CORNER);
    textFont(fontPart2, 12);
    text("SHIELDS:", 25, 17);
    rect(20, 22, livesLeft*40, 10);


    //Loop through and display events
    for (int m=0; m<12; m++) {
      float d=dist(events[m].x, events[m].y, rocket2.xPos, rocket2.yPos);
      if (d<((25+rocket2.halfWidth)/2)) {

        events[m].collision = true;
      }

      events[m].display();
    }
  } // End "if (gameState == 3)"
}

//Function that draws gradient background for Part 1
void drawBackground() {
  color c1 = color(120, 175, 205);
  color c2 = color(175, 205, 235);

  for (int i = 0; i <= height; i++) {
    float inter = map(i, 0, height, 0, 1);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    line(0, i, width, i);
  }
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

  if (key == '0') {
    gameState = 0;
  }

  if (key == '1') {
    gameState = 1;
  }

  if (key == '2') {
    gameState = 2;
  }

  if (key == '3') {
    gameState = 3;
  }

  //below is for second part
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

  //below is for second part
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

void stop() {
  thud.close();
  shipExplosion.close();
  minim.stop();
  super.stop();
}

