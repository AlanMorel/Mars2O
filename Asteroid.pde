public class Asteroid {

  public float x;
  public float y;
  
  public float angle;
  public float rotationAngle;
  
  public int hp;
  
  public float speed;
  private PImage artwork;

  public Asteroid(float x, float y, float angle, float speed, PImage artwork) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.rotationAngle = 0;
    this.hp = 2;
    this.speed = speed;
    this.artwork = artwork;
  }

  public void update() {
    double dy = speed * Math.sin(Math.toRadians(angle));
    double dx = speed * Math.sin(Math.toRadians(90 - angle));

    x += dx;
    y += dy;
    
    rotationAngle += speed;
  }

  public void draw() {
    pushMatrix();
    translate(x, y);
    imageMode(CENTER);
    rotate(radians(rotationAngle));
    fill(128);
    image(artwork, 0, 0);
    popMatrix();
    imageMode(CORNERS);
  }
}

