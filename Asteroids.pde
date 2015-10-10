public class Asteroids {

  public ArrayList<Asteroid> asteroids;

  private int spawnX;
  private int spawnWidth;
  private int spawnY;
  private int spawnHeight;

  private float angle;
  private float delay;

  private int now;

  public Asteroids(int spawnX, int spawnWidth, int spawnY, int spawnHeight, float angle, float delay) {
    this.asteroids = new ArrayList<Asteroid>();
    
    this.spawnX = spawnX;
    this.spawnWidth = spawnWidth;
    this.spawnY = spawnY;
    this.spawnHeight = spawnHeight;
    
    this.angle = angle;
    this.delay = delay;
    
    this.now = millis(); 
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
    text("Asteroids on the screen: " + asteroids.size(), 1000, 100);
    for (Asteroid asteroid : asteroids) {
      asteroid.draw();
    }
  }

  private void spawn() {
    float x = random(spawnX, spawnWidth);
    float y = random(spawnY, spawnHeight);
    float ang = angle + random(-10, 10);
    
    Asteroid asteroid = new Asteroid(x, y, ang);
    asteroids.add(asteroid);
  }
}

