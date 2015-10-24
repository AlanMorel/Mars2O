public class Cutscene1 {

  public PImage spriteSheet;
  private PImage menuItems;
  private PImage surface; 
  private PImage depth;
  private PImage ship;
  private PImage water;
  private PImage [] captain;
  private int timer = 0;
  private int switcher = 0;
  private float posY;


  private Background space;
  private Bttn skip;

  private int frame; 
  private float x, y, sizeX, sizeY, wx, wy, wX, wY;

  public Cutscene1(PImage sprites, PImage menu) {
    menuItems = menu;
    spriteSheet = sprites;
    space = new Background(false);
    surface = loadImage("marsSurface.png");
    depth = loadImage("notJustARock.png");
    skip = new Bttn(menuItems, 78, 694, 119, 20, 1100, 50, 119, 20, 143);
    ship = spriteSheet.get(1162, 1372, 460, 147);
    water = spriteSheet.get(112, 1183, 109, 99);
    captain = new PImage[9];
    int sx = 0;
    for (int i = 0; i < 9; i++) {
      captain[i] = spriteSheet.get(sx, 1403, 119, 115);
      sx = sx + 119;
    }
    posY = 720;
    
    x = 150;
    y = posY + 600;
    sizeX = x + 70;
    sizeY = y + 80;

    wx = 490;
    wy = posY + 530;
    wX = wx + 70;
    wY = wy + 80;
  }


  public void draw() {
    space.draw();
    skip.display();
    image(surface, 0, posY);
    if(switcher != 3){
      image(captain[frame], x, y, sizeX, sizeY);
      image(water, wx, wy, wX, wY);
    }
    image(ship, 900, posY + 500, 1000 + 250, (posY+500)+ 150);
    image(depth, 0, posY);
  }

  public void update() {    
    if (posY != 0 && switcher != 3) {
      posY = posY - 1.5;
      y = int(posY + 600);
      sizeX = x + 70;
      sizeY = y + 80;
      wy = posY + 530;
      wX = wx + 70;
      wY = wy + 80;
      
    }

    if (posY < 180 && switcher == 0) {
      if (frame == 4) {
        frame = 0;
      }
      if (frame < 4 && frameCount%5 == 0) {
        frame++;
        x = x + 3;
        sizeX = x+ 70;
        y =  y - 1;
        sizeY = y + 80;
      }
    }

    if (x > 430 && y < 530 && switcher != 3) {
      switcher = 1;
      x = x + 1.5; 
      sizeX = x + 70;
      y = y;
      sizeY = y + 80;
      
      if (frame >= 6){
        wx = wx + 1.5;
        wX = wx + 70;
        wy = wy;
        wY = wy + 80;
      }

      if (frame == 8) {
        frame = 6;
      }
      if (frame < 8 && frameCount%10 == 0) {
        frame++;
      }
    }
    
    if(x > 1080 && y < 530){
      switcher = 3;
    }
    if(switcher == 3){
      if (posY != 720){
        posY++;
      }
    }
  }

  public void changeState() {
    if (skip.clicked()) {
      gameplay = new Gameplay(spriteSheet);
      status = Status.GAME_PLAY;
    }
  }
}

