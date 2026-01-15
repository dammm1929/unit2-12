class FNPC extends FGameObject {
  FNPC(float x, float y) {
    super(50,50);
    setPosition(x, y);
    setNoStroke();
    setStrokeWeight(3);
    setFillColor(#004080);
    setName("npc");
    setRotatable(false);
    setGrabbable(false);
    setStatic(true);
    setSensor(true);
    
    
  }
  
  void act() {
    
    
    
  }
  
  
  
}
