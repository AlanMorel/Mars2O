public class Cutscene1 {

  public PImage spriteSheet;
  private PImage menuItems;
  private PImage text;
  private PImage surface; 
  private PImage depth;
  private PImage ship;
  private PImage water;
  private PImage playInstruc;
  private PImage oneMoreJoke;
  private PImage [] captain;
  private int switcher = 0;
  private float posY;
  private float startTime;
  private float timer;
  private boolean showInstruc = false;
  private DialogueBox box;

  private Background space;
  private Bttn skip;

  private int frame; 
  private float x, y, sizeX, sizeY, wx, wy, wX, wY;

  public Cutscene1(PImage sprites, PImage menu) {
    startTime = millis()/1000;
    menuItems = menu;
    spriteSheet = sprites;
    space = new Background(false);
    surface = loadImage("marsSurface.png");
    depth = loadImage("notJustARock.png");
    text = loadImage("Text.png");
    skip = new Bttn(menuItems, 78, 694, 119, 20, 1100, 50, 119, 20, 143);
    ship = spriteSheet.get(1162, 1372, 460, 147);
    water = spriteSheet.get(112, 1183, 109, 99);
    playInstruc = text.get(473,422,541,99);
    oneMoreJoke = text.get(473,526,530,98);
    //make the dialogue box
    box = new DialogueBox(text, 320,100);
    //make the captain
    captain = new PImage[9];
    int sx = 0;
    for (int i = 0; i < 9; i++) {
      captain[i] = spriteSheet.get(sx, 1403, 119, 115);
      sx = sx + 119;
    }
    //set variables
    posY = 720;    
    x = 150;
    y = posY + 600;
    sizeX = x + 70;
    sizeY = y + 80;

    wx = 490;
    wy = posY + 530;
    wX = wx + 70;
    wY = wy + 80;
    timer = millis();
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
    box.draw();
    if(showInstruc){
      image(playInstruc, 300,100);
      image(oneMoreJoke, 300,400);
    }
  }

  public void update() {  
    if(skip.clicked()){
      changeState();
    }
    space.update();
    box.update();
    BoxTimer();  
    if (posY != 0 && switcher != 3) {
      posY = posY - 1.5;
      y = int(posY + 600);
      sizeX = x + 70;
      sizeY = y + 80;
      wy = posY + 530;
      wX = wx + 80;
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
        wX = wx + 80;
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
  
  //set trigger
  public void BoxTimer(){
    timer = millis()/1000 - startTime;    
    if(timer == 14){
      box.visible();
    }if(timer == 20){
      box.hide();
    }if(timer == 25){
      box.switchLine(1);
      box.visible();
    }if(timer == 27){
      box.switchLine(2);
    }if(timer == 29){
      box.switchLine(3);
    }if(timer == 31){
      box.switchLine(4);
    }if(timer == 33){
      box.switchLine(5);
    }if(timer == 35){
      box.switchLine(6);
    }if(timer == 37){
      box.switchLine(7);
    }if(timer == 40){
      box.switchLine(8);
    }if(timer == 43){
      box.switchLine(9);
    }if(timer == 44){
      box.switchLine(10);
    }if (timer == 45){
      space.setMove();
    }if(timer == 46){
      box.switchLine(11);
    }if(timer == 49){
      box.switchLine(12);
    }if(timer == 51){
      box.switchLine(13);
    } if(timer == 53){
      box.hide();
    }if (timer == 54){
      showInstruc = true;    
    }if(timer == 57){
      changeState();
    }
  }

  public void changeState() {
      cutscene.pause();
      gameplay = new Gameplay(spriteSheet);
      status = Status.GAME_PLAY;
  }
  
}

