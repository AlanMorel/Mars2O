public class Planet {

  private PImage art;
  private float angle;
  
  private float x;
  private float y;

  private float increment;

  public Planet(String artwork, int x, int y, float increment) {
    this.art = loadImage(artwork + ".png");
    this.x = x;
    this.y = y;
    this.increment = increment;
    this.angle = 0;
  }

  public void update(){
    angle += increment;
  }

  public void draw() {
    pushMatrix();
    translate(x, y);
    imageMode(CENTER);
    rotate(radians(sin(angle)));
    fill(128);
    image(art, 0, 0);
    popMatrix();
    imageMode(CORNERS);
  }
}

