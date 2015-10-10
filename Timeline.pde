public class Timeline {

  private PImage earth;
  private PImage mars;
  private PImage spaceship;
  private PImage highlight;
  
  private float progress;

  public Timeline() {
    this.earth = loadImage("earth_icon.png");
    this.mars = loadImage("mars_icon.png");
    this.spaceship = loadImage("spaceship_icon.png");
    this.highlight = loadImage("timeline_highlight.png");
    this.progress = 0;
  }

  public void update() {
    progress = (gameplay.getTripLeft() * 190);
  }

  public void draw() {
    image(highlight, 825, 675);
    image(earth, 1150, 660);
    image(mars, 800, 660);
    image(spaceship, 890 + progress, 685);
    //For testing purposes
    text((int) (gameplay.getTripLeft() * 100) + "%", 1000, 675);
  }
}

