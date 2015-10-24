public class ShootingStar {

  private int x, y;
  private float angle, speed;

  //for animation
  private PImage artwork[];
  private int frame = 0;
  private int switcher;

  public ShootingStar(PImage ref, int x, int y, float angle, float speed) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.speed = speed;
    this.artwork = new PImage[4];
    int sx = 814;
    for(int i = 0; i < 4; i++){
      artwork[i] = ref.get(sx, 704,114,110);
      sx = sx + 114;
    }
  }

  public void update() {
    double dy = speed * Math.sin(Math.toRadians(angle));
    double dx = speed * Math.sin(Math.toRadians(90 - angle));

    x += dx;
    y += dy;
  }

  public void draw() {
     image(artwork[frameCount % 100 < 50 ? 1 : 2],x, y, x + 109, y + 110);
  }
}

