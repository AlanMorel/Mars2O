public class Earth {

  private PImage earth;
  private float angle;

  public Earth() {
    earth = loadImage("earth.png");
    angle = 0;
  }

  public void update(){
    angle += 0.1;
  }

  public void draw() {
    pushMatrix();
    translate(1075, 450);
    imageMode(CENTER);
    rotate(radians(sin(angle)));
    fill(128);
    image(earth, 0, 0);
    popMatrix();
    imageMode(CORNERS);
  }
}

