public class Asteroid {

  public float x, y;
  public float angle,speed;
  public int hp, sizeW, sizeH, size;
  public boolean hit = false;
  private PImage artwork;
  private PImage frames[][];
  private int rowFrame = 0;
  private int colFrame = 0;
  private int switcher = 0;
//  private int countFrame;
  private int rotater;

  public Asteroid(PImage ref, float x, float y, float angle) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.artwork = ref;
    setSize();
    int sy = 112;
    this.frames = new PImage[4][6];
    for (int row= 0; row < 4; row++){
      int sx = 105;
      for(int col = 0; col < 6; col++){
        frames[row][col] = ref.get(sx, sy, 120, 122);
        sx = sx + 120;
      }
      sy = sy + 235;
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
      rotater = 4;
    }
    else{
      rotater = int(speed + 4);
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
   if (rowFrame == 4 ){
      rowFrame = 0;
    }
    
    if (frameCount%rotater == 0){
      if(switcher == 1){
        switcher = 0;
      } else{
        switcher = 1;
      }
    }
    
    if (switcher == 1){
      if (rowFrame < 4){ 
        image(frames[rowFrame][colFrame], 0, 0, sizeW, sizeH);
        rowFrame++;
        switcher = 0;
      }
    }
    else{
      image(frames[rowFrame][colFrame], 0, 0, sizeW, sizeH);
    }
    
    
    if(hit){
      if (colFrame < 5){
        colFrame++;
      }
    }
       
  }
  
  public void hit(){
      hit = true;
  }
  
  public void hitBig(){
    if(colFrame < 2 ){
      colFrame++;
    }
  }
  
  public boolean done(){
    if (colFrame == 5){
      return true;
    }
    else{
      return false;
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

