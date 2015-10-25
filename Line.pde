public class Line{
  ArrayList <Tsquare> chars; 
  int x, y;
  int all = 0;
  int spacer = 0;
  int i = 0;
  boolean visible = false;
  public Line(PImage ref, int sx, int sy, int x, int y, int maxFrame){
    this.x = x;
    this.y = y;
    chars = new ArrayList<Tsquare>();
    int startx = sx;
    int displayx = x;
    for(int j = 0; j < maxFrame; j++){
      PImage passer = ref.get(startx, sy, 53, 53);
      Tsquare frame = new Tsquare(passer, displayx, y);
      startx = startx + 53;
      displayx = displayx + 53;
      chars.add(frame);
    }
  }
  
  public void visible(){
    visible = true;
  }
  
  public boolean done(){
    if(i != chars.size()-1){
      return false;
    }
    else{
      return true;    
    }
  }
  
  public void display(){
    if (visible){
      if(frameCount%4 == 0){
        spacer = 1;
      }
      if(i < chars.size()){
        chars.get(i).visible();
        for(Tsquare frame : chars){
          frame.display();
        }
          if(spacer == 1){
            i++;
            spacer = 0;
          }
      }
      else{
         for(Tsquare frame : chars){
          frame.display();
        }
      }
    }
  }
}
