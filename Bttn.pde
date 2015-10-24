class Bttn{
  PImage [] graphic; 
  int displayX, dw, dh, x, y;
  boolean overFlag = false;
  boolean pressed = false;
  
  
  Bttn(PImage ref, int sx, int sy, int sw, int sh, int x, int y,  int dw, int dh, int offset){
    this.graphic = new PImage[2];
    for(int i = 0; i < 2; i++){
      graphic[i] = ref.get(sx, sy, sw, sh);
      sx = sx + offset;
    }
    this.dw = dw;
    this.dh = dh;
    this.x = x;
    this.y = y;
  }
  
  void over(int x, int y){
    if(mouseX >= x && mouseX <= x+dw && mouseY >= y && mouseY <= y + dh){
        overFlag = true;
    }
    else{
      overFlag = false;
    }
  }
  
  void update(){
    over(x, y);
    if (overFlag){
       displayX = 1;
    }
    else{
        displayX = 0;
    }
  }
  
  void display(){
    update();
    image(graphic[displayX],x, y, x+dw, y+dh);
  }
  
  boolean clicked(){
    over(x,y);
    if(overFlag && mousePressed){
      return true;
    }
    else{
      return false;
    }
    
  }
}
