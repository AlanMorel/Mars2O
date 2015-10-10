public class Asteroids {

  public ArrayList<Asteroid> asteroids;

  private int spawnX;
  private int spawnWidth;
  private int spawnY;
  private int spawnHeight;

  private float angle;
  private float delay;

  private int now;

  public PImage artwork;

  public Asteroids(int spawnX, int spawnWidth, int spawnY, int spawnHeight, float angle, float delay) {
    this.asteroids = new ArrayList<Asteroid>();
    
    this.spawnX = spawnX;
    this.spawnWidth = spawnWidth;
    this.spawnY = spawnY;
    this.spawnHeight = spawnHeight;
    
    this.angle = angle;
    this.delay = delay;
    
    this.now = millis();
    
    this.artwork = loadImage("asteroid_small.png");
    
    this.spawn();
  }

  public void update() {
    for (Asteroid asteroid : asteroids) {
      asteroid.update();
    }
    checkNewSpawn();
  }

  private void checkNewSpawn() {
    if (millis() - now >= delay) {
      spawn();
      now = millis();
    }
  }

  public void draw() {
    for (Asteroid asteroid : asteroids) {
      asteroid.draw();
    }
  }

  private void spawn() {
    float x = random(spawnX, spawnWidth);
    float y = random(spawnY, spawnHeight);
    float speed = random(2, 5);
    float ang = angle + random(-5, 5);

    Asteroid asteroid = new Asteroid(x, y, ang, speed, artwork);
    asteroids.add(asteroid);
  }
}

