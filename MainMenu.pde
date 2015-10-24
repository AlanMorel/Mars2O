public class MainMenu {
  
  public PImage spriteSheet;
  private PImage menuItems; 
  private int timer = 0;
  private int switcher = 0;
  
  private Background space;
  private Planet mars;
  private Planet earth;
  private Moon moon;
  private Asteroids asteroids;
  private ShootingStar shootingStar;
  private Bttn play;
  private Bttn exit;
  private Asteroid test;

  public MainMenu() {
    spriteSheet = loadImage("Mars20SpriteSheet.png");
    menuItems = loadImage("Mars20Buttons&Text.png");
    space = new Background(false);
    mars = new Planet(spriteSheet, 1293, 612, 431, 422, 150, 200, 0.05);
    earth = new Planet(spriteSheet, 1172, 15, 563, 550, 1075, 450, 0.1);
    moon = new Moon(spriteSheet);
    asteroids = new Asteroids(spriteSheet, 700, 950, -200, -200, 120, 1000);
    shootingStar = new ShootingStar(spriteSheet, -100, 0, 5, 12);
    play = new Bttn(menuItems, 76, 325, 291, 32, 383, 350, 291, 32, 359);
    exit = new Bttn(menuItems, 76, 395, 134, 32, 383, 400, 134, 32, 359);
  }

  
  public void draw() {
    space.draw();
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

