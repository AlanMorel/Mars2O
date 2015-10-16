public class Spaceship {

  public float x, y;
  private float speed;

  public PImage spaceship;
  private Fuel fuel;

  private ArrayList<Bullet> bullets;

  public Spaceship(float x, float y) {
    this.x = x;
    this.y = y;
    this.speed = 4;
    this.spaceship = loadImage("spaceship.png");
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
    if (y > height - spaceship.height) {
      y = height - spaceship.height;
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
    if (x > spaceship.width) {
      x = spaceship.width;
    }
  }

  public void draw() {
    text("Bullets on the screen: " + bullets.size(), 1000, 125);
    image(spaceship, x, y);
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

