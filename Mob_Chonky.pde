class ChonkyMob extends Mob {
  
  ChonkyMob (float _x, float _y, float _vx, float _vy) {
    super(_x, _y, _vx, _vy);
    maxhp = 2 + Wave;
    d = 80;
    hp = 2 + Wave;
    fillcolor = white;
    strokecolor = blue;
    speed = 0.5;
  }
}
