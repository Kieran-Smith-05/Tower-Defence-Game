//This function draws the BUILD screen
void build() {
  if (map1.clicked) {
    drawMap();
  }
  if (map2.clicked) {
    drawMap2();
  }
  animateThings();
  buyGunTower.show();
  buyAOETower.show();
  buySniperTower.show();
  drawPlayInterface();
  buildInterface();
  flashingSign();
  handleBuildClicks();
}

void flashingSign() {
  count++;
  if (count < 20) shadowText("BUILD MODE", width/2-100, 100, 50, red, black);
  if (count == 40) count = 0;
}


void buildInterface() {
  stroke(white);
  fill(black);
  rect(900, height/2, 200, height);
  textSize(50);
  text("$" + Money, 125, 50);
  playMode.show();
  buyGunTower.show();
  buyGunTower.show();
  buyAOETower.show();
  buySniperTower.show();
}

void handleBuildClicks() {
  if (playMode.clicked) {
    mode = PLAY;
  }
  if (buyGunTower.clicked && Money >= 25 && building == false) {
    building = true;
    towers.add(new Tower(0, 0, 0, 30, GUN));
  }
  if (buySniperTower.clicked && Money >= 150 && building == false) {
    building = true;
    towers.add(new Tower(0, 0, 0, 30, SNIPER));
  }
  if (buyAOETower.clicked && Money >= 50 && building == false) {
    building = true;
    towers.add(new Tower(0, 0, 0, 30, AOE));
  }
}
