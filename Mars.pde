public class Mars {

  private PImage mars;
  private float angle;

  public Mars() {
    mars = loadImage("mars.png");
    angle = 0;
  }

  public void update() {
    angle += 0.05;
  }

  public void draw() {
    pushMatrix();
    translate(150, 200);
    imageMode(CENTER);
    rotate(radians(sin(angle)));
    fill(128);
    image(mars, 0, 0);
    popMatrix();
    imageMode(CORNERS);
  }
}

