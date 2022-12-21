//This function draws the INTRO screen.

void intro() {
  Wave = 1;
  backrooms.show();
  start.show();
  if (start.clicked) {
    mode = MAPSELECT;
  }
  textFont(blur);
  textAlign(CENTER, CENTER);
  textSize(75);
  text("BACKROOMS", 500, 200);
  text("DEFENCE", 500, 400);
}
