public class Bullet {
  
  private float x, y;
  private float speed;
  
  private PImage artwork;

  public Bullet(float x, float y) {
    this.x = x;
    this.y = y;
    this.speed = 6;
    this.artwork = loadImage("bullet.png");
  }

  public void update(){
    x += speed;
  }

  public void draw() {
    image(artwork, x, y);
  }
}

