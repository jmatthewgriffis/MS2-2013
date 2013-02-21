class Event {
  
  int x;
  int y;
  boolean collision;
  PImage message;
  int whichMessage;
  int timer;
  
  PImage eventOff;
  PImage eventOn;
 
 Event(int _whichMessage) {
   x = int(random(0,width));
   y = int(random(0,height-85));
   collision = false;
   whichMessage = _whichMessage;
   
   message = loadImage("Messages/message_" + str(whichMessage) + ".png");
   eventOff = loadImage("eventOff.png");
   eventOn = loadImage("eventOn.png");
 }
 
 void display(){
  
  if (collision == false) {
    imageMode(CENTER);
    image(eventOff,x,y);
    imageMode(CORNER);
  }
  
  else if (collision == true) {
    imageMode(CENTER);
    image(eventOn,x,y);
    imageMode(CORNER);
    if (timer < 320) {
    image(message, 175, height-85);
    }
    println(whichMessage + " | " + timer);
    timer++;
  }
 }
 
 
  
}
