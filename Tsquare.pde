public class Tsquare{
  PImage text;
  int x, y;
  boolean displayed = false;
  
  public Tsquare(PImage ref, int x, int y){
    this.text = ref;
    this.x = x;
    this.y = y;
  }
  public void visible(){
    this.displayed = true;
  }
  public void display(){
    if(displayed){
      image(text, x, y);
    }
  }

}
