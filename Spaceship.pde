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

  public void update(Asteroids asteroids) {
    playerAsteroidCollisions(asteroids);
    bulletAsteroidCollisions(asteroids);
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

  public void playerAsteroidCollisions(Asteroids asteroids) {
    ArrayList<Asteroid> removedAsteroids = new ArrayList<Asteroid>();
    for (Asteroid asteroid : asteroids.asteroids) {
      if (collided(x, y, spaceship.width - 50, spaceship.height, asteroid.x - asteroid.artwork.width / 2, asteroid.y - asteroid.artwork.height / 2, asteroid.artwork.width, asteroid.artwork.height)) {
        removedAsteroids.add(asteroid);
        fuel.reduce();
      }
    }
    for (Asteroid asteroid : removedAsteroids) {
      asteroids.asteroids.remove(asteroid);
    }
  }

  public void bulletAsteroidCollisions(Asteroids asteroids) {
    ArrayList<Asteroid> removedAsteroids = new ArrayList<Asteroid>();
    ArrayList<Bullet> removedBullets = new ArrayList<Bullet>();
    for (Asteroid asteroid : asteroids.asteroids) {
      for (Bullet bullet : bullets) {
        if (collided(bullet.x, bullet.y, bullet.artwork.width, bullet.artwork.height, asteroid.x - asteroid.artwork.width / 2, asteroid.y - asteroid.artwork.height / 2, asteroid.artwork.width, asteroid.artwork.height)) {
          removedAsteroids.add(asteroid);
          removedBullets.add(bullet);
          gameplay.addScore(asteroid);
        }
      }
    }
    for (Asteroid asteroid : removedAsteroids) {
      asteroids.asteroids.remove(asteroid);
    }
    for (Bullet bullet : removedBullets) {
      bullets.remove(bullet);
    }
  }
}

