class Star {
 
  int x;
  int y;
  color brightness;
  
 Star() {
   x = int(random(width));
   y = int(random(height));
   int r = int(random(220,240));
   int g = int(random(220,240));
   int b = int(random(200,220));
   brightness = color(r, g, b);
   
   strokeWeight(2);
 }
 
 void display() {
   int twinkle = int(random(-5,5));
   brightness+=twinkle;
   
   stroke(brightness);
   point(x,y);
 }
  
}
