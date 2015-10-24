public class Asteroid {

  public float x, y;
  public float angle,speed;
  public int hp, sizeW, sizeH, size;
  private PImage artwork;
  private PImage frames[];
  private int sy = 112;
  private int countFrame = 0;
  private int switcher = 0;
  private int rotater;

  public Asteroid(PImage ref, float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.artwork = ref;
    setSize();
    
    this.frames = new PImage[4];
    for (int i= 0; i < 4; i++){
      frames[i] = ref.get(105, sy, 127, 128);
      sy = sy + 234;
    }
  }

  public void update() {
    double dy = speed * Math.sin(Math.toRadians(angle));
    double dx = speed * Math.sin(Math.toRadians(90 - angle));

    x += dx;
    y += dy;
  }

  private void setSize() {
    float rand = random(0, 100);
    if (rand < 85) {
      setSmall();
    } 
    else {
      setLarge();
    }
  }

  public void setSmall() {
    sizeW = 127/2;
    sizeH =128/2;
    speed = random(3, 5);
    if (speed > 4){
      rotater = 3;
    }
    else{
      rotater = int(speed + 2);
    }
    hp = 1;
    size = 0;
  }

  public void setLarge() {
    sizeW = 127 *2;
    sizeH = 128 *2; 
    speed = random(1, 2);
    rotater = int(random(5, 8));
    hp = 3;
    size = 2;
  }

  public boolean isSmall() {
    return size == 0;
  }


  public boolean isLarge() {
    return size == 2;
  }

  public boolean isDestroyed() {
    return --hp <= 0;
  }
  
  public void display(){
   if (countFrame == 4 ){
      countFrame = 0;
    }
    if (frameCount%rotater == 0){
      if(switcher == 1){
        switcher = 0;
      } else{
        switcher = 1;
      }
    }
    if (switcher == 1){
      image(frames[countFrame], 0, 0, sizeW, sizeH);
      countFrame++;
      switcher = 0;
    }
    else{
      image(frames[countFrame], 0, 0, sizeW, sizeH);
    }
  }

  public void draw() {
    pushMatrix();
    translate(x, y);
    imageMode(CENTER);
    fill(128);
    display();
    popMatrix();
    imageMode(CORNERS);
  }
}

