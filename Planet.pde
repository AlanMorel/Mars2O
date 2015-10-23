public class Planet {

  PImage art;
  
  private float angle;
  
  private int sx, sy, sw, sh, x, y, dw, dh;

  private float increment;

  public Planet(PImage ref, int sx, int sy, int sw, int sh, int x, int y, float increment) {
    this.art = ref;
    this.sx = sx;
    this.sy = sy;
    this.sw = sw;
    this.sh = sh;
    this.dh = sh / 2;
    this. dw = sw/ 2;
    this.x = x;
    this.y = y;
    this.increment = increment;
    this.angle = 0;
  }

  public void update() {
    angle += increment;
  }

  public void draw() {
    pushMatrix();
    translate(x, y);
    imageMode(CENTER);
    rotate(radians(sin(angle)));
    fill(128);
    copy(art ,sx, sy, sw, sh, x, y, dw, dh);
    popMatrix();
    imageMode(CORNERS);
  }
}

