public class Canisters extends Spawner {

  public ArrayList<Canister> canisters;
  public PImage reference;

  public Canisters(PImage ref, int spawnX, int spawnWidth, int spawnY, int spawnHeight, float angle, float delay) {
    super(spawnX, spawnWidth, spawnY, spawnHeight, angle, delay);
    this.reference = ref;
    this.canisters = new ArrayList<Canister>();
  }

  public void update() {
    for (Canister canister : canisters) {
      canister.update();
    }
    checkNewSpawn();
  }

  public void draw() {
    text("Canisters on the screen: " + canisters.size(), 1000, 150);
    for (Canister canister : canisters) {
      canister.draw();
    }
  }

  public void spawn() {
    float ang = angle + random(-10, 10);

    Canister canister = new Canister(reference, random(x, w), random(y, h), ang);
    canisters.add(canister);
  }
}

