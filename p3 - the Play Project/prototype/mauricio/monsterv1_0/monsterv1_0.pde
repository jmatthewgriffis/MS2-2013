monster square;

void setup(){
  size(1024, 768);
  smooth();
  noFill();
  frameRate(60);
  
  square = new monster();
  
  square.begin();
  
  
}

void draw() {
  background(255);
  
  square.display();
  square.update();
  
}

