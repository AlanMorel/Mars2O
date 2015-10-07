public class Spaceship {

  private float x;
  private float y;
  private float speed;

  private PImage spaceship;
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

  public void checkCollisions(Asteroids asteroids) {
    checkPlayerAsteroidCollisions(asteroids);
    checkBulletAsteroidCollisions(asteroids);
  }

  public void checkPlayerAsteroidCollisions(Asteroids asteroids) {
    for (Iterator<Asteroid> iterator = asteroids.asteroids.iterator (); iterator.hasNext(); ) {
      Asteroid asteroid = iterator.next();
      if (rectangleCollided(x, y, spaceship.width - 50, spaceship.height, asteroid.x - asteroid.artwork.width / 2, asteroid.y - asteroid.artwork.height / 2, asteroid.artwork.width, asteroid.artwork.height)) {
        iterator.remove();
        fuel.reduce();
      }
    }
  }

  public void checkBulletAsteroidCollisions(Asteroids asteroids) {
    for (Iterator<Bullet> iterator = bullets.iterator (); iterator.hasNext(); ) {
      Bullet bullet = iterator.next();
      for (Iterator<Asteroid> iterator2 = asteroids.asteroids.iterator (); iterator2.hasNext(); ) {
        Asteroid asteroid = iterator2.next();
        if (rectangleCollided(bullet.x, bullet.y, bullet.artwork.width, bullet.artwork.height, asteroid.x - asteroid.artwork.width / 2, asteroid.y - asteroid.artwork.height / 2, asteroid.artwork.width, asteroid.artwork.height)) {
          iterator.remove();
          iterator2.remove();
          //increase score
        }
      }
    }
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
    if (x > width - spaceship.width) {
      x = width - spaceship.width;
    }
  }

  public void draw() {
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

