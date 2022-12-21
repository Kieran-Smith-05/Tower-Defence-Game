//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a
//short period of time.

class AOE_ring {
  float x, y;
  
  
  AOE_ring(float _x, float _y) {
    x = _x;
    y = _y;
  }
  
  void show() {
    stroke(black);
    strokeWeight(3);
    fill(black);
    circle(x, y, 150);
  }
  
  void act() {
    int i = 0;
    while (i < mobs.size()) {
      Mob myMob = mobs.get(i);
      if (dist(myMob.x, myMob.y, x, y) < 75 + myMob.d/2) {
        myMob.hp--;
      }
      i++;
    }
  }
  
}
