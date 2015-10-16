public abstract class Spawner {

  protected int x, w;
  protected int y, h;

  protected float angle;
  protected float delay;

  protected int now;

  public Spawner(int x, int w, int y, int h, float angle, float delay) {
    this.x = x;
    this.w = w;
    this.y = y;
    this.h = h;

    this.angle = angle;
    this.delay = delay;

    this.now = millis();
  }

  public void checkNewSpawn() {
    if (millis() - now >= delay) {
      spawn();
      now = millis();
    }
  }

  public abstract void spawn();
}

