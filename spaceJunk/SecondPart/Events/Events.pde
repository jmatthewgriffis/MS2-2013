Event[] events = new Event[12];

void setup() {
  size(800, 600);

  for (int m=0; m<12; m++) {
    events[m] = new Event(m+1);
  }
}

void draw() {
  
    for (int m=0; m<12; m++) {
    float d=dist(events[m].x, events[m].y, rocket.xPos, rocket.yPos);
    if (d<((25+rocket.halfWidth)/2)) {

      events[m].collision = true;
    }

    events[m].display();
  }
  
}

