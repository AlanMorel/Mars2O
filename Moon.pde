public class Moon {

  private PImage moon;
  private float angle;

  public Moon() {
    moon = loadImage("moon.png");
    angle = 0;
  }

  public void update() {
    angle += 0.5;
  }

  public void draw() {
    pushMatrix();
    translate(1075, 450);
    rotate(radians(angle));
    fill(128);
    image(moon, 125, 125);
    popMatrix();
  }
}

