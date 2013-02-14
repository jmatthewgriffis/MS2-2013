class fire {
  float xPos;
  float yPos;
  float rad;
  color fiery;

  fire(float x, float y, float r, color c) {
    xPos = x;
    yPos = y;
    rad = r;
    fiery = c;
  }

  void displayFire(float x, float y) {
    ellipseMode(CENTER);
    fill(fiery);
    if (rocket.fireLeft == true || rocket.fireRight == true || 
      rocket.fireUp == true || rocket.fireDown == true) {
      if (rocket.fireLeft == true) {
        ellipse(x+rocket.wide, y+rocket.length+(rad/2)/2, rad/2, rad/2);
      }
      if (rocket.fireRight == true) {
        ellipse(x, y+rocket.length+(rad/2)/2, rad/2, rad/2);
      }
      if (rocket.fireUp == true) {
        ellipse(x+(rocket.wide/2), y+rocket.length+(rad*1.5)/2, rad*1.5, rad*1.5);
      }
      if (rocket.fireDown == true) {
        ellipse(x+(rocket.wide/2), y+rocket.length+(rad*0.75)/2, rad*0.75, rad*0.75);
      }
    }
    else {
      ellipse(x+(rocket.wide/2), y+rocket.length+rad/2, rad, rad);
    }
  }
}

