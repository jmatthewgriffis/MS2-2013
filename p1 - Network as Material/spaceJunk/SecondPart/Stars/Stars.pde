int starAmount = 100;

Star[] stars = new Star[starAmount];

void setup() {

  background(0);
  size(400, 400);

  for (int k=0; k<starAmount; k++) {
    stars[k] = new Star();
  }
}

void draw() {

  background(0);

  for (int k=0; k < starAmount; k++) {
    stars[k].display();
  }
}

