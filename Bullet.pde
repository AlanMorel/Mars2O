public class Bullet {

  private float x, y;
  private float speed;
  private int frame = 0;
  private int sizeW, sizeH;
  private PImage [] artwork;

  public Bullet(PImage [] ref, float x, float y) {
    this.x = x + 60;
    this.y = y + 65;
    this.speed = 6;
    this.artwork = new PImage[4];
    arrayCopy(ref, artwork);
    this.sizeW = artwork[0].width /2;
    this.sizeH = artwork[0].height / 2;
  }

  public void update() {
    x += speed;
  }

  public void draw() {
    if (frame < 4){
      image(artwork[frame], x, y, sizeW + x, sizeH + y);
      frame++;
    }
    else{
      image(artwork[3], x, y, sizeW + x, sizeH + y);
    }
  }
}

