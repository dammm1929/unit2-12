void click() {
 mouseReleased = false;
 if (mousePressed) waspressed = true;
 if (waspressed && !mousePressed) {
   mouseReleased = true;
   waspressed = false;
 }
}
