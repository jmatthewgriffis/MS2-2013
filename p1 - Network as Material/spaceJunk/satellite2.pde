class Satellite2 {
  float cx;
  float cy;
  int orbitSize;
  float orbitTime;
  float circleSize;
  float x;
  float y;
  color circleColor;
  boolean split;
  boolean shipCollisionCheck;
  

  Satellite2(int _cx, int _cy) {

    cx = _cx;
    cy = _cy;
    orbitSize = int(random(110, 300));
    orbitTime = random(900.0, 2000.0);
    circleSize = int(random(5, 20));
    circleColor = color(0, 255, 0);
    split=true;
    shipCollisionCheck=true;
 
  }

  void display() {

    float t = millis()/orbitTime;

    x = int(cx+orbitSize*cos(t));
    y = int(cy+orbitSize*sin(t));

    fill(circleColor);

    ellipse(x, y, circleSize, circleSize);

  }
}

