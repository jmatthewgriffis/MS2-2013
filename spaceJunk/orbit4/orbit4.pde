//audio stuff
import ddf.minim.*;
Minim minim;
AudioSnippet thud;
AudioSnippet shipExplosion;
//text stuff
PFont font;

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
//message stuff
Message[] message = new Message[99];
int nextMessage;

//timers
int timer;
int spaceJunkTimer;

Rocket rocket = new Rocket(200, 200, 0);
boolean right, left, up, down, space;
int lastFrame;
int collisionCounter;

int initialJunkAmount = 60;
int rocketColorTimer;


//Satellite[] spaceJunk = new Satellite[junkAmount];

void setup() {

  size(800, 600);
  background(0);
  noStroke();
  smooth();
  earth = loadImage("Earth.png");
  minim = new Minim(this);
  thud = minim.loadSnippet("thud.mp3");
  shipExplosion = minim.loadSnippet("shipExplosion.mp3");
  spaceJunkTimer =0;
  collisionCounter=0;
  rocketColorTimer=0;
  font = loadFont("AdobeGothicStd-Bold-20.vlw");


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
    spaceJunkList.add(new Satellite(width/2, height/2));
  }

  //create stars
  for (int k=0; k<starAmount; k++) {
    stars[k] = new Star();
  }

  timer = 0;
  //create message array
  for (int j=0; j<99; j++) {
    message[j] = new Message();
  }
}

void draw() {
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
    Satellite temp = (Satellite) spaceJunkList.get(i);
    temp.display();
  }

  //junk collision
  for (int i=0; i<spaceJunkList.size(); i++) {
    for (int j=0; j<spaceJunkList.size(); j++) {
      Satellite satellite1 =(Satellite) spaceJunkList.get(i);
      Satellite satellite2 =(Satellite) spaceJunkList.get(j);

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
          spaceJunkList.add(new Satellite(width/2, height/2)); //add new sattelite
          Satellite satellite3 = (Satellite) spaceJunkList.get(spaceJunkList.size()-1);
          satellite3.orbitSize = satellite1.orbitSize;
          satellite3.cx = satellite1.cx+satellite1.circleSize; //then give it location near collision
          satellite3.cy = satellite1.cy+satellite1.circleSize;
          satellite3.orbitTime = satellite1.orbitTime;
          thud.play();
          thud.rewind();
          satellite1.split=false;
          satellite3.split=false;
        }


        if (satellite2.split==true) { 
          //          spaceJunkList.add(new Satellite((int)satellite1.x, (int)satellite1.y));
          spaceJunkList.add(new Satellite(width/2, height/2));
          Satellite satellite4 = (Satellite) spaceJunkList.get(spaceJunkList.size()-1);
          satellite4.orbitSize = satellite2.orbitSize;
          satellite4.cx = satellite2.cx+satellite2.circleSize;
          satellite4.cy = satellite2.cy+satellite2.circleSize;
          satellite4.orbitTime = satellite2.orbitTime;
          thud.play();
          thud.rewind();
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
    Satellite satellite1 =(Satellite) spaceJunkList.get(i);


    float d=dist(satellite1.x, satellite1.y, rocket.xPos, rocket.yPos);
    if (d<((satellite1.circleSize+rocket.halfWidth)/2) && d>0 && satellite1.shipCollisionCheck==true) {
      rocket.rocketColor= color(255, 0, 0);
      collisionCounter++;
      satellite1.shipCollisionCheck=false;


      if (collisionCounter==5) {
        int randExplosion= (int)random(27, 30); //make ship explode into 27 to 30 pieces
        for (int j =0; j<randExplosion; j++) {
          spaceJunkList.add(new Satellite(width/2, height/2));
          Satellite satellite3 = (Satellite) spaceJunkList.get(spaceJunkList.size()-1);
          satellite3.orbitSize = satellite1.orbitSize;
          satellite3.cx = satellite1.cx+random(0, 20);
          satellite3.cy = satellite1.cy+random(0, 20);
          satellite3.orbitTime = satellite1.orbitTime;
          shipExplosion.play();
          shipExplosion.rewind();
        }
        collisionCounter=0; //reset rocket in center with zero velocity
        rocket.xPos=400;
        rocket.yPos=300;
        rocket.velocityX=0;
        rocket.velocityY=0;

      }
    }
  }
  println(collisionCounter);
  rocketColorTimer++;

  if (rocketColorTimer>30) {
    rocket.rocketColor= color(255);
    rocketColorTimer=0;
  }




  ////////////////////////////////////

  for (int k=0; k < starAmount; k++) { // display stars
    stars[k].display();
  }
  if (collisionCounter <5) { //only display rocket if collision less than 5

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


  if (timer % 10000 <= 50) {
    nextMessage++;
  }

  message[nextMessage].display();


  timer = millis();

  if (spaceJunkTimer==150) {             //add spacejunks periodically 
    int randNum = (int)random(0, 5);
    for (int i=0;i<randNum;i++) {
      Satellite temp = new Satellite(width/2, height/2);
      spaceJunkList.add(temp);
    }
    spaceJunkTimer=0;
  }
  
  //shield meter
  fill(255);
  rectMode(CORNER);
  textFont(font, 12);
  text("SHIELDS:", 20, 17);
  rect(20,22,livesLeft*40,10);
}


void stop() {
  thud.close();
  shipExplosion.close();
  minim.stop();
  super.stop();
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

//  question marks pop up and when you hit them, you get the messages. 
// collection element ---previous thing sent to space crashed and became space junk it had all of your important things. 
// narrative for both parts. 
// music 
// make space junk start at random points around the circle. 

