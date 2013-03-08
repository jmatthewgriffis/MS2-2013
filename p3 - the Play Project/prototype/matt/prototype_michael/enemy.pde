class enemy {
  PVector loc;
  PVector vel; 
  float size; 
  float d1, d2, d3, d4;

  enemy(PVector _loc, PVector _v, float _s) {
    loc= _loc;
    vel = _v;
    size = _s;
  }

  void update() {
    fill(155);
    ellipse(loc.x, loc.y, size, size); 

    //Find closest enemy. 
    d1 = loc.dist(player1.circPos);
    d2 = loc.dist(player2.circPos);
    d3 = loc.dist(player3.circPos);
    d4 = loc.dist(player4.circPos);

    if (d1 < d2 && d1 < d3 && d1<d4) {
      loc.x=lerp(loc.x, player1.circPos.x, 0.02);    
      loc.y=lerp(loc.y, player1.circPos.y, 0.02);
    }
    if (d2 < d1 && d2 < d3 && d2<d4) {
      loc.x=lerp(loc.x, player2.circPos.x, 0.02);    
      loc.y=lerp(loc.y, player2.circPos.y, 0.02);
    } 
    if (d3 < d1 && d3 < d2 && d3<d4) {
      loc.x=lerp(loc.x, player3.circPos.x, 0.02);    
      loc.y=lerp(loc.y, player3.circPos.y, 0.02);
    }
    if (d4 < d1 && d4 < d2 && d4<d3) {
      loc.x=lerp(loc.x, player4.circPos.x, 0.02);    
      loc.y=lerp(loc.y, player4.circPos.y, 0.02);
    }

    //bounce off walls
    if (loc.x>1024) vel.x=vel.x*-1;
    if (loc.x<0) vel.x=vel.x*-1;
    if (loc.y>768) vel.y=vel.y*-1;
    if (loc.y<0) vel.y=vel.y*-1;


    loc.add(vel);
  }
}

