public class Background {

  private PImage [ ]background;
  private float x;
  private boolean move = false;

  public Background(boolean move) {
    this.move = move;
    background = new PImage[2];
    background[0] = loadImage("mainmenu_background.png");
    background[1] = loadImage("mainmenu_background_2.png");
    x = 0;
  }

  public void update() {
    x = x < -width ? 0 : x - 4;
  }
  
  public void setMove(){
    move = true;
  }

  public void draw() {
    image(background[frameCount%100 < 50 ? 0:1], 0, 0);
    if(move){
    image(background[frameCount%100 < 50 ? 0:1], x, 0);
    image(background[frameCount%100 < 50 ? 0:1], x + width, 0);
    }
  }
}

