public class Asteroids {

  public ArrayList<Asteroid> asteroids;

  private int minX;
  private int maxX;

  private int minY;
  private int maxY;

  private float angle;
  private float delay;

  private int now;

  public PImage artwork;

  public Asteroids(int minX, int maxX, int minY, int maxY, float angle, float delay) {
    this.asteroids = new ArrayList<Asteroid>();
    
    this.minX = minX;
    this.maxX = maxX;
    
    this.minY = minY;
    this.maxY = maxY;
    
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
    float x = random(minX, maxX);
    float y = random(minY, maxY);
    float speed = random(2, 5);
    float ang = angle + random(-5, 5);

    Asteroid asteroid = new Asteroid(x, y, ang, speed, artwork);
    asteroids.add(asteroid);
  }
}

