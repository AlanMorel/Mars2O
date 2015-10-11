public class Asteroid {

  public float x, y;
  public float angle, speed;
  public float rotationAngle, rotationSpeed;
  public int hp, size;
  private PImage artwork;

  public Asteroid(float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.rotationAngle = 0;
    setSize();
  }

  public void update() {
    double dy = speed * Math.sin(Math.toRadians(angle));
    double dx = speed * Math.sin(Math.toRadians(90 - angle));

    x += dx;
    y += dy;

    rotationAngle += rotationSpeed;
  }

  private void setSize() {
    float rand = random(0, 100);
    if (rand < 85) {
      setSmall();
    } else if (rand < 99) {
      setMedium();
    } else {
      setLarge();
    }
  }

  public void setSmall() {
    artwork = loadImage("asteroid_small.png");
    speed = random(3, 5);
    rotationSpeed = random(1, 5);
    hp = 1;
    size = 0;
  }

  public void setMedium() {
    artwork = loadImage("asteroid_medium.png");
    speed = random(2, 3);
    rotationSpeed = random(1, 3);
    hp = 2;
    size = 1;
  }

  public void setLarge() {
    artwork = loadImage("asteroid_large.png");
    speed = random(1, 2);
    rotationSpeed = random(0, 1);
    hp = 3;
    size = 2;
  }

  public boolean isSmall(){
    return size == 0;
  }
  
  public boolean isMedium(){
    return size == 1;
  }

  public boolean isLarge(){
    return size == 2;
  }
  
  public boolean isDestroyed(){
    return --hp <= 0;
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

