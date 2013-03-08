class monster{
  
   PVector Pos, mousePos;

  float rot = 0;
  float rto = 0;
  float speed = 2;
  float xSize = random(60,100);
  float ySize = xSize;
  
  void begin(){
    
      Pos = new PVector(width/2, height/2);
      mousePos = new PVector(mouseX,mouseY);
  
 }
 
  void display(){
    
  translate(Pos.x,Pos.y);
  rotate(rot);
  rectMode(CENTER);
  rect(0,0,xSize,ySize);
  
  }

  void update(){
    
    if(mouseX <= Pos.x) rto = 180;
    else rto = 0;
    
    //some rotational math
    rot = atan((Pos.y-mouseY)/(Pos.x-mouseX))+radians(rto);
    //This makes our monster move towards the mouse - player
    Pos.x += speed*cos(rot);
    Pos.y += speed*sin(rot);
    
  }
}

