public class Spaceship {

  public float x, y;
  private int speed;
  private int sizeW = 240; 
  private int sizeH = 115;

  public PImage spaceship;
  private Fuel fuel;

  private ArrayList<Bullet> bullets;

  public Spaceship(PImage ref, float x, float y) {
    this.x = x;
    this.y = y;
    this.speed = 4;
    this.spaceship = ref;
    this.fuel = new Fuel();
    this.bullets = new ArrayList<Bullet>();
  }

  public void update() {
    for (Bullet bullet : bullets) {
      bullet.update();
    }
    fuel.update();
    if (keys[LEFT] || keys['a']) { 
      moveLeft();
    }
    if (keys[RIGHT] || keys['d']) { 
      moveRight();
    }
    if (keys[UP] || keys['w']) { 
      moveUp();
    }
    if (keys[DOWN] || keys['s']) { 
      moveDown();
    }
  }

  public void moveUp() {
    y -= speed;
    if (y < 0) {
      y = 0;
    }
  }

  public void moveDown() {
    y += speed;
    if (y > height - sizeH) {
      y = height - sizeH;
    }
  }

  public void moveLeft() {
    x -= speed;
    if (x < 0) {
      x = 0;
    }
  }

  public void moveRight() {
    x += speed;
    if (x > sizeW) {
      x = sizeW;
    }
  }

  public void draw() {
    text("Bullets on the screen: " + bullets.size(), 1000, 125);
    pushMatrix();
    translate(x,y);
    copy(spaceship,1162, 1372, 460, 147, 0, 0, 240, 115);
    popMatrix();
    for (Bullet bullet : bullets) {
      bullet.draw();
    }
    fuel.draw();
  }

  public void mousePressed() {
    Bullet bullet = new Bullet(x + 252, y + 57);
    bullets.add(bullet);
  }
}

