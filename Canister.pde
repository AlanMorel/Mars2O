public class Canister {

  public float x, y;

  public float angle, speed;

  public float rotationAngle;
  public float rotationSpeed;

  private PImage artwork;
  public int sizeW = 124;
  public int sizeH = 125;
  
  public Canister(PImage ref, float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.rotationAngle = 0;
    this.artwork = ref;
    this.speed = random(2, 4);
    this.rotationSpeed = random(1, 3);
  }

  public void update() {
    double dy = speed * Math.sin(Math.toRadians(angle));
    double dx = speed * Math.sin(Math.toRadians(90 - angle));

    x += dx;
    y += dy;

    rotationAngle += rotationSpeed;
  }

  public void draw() {
    pushMatrix();
    translate(x, y);
    imageMode(CENTER);
    rotate(radians(rotationAngle));
    fill(128);
    copy(artwork,105, 1049, 124, 125,0,0,sizeW, sizeH);
//    image(artwork, 0, 0);
    popMatrix();
    imageMode(CORNERS);
  }
}

