class Event {
  
  int x;
  int y;
  boolean collision;
  PImage message;
  int whichMessage;
  int timer; 
 
 Event(int _whichMessage) {
   x = int(random(0,width));
   y = int(random(0,height-85));
   collision = false;
   whichMessage = _whichMessage;
   
   message = loadImage("Messages/message_" + str(whichMessage) + ".png");
 }
 
 void display(){
  
  if (collision == false) {
    fill(255,0,0);
    ellipse(x,y,25,25);
  }
  
  else if (collision == true) {
    fill(0,0,255);
    ellipse(x,y,25,25);
    if (timer < 400) {
    image(message, 175, height-85);
    }
    println(whichMessage + " | " + timer);
    timer++;
  }
 }
 
 
  
}
