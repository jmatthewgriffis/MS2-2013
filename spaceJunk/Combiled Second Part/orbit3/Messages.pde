class Message {

  PFont f;
  String[] message;
  int randomMessage;
  int count;
  int fade;

  Message() {
    message = new String[6];
    f = createFont("Arial", 20, true);
    message[0] = "Two satellites have collided!";
    message[1] = "Space junk has destroyed a shuttle!";
    message[2] = "A bit of metal has destroyed communication!";
    message[3] = "A satellite has crashed down to Earth!";
    message[4] = "Commercial space flight grounded by debris!";
    message[5] = "Debris in space causes NASA mission to fail!";

    randomMessage = int(random(0, 6));
    count = 0;
    fade = (0);
  }


  void display() {

    fill(fade);

    switch (randomMessage) {

    case 0:
      text(message[0], 20, height-50);
      break;

    case 1:
      text(message[1], 20, height-50);
      break;

    case 2:
      text(message[1], 20, height-50);
      break;

    case 3:
      text(message[3], 20, height-50);
      break;

    case 4:
      text(message[4], 20, height-50);
      break;

    case 5:
      text(message[5], 20, height-50);
      break;
    }

    count++;
    if (fade < 240) {
      fade+=2;
    }

    else {
      fade = 240;
    }
  }
}

