class gif {
  PImage[] frames;
  int numframes;
  int currentframe;
  float x, y, w, h;
  String b,a;
  gif(String before, String after, int n, float _x, float _y, float _w, float _h) {
    frames = new PImage[n];
    numframes = n;
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
    if (currentframe == numframes) {
      currentframe = 0;
      playgif = false;
    }
    image(frames[currentframe], x,y, w,h);
    currentframe+=1;
   
  }

}
