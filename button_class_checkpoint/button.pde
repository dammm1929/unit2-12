class button {
  int x, y, w, h;
  boolean clicked;
  color tactile, normal;
  String text;
  
  // constructor
  button(String t, int _x, int _y, int _w, int _h, color norm, color tact) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    tactile = tact;
    normal = norm;
    clicked = false;
  }
  
  // behaviour function
  void show() { // make the button show up and work
    rectMode(CENTER); // rect colour and stuff
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(tactile);
    } else {
      fill(normal);
    }
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 10);
    
    textAlign(CENTER, CENTER); // text colour and stuff
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(normal);
    } else {
      fill(tactile);
    }
    textSize(w/4);
    text(text, x, y);
    
    if (mouseReleased && mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      clicked = true;
    } else {
      clicked = false;
    }
  }
  
  void act() {
    
  }
}
