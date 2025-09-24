class mover {
  
  //instance variables
  float x, y;
  float r;
  
  //constructor
  mover() {
   
   x = width/2;
   y = height/2; 
  }
  
  //hehaviour functions
  void show() {
    stroke(0);
    fill(255);
    strokeWeight(5);
    r = random(50,100);
    circle(x,y,r);
  }
  void act() {
    x += random(-2,2);
    y += random(-2,2);
  }
}
