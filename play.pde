//This function draws the PLAY screen

int Wave = 1;
int Money = 400;
int lives = 5;
int i;
int count = 0;
int m = 0;
boolean enemy;


void play() {
  if (map1.clicked) {
    drawMap();
  }
  if (map2.clicked) {
    drawMap2();
  }
  animateThings();
  drawPlayInterface();
  handleButtonClick();




  if (lives == 0) {
    mode = GAMEOVER;
  }
}



void drawMap() {
  if (map1.clicked) {
    //background
    fill(dGreen);
    rect(500, 400, width, height);

    //path
    stroke(floor);
    strokeWeight(30);
    line( 0, 100, 200, 100);
    line( 200, 100, 200, 600);
    line( 200, 600, 400, 600);
    line( 400, 600, 400, 500);
    line( 400, 500, 300, 500);
    line( 300, 500, 300, 700);
    line( 300, 700, 500, 700);
    line( 500, 700, 500, 300);
    line( 500, 300, 700, 300);
    line( 700, 300, 700, 700);
    line( 700, 700, 800, 700);
    line( 800, 700, 1000, 700);
    strokeWeight(1);
  }

  //i = 0;
  //while (i < 10) {
  //  nodes[i].show();
  //  i++;
  }
//}

void drawMap2() {
  if (map2.clicked) {
    fill(dGreen);
    rect(500, 400, width, height);

    stroke(floor);
    strokeWeight(30);
    line( 0, 100, 300, 100);
    line( 300, 100, 300, 500);
    line(300, 500, 500, 500 );
    line( 500, 500, 500, 200);
    line(500, 200, 1000, 200);
    strokeWeight(1);
  }

  //i = 0;
  //while (i < 5) {
  //  nodes[i].show();
  //  i++;
  }
//}


void drawPlayInterface() {
  stroke(white);
  fill(black);
  rect(900, height/2, 200, height);

  fill(white);
  textSize(15);
  text("NEXT WAVE:"+Wave, 900, 20);
  text("LIVES:" + lives, 350, 50);
  text("$" + Money, 125, 50);
  build.show();
}

void animateThings() {
  int i = 0;
  while ( i < mobs.size()) {
    Mob myMob = mobs.get(i);
    myMob.act();
    myMob.show();
    if (myMob.hp <= 0) {
      mobs.remove(i);
      Money = Money + 11;
    } else {
      i++;
    }
  }

  i = 0;
  while (i < towers.size()) {
    Tower myTower = towers.get(i);
    println(myTower.cooldown);
    if (mobs.size() > 0) myTower.act();
    myTower.show();
    i++;
  }

  i = 0;
  while (i < bullets.size()) {
    Bullet myBullet = bullets.get(i);
    myBullet.act();
    myBullet.show();
    if (myBullet.hp <= 0) {
      bullets.remove(i);
    } else {
      i++;
    }
  }
  if (build.clicked && mobs.size() == 0) {
    mode = BUILD;
  }
}


void handleButtonClick() {
  nextWave.show();
  Wavestuff();
  if (build.clicked && bullets.size() == 0 && mobs.size() == 0) {
    mode = BUILD;
  }
}



void Wavestuff () {
  if (mobs.size() == 0) {
    enemy = false;
    i = 0;
    if (nextWave.clicked && mobs.size() == 0) {
      enemy = true;
      m++;
      Wave++;
    }
    while ( enemy == true && i < m ) {
      mobs.add(new Mob( 0-50*i, 100, +1, 0));
      i++;
    }
    if (nextWave.clicked && Wave % 4 == 0) {
      i = 0;
      while (i < Wave/5) {
        mobs.add(new ChonkyMob( 0-50*i, 100, +1, 0));
        i++;
      }
    }
    if (nextWave.clicked && Wave % 5 == 0) {
      i = 0;
      while (i < Wave/5) {
        mobs.add(new SpeedMob( 0-100*i, 100, +5, 0));
        i++;
      }
    }
  }
}
