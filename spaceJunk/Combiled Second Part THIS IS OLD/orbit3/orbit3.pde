import ddf.minim.*;
Minim minim;
AudioSnippet thud;


int cx;
int cy;
int orbitSize;
float orbitTime;
int circleSize;
ArrayList spaceJunkList = new ArrayList();
PImage earth;
int starAmount =100;
Star[] stars = new Star[starAmount];
Message[] message = new Message[9999];
int nextMessage;
int timer;

int initialJunkAmount = 1;


//Satellite[] spaceJunk = new Satellite[junkAmount];

void setup() {

  size(800, 600);
  background(0);
  noStroke();
  smooth();
  earth = loadImage("Earth.png");
  minim = new Minim(this);
  thud = minim.loadSnippet("thud.mp3");


  cx = width/2;
  cy = height/2;
  orbitSize = 200;
  orbitTime = 1000.0;
  circleSize = 50;

  for (int i= 0; i<initialJunkAmount; i++) {
    spaceJunkList.add(new Satellite(width/2, height/2));
  }

  for (int k=0; k<starAmount; k++) {
    stars[k] = new Star();
  }

  timer = 0;

  for (int j=0; j<9999; j++) {
    message[j] = new Message();
  }
}

void draw() {
  noStroke();
  background(0);
  image(earth, width/2-75, height/2-75);

  fill(0);
  //  ellipse(width/2, height/2, 100, 100);



  for (int i=0; i<spaceJunkList.size(); i++) {
    Satellite temp = (Satellite) spaceJunkList.get(i);
    temp.display();
  }


  for (int i=0; i<spaceJunkList.size(); i++) {
    for (int j=0; j<spaceJunkList.size(); j++) {
      Satellite satellite1 =(Satellite) spaceJunkList.get(i);
      Satellite satellite2 =(Satellite) spaceJunkList.get(j);

      float d=dist(satellite1.x, satellite1.y, satellite2.x, satellite2.y);
      if (d<((satellite1.circleSize+satellite2.circleSize)/2) && d>0) {
        satellite1.circleColor=color(255, 0, 0);
        float tempSize1=satellite1.circleSize;
        float tempSize2=satellite2.circleSize;
        satellite1.circleSize=tempSize1/1.05;
        satellite2.circleSize=tempSize2/1.05;

        if (satellite1.split==true) { 
          //          spaceJunkList.add(new Satellite((int)satellite1.x, (int)satellite1.y));
          spaceJunkList.add(new Satellite(width/2, height/2));
          Satellite satellite3 = (Satellite) spaceJunkList.get(spaceJunkList.size()-1);
          satellite3.orbitSize = satellite1.orbitSize;
          satellite3.cx = satellite1.cx+satellite1.circleSize;
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
  for (int k=0; k < starAmount; k++) {
    stars[k].display();
  }
  if (timer % 10000 <= 50) {
    nextMessage++;
  }

  message[nextMessage].display();


  timer = millis();
}

void mousePressed() {
  Satellite temp = new Satellite(width/2, height/2);
  spaceJunkList.add(temp);
}

void stop(){
thud.close();
minim.stop();
super.stop();
}

