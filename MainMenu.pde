public class MainMenu {
  
  public PImage spriteSheet;
  private PImage menuItems; 
  private PImage [] background;
  private int timer = 0;
  private int switcher = 0;
  
  private Planet mars;
  private Planet earth;
  private Moon moon;
  private Asteroids asteroids;
  private ShootingStar shootingStar;
  private Bttn play;
  private Bttn exit;

  public MainMenu() {
    spriteSheet = loadImage("Mars20SpriteSheet.png");
    menuItems = loadImage("Mars20Buttons&Text.png");
    background = new PImage[2];
    background[0] =loadImage("mainmenu_background.png");
    background[1] = loadImage("mainmenu_background_2.png");
    mars = new Planet(spriteSheet, 1293, 612, 431, 422, 25, 45, 0.05);
    earth = new Planet(spriteSheet, 1172, 15, 563, 550, 475, 155, 0.1);
    moon = new Moon(spriteSheet);
    asteroids = new Asteroids(spriteSheet, 700, 950, -200, -200, 120, 1000);
    shootingStar = new ShootingStar(spriteSheet, -100, 0, 5, 12);
    play = new Bttn(menuItems, 76, 325, 291, 32, 383, 350, 291, 32, 359);
    exit = new Bttn(menuItems, 76, 395, 134, 32, 383, 400, 134, 32, 359);
  }

  public void pickBackground(){
   if (switcher == 0){
      image(background[0],0,0);
    }
    else{
      image(background[1],0,0);
    }
    timer++;
    if(timer%50 == 0){
      if (switcher == 1){
        switcher = 0;
      }
      else{
        switcher = 1;
      }
    }
  }
  
  public void draw() {
    pickBackground();
    earth.draw();
    moon.draw();
    mars.draw();
    asteroids.draw();
    shootingStar.draw();
    play.display();
    exit.display();
    
    //title
    copy(menuItems, 75, 112, 448, 147, 363, 150, 535, 185);
    
    //created
    copy(menuItems, 76, 551, 606, 18, 315, 650, 606, 18);
  }

  public void update() {
    earth.update();
    moon.update();
    mars.update();
    asteroids.update();
    shootingStar.update();
  }

  public void changeState() {
    if (play.clicked()){
      gameplay = new Gameplay();
      status = Status.GAME_PLAY;
    }
    if (exit.clicked()){
      exit();
    }
  }
}

