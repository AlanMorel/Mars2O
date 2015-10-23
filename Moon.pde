public class Moon {

  private PImage moon;
  private float angle;

  public Moon(PImage ref) {
    moon = ref;
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
    copy(moon, 948, 262, 192, 202, 125, 125, 77, 78);
    popMatrix();
  }
}

