class gif {
  PImage[] frames;
  int numframes;
  //int speed;
  int currentframe;
  float x, y, w, h;
  String b,a;
  gif(String before, String after, int n, float _x, float _y, float _w, float _h) {
    frames = new PImage[n];
    numframes = n;
    //speed = s;
    currentframe = 0;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    int i = 0;
    while (i < numframes) {
      frames[i] = loadImage(before + i + after);
      i+=1;
    }
  }
  
  
  void show() {
    if (currentframe == numframes) currentframe = 0;
    image(frames[currentframe], x,y, w,h);
    if (frameCount % 4 == 0) currentframe+=1;
  }
  
}
