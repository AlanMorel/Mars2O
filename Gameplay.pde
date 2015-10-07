public class Gameplay {
  
  private Spaceship spaceship;
  
  private ScrollingBackground background;
  
  private Asteroids asteroids;

  public Gameplay() {
    spaceship = new Spaceship(40, 50);
    background = new ScrollingBackground();
    asteroids = new Asteroids(width + 50, width + 50, 0, height, -180, 250);
  }

  public void update(){
    background.update();
    spaceship.update();
    spaceship.checkCollisions(asteroids);
  }
  
  public void draw() {
    background.draw();
    
    asteroids.update();
    asteroids.draw();
    
    spaceship.draw();
  }
  
  public void mousePressed(){
    spaceship.mousePressed();
  }
}

