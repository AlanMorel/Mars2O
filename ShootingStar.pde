public class ShootingStar {

  private float x;
  private float y;
  
  private float angle;
  
  private float speed;
  private PImage artwork;

  public ShootingStar(float x, float y, float angle, float speed) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.speed = speed;
    this.artwork = loadImage("shootingstar.png");
  }

  public void update() {
    double dy = speed * Math.sin(Math.toRadians(angle));
    double dx = speed * Math.sin(Math.toRadians(90 - angle));

    x += dx;
    y += dy;
  }

  public void draw() {
    image(artwork, x, y);
  }
}

