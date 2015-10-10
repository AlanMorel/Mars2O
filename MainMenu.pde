public class MainMenu {

  private PImage background;
  private PImage screen;
  private PImage title;

  private Planet mars;
  private Planet earth;
  private Moon moon;
  private Asteroids asteroids;
  private ShootingStar shootingStar;

  public MainMenu() {
    background = loadImage("mainmenu_background.png");
    screen = loadImage("mainmenu.png");
    title = loadImage("title.png");
    mars = new Planet("mars", 150, 200, 0.05);
    earth = new Planet("earth", 1075, 450, 0.1);
    moon = new Moon();
    asteroids = new Asteroids(700, 950, -200, -200, 120, 1000);
    shootingStar = new ShootingStar(-100, 0, 5, 12);
  }

  public void draw() {
    image(background, 0, 0);
    
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

