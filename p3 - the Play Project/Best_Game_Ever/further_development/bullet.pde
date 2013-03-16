//this was added during class
class bullet {
  PVector pos;
  PVector vel;

  bullet(float _x, float _y, float _xsp, float _ysp) {
    pos = new PVector(_x, _y);
    vel = new PVector(_xsp, _ysp);
  }

  void update() {
    pos.add(vel);

    //resource management
    if (pos.x < 0 || pos.x>width || pos.y<0 || pos.y>height) {
      bullets.remove(this); //take this particular instance out of array list if the bullet goes off screen.
    }

    //collision detection 
    if (pos.dist(enemy1.loc)<enemy1.size) {
      bullets.remove(this); //remove bullet so it doesn't go though the object it kills
      enemy1.health=enemy1.health-5;
    }



    pushMatrix();
    translate(pos.x, pos.y);   //sets the center of the spaceship at zero zero so bullets at zero zero will come out of spaceship
    rotate(atan2(vel.y,vel.x)); //paramater y, x. This is to rotate the bullet based on the angle. 
    fill(255);
    rect(0, 0, 5, 2);
    fill(255, 0, 0);
    rect(-2, 0, 2, 2);
    popMatrix();
  }
}

