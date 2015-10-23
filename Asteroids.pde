public class Asteroids extends Spawner {

  public ArrayList<Asteroid> asteroids;
  public PImage reference;

  public Asteroids(PImage ref, int spawnX, int spawnWidth, int spawnY, int spawnHeight, float angle, float delay) {
    super(spawnX, spawnWidth, spawnY, spawnHeight, angle, delay);
    this.asteroids = new ArrayList<Asteroid>();
    this.reference = ref;
  }

  public void update() {
    for (Asteroid asteroid : asteroids) {
      asteroid.update();
    }
    checkNewSpawn();
  }

  public void draw() {
    text("Asteroids on the screen: " + asteroids.size(), 1000, 100);
    for (Asteroid asteroid : asteroids) {
      asteroid.draw();
    }
  }

  public void spawn() {
    float ang = angle + random(-10,10);
    Asteroid asteroid = new Asteroid(reference, random(x, w), random(y, h), ang);
    asteroids.add(asteroid);
  }
}

