public class Spaceship {

  public float x, y;
  private int speed;
  private int sizeW = 225;
  private int sizeH= 105;

  public PImage art;
  public PImage [] bulletArt;
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
  }

  public void update() {
    for (Bullet bullet : bullets) {
      bullet.update();
    }
    fuel.update();
    if (keys[LEFT] || keys['a']) { 
      moveLeft();
    }
    if (keys[RIGHT] || keys['d']) { 
      moveRight();
    }
    if (keys[UP] || keys['w']) { 
      moveUp();
    }
    if (keys[DOWN] || keys['s']) { 
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

  public void draw() {
    textSize(24);
    text("Bullets   on   the   screen      " + bullets.size(), 850, 125);
    pushMatrix();
    translate(x,y);
    image(art, 0, 0, sizeW, sizeH);
    popMatrix();
    for (Bullet bullet : bullets) {
      bullet.draw();
    }
    fuel.draw();
  }

  public void mousePressed() {
//    Bullet bullet = new Bullet(art, x + 252, y + 57);
    Bullet bullet = new Bullet(bulletArt, x, y);
    bullets.add(bullet);
  }
}

