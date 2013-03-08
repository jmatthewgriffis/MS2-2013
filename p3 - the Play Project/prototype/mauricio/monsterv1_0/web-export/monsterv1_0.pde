monster square;

void setup(){
  size(1024, 768);
  smooth();
  noFill();
  frameRate();
  
  square = new monster();
  
  square.begin();
  
  
}

void draw() {
  background(255);
  
  square.display();
  square.update();
  
}

class monster{
  
   PVector Pos, mousePos;

  float rot = 0;
  float rto = 0;
  float speed = 1;
  
  void begin(){
    
      Pos = new PVector(width/2, height/2);
      mousePos = new PVector(mouseX,mouseY);
  
 }
 
  void display(){
    
  translate(Pos.x,Pos.y);
  rotate(rot);
  rectMode(CENTER);
  rect(0,0,40,40);
  
  }

  void update(){
    
    if(mouseX <= Pos.x) rto = 180;
    else rto = 0;
    
    //some rotational math
    rot = atan((Pos.y-mouseY)/(Pos.x-mouseX))+radians(rto);
    //This makes our monster move towards the mouse - player
    Pos.x += speed*cos(rot);
    Pos.y += speed*sin(rot);
    speed += 0.01;
  }
}


