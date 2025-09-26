class gif {
  PImage[] gif;
  int frames, count;
  String b,a;
  gif(String before, int n, String after) {
    frames = n;
    gif = new PImage[frames];
    int i = 0;
    while (i < frames) {
      gif[i] = loadImage(before + i + after);
      i+=1;
    }
  }
  
  void show() {
    image(gif[count], 100,100, 600,300);
  }
  
  void act() {
    count+=1;
    if (count > frames-1) {
      count = 0;
    }
  }
}
