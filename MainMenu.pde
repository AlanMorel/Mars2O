public class MainMenu {
  
  private PImage background;
  private PImage screen;
  private PImage title;
  
  private Mars mars;
  private Earth earth;
  private Moon moon;
  private Asteroids asteroids;
  private ShootingStar shootingStar;

  public MainMenu() {
    background = loadImage("mainmenu_background.png");
    screen = loadImage("mainmenu.png");
    title = loadImage("title.png");

    mars = new Mars();
    earth = new Earth();
    moon = new Moon();
    asteroids = new Asteroids(700, 950, -200, -200, 120, 1000);
    shootingStar = new ShootingStar(-100, 0, 5, 12);
  }

  public void draw() {
    image(background, 0, 0);

    earth.update();
    earth.draw();

    moon.update();
    moon.draw();

    mars.update();
    mars.draw();

    asteroids.update();
    asteroids.draw();
    
    shootingStar.update();
    shootingStar.draw();
    
    image(screen, 0, 0);
    image(title, 310, 150);
  }
  
  public void mousePressed(){
    gameplay = new Gameplay();
    status = Status.GAME_PLAY;
  }
}

