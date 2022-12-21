//This function draws the GAMEOVER screen.

void gameOver() {
  background(255);
  fill(white);
  textSize(200);
  text("GAMEOVER", 500, 400);
  text("NICE TRY", 500, 500);
  gameoverClicks();
}

void gameoverClicks() {
  gameoverButton.show();
  if(gameoverButton.clicked) {
    m = 0;
    mode = INTRO;
    lives = 3;
    Wave = 0;
    Money = 400;
    
    int i = 0;
    while(i < mobs.size()) {
      mobs.remove(i);
      i++;
    }
    i = 0;
    while(i < bullets.size()) {
      bullets.remove(i);
      i++;
    }
    while(i < towers.size()) {
      towers.remove(i);
      i++;
    }  
  }
}
