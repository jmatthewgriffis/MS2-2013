Message[] message = new Message[9999];
int nextMessage;
int timer;

void setup() {

  size(800, 800);
  background(20, 20, 35);

  timer = 0;

  for (int j=0; j<9999; j++) {
    message[j] = new Message();
  }
 
}

void draw() {

  background(20, 20, 35);

  if (timer % 10000 <= 50) {
    nextMessage++;
  }

  message[nextMessage].display();


  timer = millis();
}

