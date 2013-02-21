class Rocket {
  //Fields
  float rotation = 0;
  float xPos, yPos;
  final int halfWidth = 10;
  final int halfHeight= 10;
  float velocityX, velocityY;
  float speed;
  color rocketColor;
  PImage rocket1;



  //Empty Constructor
  Rocket() {
  }
  //Constructor
  Rocket(int initialX, int initialY, float initialRot) {
    xPos = initialX;
    yPos = initialY;
    rotation = initialRot;
    speed = 25;
    rocketColor = color(255);
  }

  void update() {
    xPos += velocityX;
    yPos += velocityY;
    if (xPos > 800) {
      xPos -= 800;
    }
    else if (xPos < 0) {
      xPos += 800;
    }
    if (yPos > 600) {
      yPos -= 800;
    }
    else if (yPos < 0) {
      yPos += 600;
    }
  }

  //Draw Method
  void drawMe() {    

    if (rocketHitCheck==false) rocket1 = loadImage("rocket.png");
    if (rocketHitCheck==true)  rocket1 = loadImage("redrocket.png");


    noStroke();
    fill(rocketColor);
    pushMatrix();
    translate(xPos, yPos);
    rotate(rotation);
    smooth();
    rocket1.resize(halfWidth*3+6, halfHeight*3+6);
    imageMode(CENTER);

    image(rocket1, 0, 0);

    //        triangle(0, -halfHeight, -halfWidth, halfHeight, halfWidth,halfHeight);
    //    rectMode(CORNERS);
    //        rect(-halfWidth + 5, halfHeight, -halfWidth + 8, halfHeight + 3);
    //        rect(halfWidth - 8, halfHeight, halfWidth - 5, halfHeight + 3);
    popMatrix();
    imageMode(CORNER);

    fill(255);
  }

  void rotateClockwise() {
    rotation = rotation + 0.1;
  }

  void rotateCounterclockwise() {
    rotation = rotation - 0.1;
  }

  void fireThrusters() {
    velocityX += + sin(rotation)/speed;
    velocityY += - cos(rotation)/speed;
  }

  void backThrusters() {
    velocityX += - sin(rotation)/speed;
    velocityY += + cos(rotation)/speed;
  }
}


