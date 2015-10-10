public class Gameplay {
  
  private static final int SECONDS_TO_REACH_EARTH = 60;
  
  private Spaceship spaceship;
  private Background background;
  private Asteroids asteroids;
  private Timeline timeline;
  
  private int score;
  private int start;
  
  public Gameplay() {
    spaceship = new Spaceship(40, 50);
    background = new Background();
    asteroids = new Asteroids(width + 50, width + 50, 0, height - 100, -180, 250);
    timeline = new Timeline();
    score = 0;
    start = millis();
  }
  
  //Returns a number between 0 to 1. 
  //0 = start of game. 1 = player has reached earth.
  public float getTripLeft(){
    return ((float) millis() - start) / (SECONDS_TO_REACH_EARTH * 1000);
  }

  public void update(){
    background.update();
    spaceship.update(asteroids);
    timeline.update();
  }
  
  public void draw() {
    background.draw();
    
    asteroids.update();
    asteroids.draw();
    
    spaceship.draw();
    timeline.draw();
  }
  
  public void mousePressed(){
    spaceship.mousePressed();
  }
  
  public void addScore(Asteroid asteroid){
    score++;
  }
}

