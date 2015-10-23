public class MainMenu {

  private PImage [] background;
  private PImage screen;
  private PImage title;
  private int timer = 0;
  private int switcher = 0;
  
  private Planet mars;
  private Planet earth;
  private Moon moon;
  private Asteroids asteroids;
  private ShootingStar shootingStar;

  public MainMenu() {
    background = new PImage[2];
    background[0] =loadImage("mainmenu_background.png");
    background[1] = loadImage("mainmenu_background_2.png");
    screen = loadImage("mainmenu.png");
    title = loadImage("title.png");
    mars = new Planet(1293, 612, 431, 422, 25, 45, 0.05);
    earth = new Planet(1172, 15, 563, 550, 475, 155, 0.1);
    moon = new Moon();
    asteroids = new Asteroids(700, 950, -200, -200, 120, 1000);
    shootingStar = new ShootingStar(-100, 0, 5, 12);
  }

  public void draw() {
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
    earth.draw();
    moon.draw();
    mars.draw();
    asteroids.draw();
    shootingStar.draw();

    image(screen, 0, 0);
    image(title, 310, 150);
  }

  public void update() {
    earth.update();
    moon.update();
    mars.update();
    asteroids.update();
    shootingStar.update();
  }

  public void mousePressed() {
    gameplay = new Gameplay();
    status = Status.GAME_PLAY;
  }
}

