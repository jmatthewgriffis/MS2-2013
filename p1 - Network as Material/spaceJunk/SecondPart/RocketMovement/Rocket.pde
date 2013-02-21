class Rocket {
  //Fields
  float rotation = 0;
  float xPos, yPos;
  final int halfWidth = 10;
  final int halfHeight= 10;
  float velocityX, velocityY;
  float speed;
 
  //Empty Constructor
  Rocket() {
  }
  //Constructor
  Rocket(int initialX, int initialY, float initialRot) {
    xPos = initialX;
    yPos = initialY;
    rotation = initialRot;
    speed = 25;
  }
 
  void update() {
    xPos += velocityX;
    yPos += velocityY;
    if(xPos > 500) {
      xPos -= 500;
    }
    else if(xPos < 0) {
      xPos += 500;
    }
    if(yPos > 500) {
      yPos -= 500;
    }
    else if(yPos < 0) {
      yPos += 500;
    }
  }
   
  //Draw Method
  void drawMe() {
    pushMatrix();
    translate(xPos, yPos);
    rotate(rotation);
    smooth();
 
    triangle(0, -halfHeight, -halfWidth, halfHeight, halfWidth,halfHeight);
    rectMode(CORNERS);
    rect(-halfWidth + 5, halfHeight, -halfWidth + 8, halfHeight + 3);
    rect(halfWidth - 8, halfHeight, halfWidth - 5, halfHeight + 3);
    popMatrix();
 
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

