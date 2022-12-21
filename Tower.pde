//A Tower is the player's main defense against the mobs.
//Towers are placed on the maps and then automatically
//act. There are 3 kinds of towers (but you can make more!)

//Gun Tower: These towers shoot bullets that fly across
//           the screen and do damage to mobs.

//AoE Tower: These towers place AoE_Rings that deal damage
//           to all mobs in the ring.

//Sniper Tower: These towers automatically target the first
//              mob no matter where they are on the scren.

class Tower {

  final int PLACING = 0;
  final int PLACED = 1;

  float x, y, d;
  int cooldown, threshold;
  int towerMode;
  int towerType;
  boolean touch;


  Tower(float _x, float _y, int c, int th, int _towerType) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    towerMode = PLACING;
    towerType = _towerType;
  }
  void show() {
    if (towerType == GUN) {
      showGunTower();
    } else if (towerType == AOE) {
      showAOETower();
    } else if (towerType == SNIPER) {
      showSniperTower();
    }
  }

  void act() {
    if (towerType == GUN) {
      actGunTower();
    } else if (towerType == AOE) {
      actAOETower();
    } else if (towerType == SNIPER) {
      actSniperTower();
    }
  }

  void showGunTower() {
    stroke(black);
    strokeWeight(4);
    fill(blue);
    square(x, y, 40);
    if (towerMode == PLACED) {
      square(x, y, 40);
    } else if (towerMode == PLACING && Money > 5) {
      square(mouseX, mouseY, 45);
      if (mousePressed && mouseX > 0 && mouseX < 800 && touch == false) {
        towerMode = PLACED;
        building = false;
        Money = Money - 25;
        x = mouseX;
        y = mouseY;
      }
    }
  }

  void actGunTower() {
    cooldown ++;
    if (cooldown >= threshold && mobs.size() > 0) {
      cooldown = 0;
      bullets.add(new Bullet(x, y, 0, -10)); //Up
      bullets.add(new Bullet(x, y, 0, 10));  //Down
      bullets.add(new Bullet(x, y, -10, 0)); //Left
      bullets.add(new Bullet(x, y, 10, 0));  //Right
    }
  }

  void showAOETower() {
    stroke(black);
    strokeWeight(3);
    fill(blue);
    circle(x, y, 40);
    if (towerMode == PLACED) {
      circle(x, y, 40);
    } else if (towerMode == PLACING && Money > 25) {
      square(mouseX, mouseY, 45);
      if (mousePressed && mouseX > 0 && mouseX < 800 && touch == false) {
        towerMode = PLACED;
        building = false;
        Money = Money - 50;
        x = mouseX;
        y = mouseY;
      }
    }
  }

  void actAOETower() {
    cooldown++;
    if (cooldown >= threshold && mobs.size() > 0) {
      aoe.x = x;
      aoe.y = y;
      aoe.act();
      aoe.show();
    }
    if (cooldown > 60) {
      cooldown = 0;
    }
  }

  void showSniperTower() {
    stroke(black);
    strokeWeight(4);
    fill(blue);
    if (towerMode == PLACED) {
      triangle(x, y-10, x+10, y+40, x+40, y);
    } else if (towerMode == PLACING) {
      triangle(mouseX, mouseY-10, mouseX+10, mouseY+40, mouseX+40, mouseY);
      if (mousePressed && mouseX > 0 && mouseX < 800 && touch == false) {
        towerMode = PLACED;
        building = false;
        x = mouseX;
        y = mouseY;
        Money = Money - 150;
      }
    }
  }
  void actSniperTower() {
    cooldown++;
    if (cooldown >= threshold && mobs.size() > 0) {
      Mob myMob = mobs.get(0);
      myMob.hp = myMob.hp - 0.05;
      stroke(red);
      strokeWeight(7);
      line(myMob.x, myMob.y, x, y+35);
    }
    if (cooldown > 80) {
      cooldown = 0;
    }
  }
}
