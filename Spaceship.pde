public class Spaceship {

  public float x, y;
  private int speed;
  private int sizeW = 225;
  private int sizeH= 105;
  private int toggle1 = 0; 
  private int toggle2 = 2;
  private int lFrame = 0;
  private boolean leaking = false;
  public PImage art;
  public PImage [] bulletArt;
  public PImage [] thruster;
  public PImage [] leak;
  public PImage passer;
  private Fuel fuel;

  private ArrayList<Bullet> bullets;

  public Spaceship(PImage ref, float x, float y) {
    this.passer = ref;
    this.x = x;
    this.y = y;
    this.speed = 4;
    this.art = ref.get(1162, 1372, 460, 147);
    this.fuel = new Fuel();
    this.bullets = new ArrayList<Bullet>();
    // populate bullet Art
    bulletArt = new PImage[4];
    int sx = 111;
    for (int i = 0; i < 4; i++){
      bulletArt[i] = ref.get(sx, 505, 119, 52);
      sx = sx + 119;
    }
    
    //populate leak
    this.leak = new PImage[4];
    sx = 111;
    for(int b = 0; b < 4; b++){
      leak[b] = ref.get(sx, 1287, 120, 111);
      sx = sx + 120;
    }
    
    //populate thrusters
    this.thruster = new PImage[4];
    sx = 111;
   for(int i = 0; i < 4; i++){
     thruster[i] = ref.get(sx,744,120,35);
     sx = sx + 120;
   } 
  }

  public void update() {
    for (Bullet bullet : bullets) {
      bullet.update();
    }
    fuel.update();
    if (keys[LEFT] || keys['a']) { 
      toggle1 = 0;
      toggle2 = 2;
      moveLeft();
    }
    if (keys[RIGHT] || keys['d']) {
      moveRight();
      toggle1 = 1;
      toggle2 = 3;
    }
    else{
      toggle1 = 0;
      toggle2 = 2;
    }
    if (keys[UP] || keys['w']) { 
      toggle1 = 0;
      toggle2 = 2;
      moveUp();
    }
    if (keys[DOWN] || keys['s']) { 
      toggle1 = 0;
      toggle2 = 2;
      moveDown();
    }
  }
  
  
  public void moveUp() {
    y -= speed;
    if (y < 0) {
      y = 0;
    }
  }

  public void moveDown() {
    y += speed;
    if (y > height - sizeH) {
      y = height - sizeH;
    }
  }

  public void moveLeft() {
    x -= speed;
    if (x < 0) {
      x = 0;
    }
  }

  public void moveRight() {
    x += speed;
    if (x > sizeW) {
      x = sizeW;
    }
  }
  
  public void leakFuel(){
    leaking = true;
  }

  public void draw() {
    textSize(24);
    text("Bullets   on   the   screen      " + bullets.size(), 850, 125);
    pushMatrix();
    translate(x,y);
    image(art, 0, 0, sizeW, sizeH);
    image(thruster[frameCount%100 > 10 ? toggle1 : toggle2], -70, 50);
    if(leaking){
      if(lFrame == 4){
        leaking = false;
        lFrame = 0;
      }
      if(lFrame < 4){
        image(leak[lFrame], -55, 45);
        lFrame++;
      }
    }
    popMatrix();
    for (Bullet bullet : bullets) {
      bullet.draw();
    }
    fuel.draw();
  }

  public void mousePressed() {
    Bullet bullet = new Bullet(bulletArt, x, y);
    bullets.add(bullet);
  }
}

