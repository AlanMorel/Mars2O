public class Canister {

  public float x, y;

  public float angle, speed;

  public float rotationAngle;
  public float rotationSpeed;

  private PImage [] artwork;
  public int sizeW = 124;
  public int sizeH = 125;
  public int frame = 0;
  public boolean hit = false;
  
  public Canister(PImage ref, float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.rotationAngle = 0;
    int sx = 105;
    this.artwork = new PImage[9];
    for(int i = 0; i < 9; i++){
      artwork[i] = ref.get(sx, 1049, 124, 125);
      sx = sx + 113;
    }
    ref.get(105, 1049, 124, 125);
    this.speed = random(2, 4);
    this.rotationSpeed = random(1,3);
  }

  public void update() {
    double dy = speed * Math.sin(Math.toRadians(angle));
    double dx = speed * Math.sin(Math.toRadians(90 - angle));

    x += dx;
    y += dy;

    rotationAngle += rotationSpeed;
  }
  
  


  public void draw() {
    pushMatrix();
    translate(x, y);
    imageMode(CENTER);
    rotate(radians(rotationAngle));
    fill(128);
    image(artwork[frame], 0, 0, sizeW, sizeH);
    if(hit == true){
      if (frame < 8){
        frame++;
      }
    }
    popMatrix();
    imageMode(CORNERS);
  }
  
  public void hit(){
      hit = true;
  }
  
  public boolean done(){
    if (frame == 8){
      return true;
    }
    else{
      return false;
    }
  }
}

