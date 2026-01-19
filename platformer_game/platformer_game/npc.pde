class FNPC extends FGameObject {
  int talktimer = 0;
  int infotimer = 0;
  float blackbar1 = -630;
  float blackbar2 = -630;
  float blackbar3 = -630;
  float blackbar4 = -630;
  float blackbar5 = -630;
  int frame = 0;
  
  FBox npcbox;
  FNPC(float x, float y) {
    super(50,50);
    setPosition(x, y);
    setNoStroke();
    setStrokeWeight(3);
    setNoFill();
    setName("npc");
    setRotatable(false);
    setGrabbable(false);
    setStatic(true);
    setSensor(true);
    npcbox = new FBox(50,50);
    npcbox.setSensor(true);
    world.add(npcbox);
    
  }
  
  void act() {
    if (dialogue == true) {
      strokeWeight(10);
      stroke(255);
      fill(0);
      

      
      rect(width/2,height/2-300,700,300);
      fill(255);
      textSize(30);
      text("yo whats up can you help me find something", width/2-300, height/2-400);
      
      text("i lost my dog somewhere around here", width/2-300, height/2-340);
      
      text("could you find him for me", width/2-300, height/2-283);
      
      text("his name is chogglidippy", width/2-300, height/2-225);
      
      text("thanks pal", width/2-300, height/2-170);
      
      fill(0);
      stroke(0);
      rectMode(CORNER);
      
      if (talktimer <= 700) talktimer += 1;
      if (talktimer >= 0 && talktimer <= 65) {
        blackbar1 += 10;
      }
      if (talktimer >= 115 && talktimer <= 180) {
        blackbar2 += 10;
      }
      if (talktimer >= 245 && talktimer <= 310) {
        blackbar3 += 10;
      }
      if (talktimer >= 360 && talktimer <= 425) {
        blackbar4 += 10;
      }
      if (talktimer >= 490 && talktimer <= 555) {
        blackbar5 += 10;
      }
      
      textSize(80);
      if (talktimer >= 600 && talktimer <= 701) text("(chogglidippy does not exist)", width/2-350, height/2+300);
   
      if (talktimer >= 700) {
        dialogue = false;
      }
      
      rect(width/2+300, height/2-420, blackbar1, 50);
      rect(width/2+300, height/2-360, blackbar2, 50);
      rect(width/2+300, height/2-303, blackbar3, 50);
      rect(width/2+300, height/2-245, blackbar4, 50);
      rect(width/2+300, height/2-190, blackbar5, 30);
      
    }
    

    npcsprite();

    
  }
  
  
  void npcsprite() {
    npcbox.setPosition(getX(), getY()+4);
    npcbox.setVelocity(this.getVelocityX(), this.getVelocityY());
    npcbox.setFillColor(#0BE326);
    npcbox.setStroke(255);

    if (dialogue) {
      frame += 1;
      if (frame >= 20) frame = 0;
      
      if (frame < 10 && frame >= 0) {
        npcbox.attachImage(npc[0]);
      }
      if (frame >= 10 && frame < 20) {
        npcbox.attachImage(npc[1]);
      }
    } else if (dialogue == false) {
      npcbox.attachImage(npc[0]);
      
    }

  }
}
