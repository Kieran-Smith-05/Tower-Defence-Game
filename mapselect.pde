
int map;

void mapSelect () {
  background(black);
  handleButtonClicks();
}





void handleButtonClicks () {
  map1.show();
  if (map1.clicked) {
    mode = PLAY;
  }
  map2.show();
  if (map2.clicked) {
    mode = PLAY;
  }
  makeNodes();
}
