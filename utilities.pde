void click() {
  mouseReleased = false;
  if (mousePressed) wasPressed = true;
  if (wasPressed && mousePressed == false) {
    mouseReleased = true;
    wasPressed = false;
  }
}

void shadowText (String text, float x, float y, float size, color shadowColor, color textColor) {
  textSize(size);
  fill(shadowColor);
  text(text, x-5, y-5);
  fill(textColor);
  text(text, x, y);
}
