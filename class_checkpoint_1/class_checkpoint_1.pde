mover[] mymovers;
int n = 10;
float r, g, b;


void setup() {
  size(600,600);
  background(#A0775F);
  mymovers = new mover[n];
  for (int i = 0; i < n; i++) {
    r = random(0,255);
    g = random(0,255);
    b = random(0,255);
    mymovers[i] = new mover();
  }
  
}


void draw() {
  for (int o = 0; o < n; o++) {
    mymovers[o].act();
    mymovers[o].show();
  }
}
