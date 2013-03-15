//this was added during class
class bullet{
  PVector pos;
  PVector vel;
    
  bullet(float _x, float _y, float _xsp, float _ysp){
    pos = new PVector(_x,_y);
    vel = new PVector(_xsp, _ysp);
  }
  
  void update(){
    pos.add(vel);
    
    //resource management (referenced in note at bottom of main class)
    if (pos.x < 0 || pos.x>width || pos.y<0 || pos.y>height){
      bullets.remove(this); //take this particular instance out of array list if the bullet goes off screen.
    }
    
  /*  //collision detection 
    if(!lvlmng.enemies.isEmpty()){
       for(int i=0; i<lvlmng.enemies.size(); i++){
         enemy temp = lvlmng.enemies.get(i);
         if(pos.dist(temp.pos)<80/2){
           temp.die=true;
           //lvlmng.enemies.remove(temp); //remove destroyed enemy. 
           bullets.remove(this); //remove bullet so it doesn't go though the object it kills 
         }
       }
    }*/
    
    pushMatrix();
    translate(pos.x, pos.y);   //sets the center of the spaceship at zero zero so bullets at zero zero will come out of spaceship
//    rotate(atan2(vel.y,vel.x)); //paramater y, x. This is to rotate the bullet based on the angle. 
    fill(255);
    rect(0,0,5,2);
    fill(255,0,0);
    rect(-2,0,2,2);
    popMatrix();
  }
}
  
  
