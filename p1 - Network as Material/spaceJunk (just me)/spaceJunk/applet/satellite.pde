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

  void displaySatellite() {
    fill(0, 255, 0);
    rect(xPos, yPos, wide, length);
  }

  void updateSatellite() {
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

