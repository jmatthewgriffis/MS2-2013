class Message {

  int randomMessage;
  int count;
  int fade;
  PImage message;

  Message() {

    randomMessage = int(random(1, 13));
    count = 0;
    fade = (0);
    
    message = loadImage("Messages/message_" + str(randomMessage) + ".png");
  }


  void display() {

    tint(255,fade);

    image(message, 175, height-85);

    count++;
    if (fade < 255) {
      fade+=2;
    }

    else {
      fade = 255;
    }
  }
}

