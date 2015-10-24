public class Timeline {

  private PImage earth;
  private PImage mars;
  private PImage spaceship;
  private PImage highlight;

  private float progress;

  public Timeline(PImage ref) {
    this.earth = ref.get(1172,15, 563, 550);
    this.mars = ref.get(1293, 612, 431, 422);
    this.spaceship = ref.get(1162, 1372, 460, 147);
    this.highlight = loadImage("timeline_highlight.png");
    this.progress = 0;
  }

  public void update() {
    progress = (gameplay.getTripLeft() * 190);
  }

  public void draw() {
    image(highlight, 825, 675);
    image(earth, 1100, 640, 1180, 710);
    image(mars, 800, 650, 860, 710);
    image(spaceship, 850 + progress, 665, 920 + progress, 700);
    //For testing purposes
    text((int) (gameplay.getTripLeft() * 100), 1000, 675);
  }
}

