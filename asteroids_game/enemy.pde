class enemy extends gameobject {
  PVector dir;
  int cooldown;
  
  enemy() {
    super(width/2, height/2, 0, 0);
    dir = new PVector(0.1,0);
    cooldown = 0;
  }
  
  
  // behaviour
  //void show() {
  //  pushMatrix();
  //  translate(width/2, height/2);
  //  stroke(#FA5B5B);
  //  strokeWeight(3);
  //  fill(0);
  //  ellipse(0,20, 130,60); // wings kind of
  //  line(-25,10, -58,7);
  //  line(-15,12, -55,35);
  //  line(0,20, 0,50);
  //  line(15,12, 55,35);
  //  line(25,10, 58,7);
  //  ellipse(0,0, 80,55); // head
  //  strokeWeight(5);
  //  line(-5,-10, -26,-15);
  //  line(5,-10, 26,-15);
  //  ellipse(-15,-8, 7,5);
  //  ellipse(15,-8, 7,5);
  //  ellipse(-15,-8, 7,5);
  //  ellipse(0,10, 35,15);
  //  noStroke();
  //  rect(-20,10, 40,10); // invisible square because i dont like arcs
  //  stroke(#FA5B5B);
  //  strokeWeight(3);
  //  rect(-20,-30, 40, -10);
  //  rect(-5,-40, 10,-40);
  //  popMatrix();
  //}
  void drawship() {
    
  }
  void act() {
    
  }
}
