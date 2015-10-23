class Bttn{
  PImage graphic; 
  int displayX, ogX, offsetX, sy, sw, sh, dw, dh, x, y;
  boolean overFlag = false;
  boolean pressed = false;
  
  
  Bttn(PImage ref, int ogX, int sy, int sw, int sh, int x, int y,  int dw, int dh, int offset){
    this.graphic = ref;
    this.ogX = ogX;
    this.sy = sy;
    this.sw = sw;
    this.sh = sh;
    this.dw = dw;
    this.dh = dh;
    this.x = x;
    this.y = y;
    this.offsetX = ogX + offset;
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
       displayX = offsetX;
    }
    else{
        displayX = ogX;
    }
  }
  
  void display(){
    update();
    copy(graphic, displayX, sy, sw, sh, x, y, dw, dh);
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
