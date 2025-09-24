boolean mouseReleased;
boolean waspressed;

button[] mybuttons;

void setup() {
  size(600,600);
  mybuttons = new button[4];
  mybuttons[0] = new button("text", 100,100,100,50, #E87E7E, #743F3F);
  mybuttons[1] = new button("text", 300,100,150,70, #E721E8, #983398);
  mybuttons[2] = new button("text", 100,300,130,90, #31DB65, #349D54);
  mybuttons[3] = new button("text", 300,500,180,70, #FFAC12, #CB9733);
}


void draw() {
  click();
  mybuttons[0].show();
  mybuttons[1].show();
  mybuttons[2].show();
  mybuttons[3].show();
  if (mybuttons[0].clicked) {
    background(#E87E7E);
  }
  if (mybuttons[1].clicked) {
    background(#E721E8);
  }
  if (mybuttons[2].clicked) {
    background(#31DB65);
  }
  if (mybuttons[3].clicked) {
    background(#FFAC12);
  }
  
}
