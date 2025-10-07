class button {
  int x, y, w, h;
  boolean clicked;
  color tactile, normal;
  String text;
  boolean touchingmouse;
  
  
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
    drawRect();
    //drawLabel();
    checkForClick();
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      touchingmouse = true;
    } else {
      touchingmouse = false;
    }
  }
  
  void drawRect() {
    rectMode(CENTER); // rect colour and stuff
    if (touchingmouse) {
      fill(tactile);
    } else {
      fill(normal);
    }
    stroke(255);
    strokeWeight(4);
    rect(x, y, w, h, 10);
    textFont(retro);
    fill(255);
    textSize(w/3);
    textAlign(CENTER, CENTER);
    text(text, x, y);
  }
  
  //void drawLabel() {
  //  textAlign(CENTER, CENTER); // text colour and stuff
  //  if (touchingmouse) {
  //    fill(normal);
  //  } else {
  //    fill(tactile);
  //  }
  //  textSize(w/4);
  //  text(text, x, y);
  //}
  
  void checkForClick() {
    if (mouseReleased && touchingmouse) {
      clicked = true;
    } else {
      clicked = false;
    }
  }
}
