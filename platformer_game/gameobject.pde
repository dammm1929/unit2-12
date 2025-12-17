class FGameObject extends FBox {
  
  final int L = -1; // left
  final int R = 1; // right
  
  FGameObject() {
    super(gridsize, gridsize);
  }
  
  FGameObject(float x, float y) {
    super(x, y);
  }
  
  void act() {
    
  }
  
  boolean istouching(String n) {
    ArrayList<FContact> contacts = getContacts();
    for (int i = 0; i < contacts.size(); i++) {
      FContact fc = contacts.get(i);
      if (fc.contains(n)) {
        return true;
      }
    }
    return false;
  }
  
  
  
  
}
