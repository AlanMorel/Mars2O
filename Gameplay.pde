public class Gameplay {

  public PImage spriteSheetG; 
  public PFont font;
  private int timer;
  private int startTime;
  private static final int SECONDS_TO_REACH_EARTH = 60;
  private Spaceship spaceship;
  private Background background;
  private Asteroids asteroids;
  private Canisters canisters;
  private Timeline timeline;
  private Endscreen testcreen;

  private int score;
  private int start;

  public Gameplay(PImage sprites) {
    startTime = millis()/1000;
    font = createFont("ARCADECLASSIC.TTF", 24);
    textFont(font);
    spriteSheetG = sprites;
    spaceship = new Spaceship(spriteSheetG, 50, 50);
    background = new Background(true);
    asteroids = new Asteroids(spriteSheetG, width + 100, width + 100, 0, height - 100, -180, 1000);
    canisters = new Canisters(spriteSheetG, width + 50, width + 50, 0, height - 100, -180, 3000);
    timeline = new Timeline(spriteSheetG);
    score = 0;
    start = millis();
    testscreen = new Endscreen();
  }

  //Returns a number between 0 to 1. 
  //0 = start of game. 1 = player has reached earth.
  public float getTripLeft() {
    return ((float) millis() - start) / (SECONDS_TO_REACH_EARTH * 1000);
  }

  public void update() {
    timer = startTime - millis()/1000;
    background.update();
    timeline.update();
    asteroids.update();
    canisters.update();
    spaceship.update();

    playerAsteroidCollisions();
    bulletAsteroidCollisions();

    playerCanisterCollisions();
    bulletCanisterCollisions();
    if (spaceship.noFuel()){
      testscreen.setStatus(1);
      testscreen.setScore(score);
      status = Status.ENDSCREEN;
    }
    if(getTripLeft()*190 > 191){
      testscreen.setStatus(0);
      testscreen.setScore(score);
      status = Status.ENDSCREEN;
    }
  }

  public void draw() {

    background.draw();
    if(timer != 60){
      asteroids.draw();
      canisters.draw();
      spaceship.draw();
      timeline.draw();
    textSize(40);
    text("Score     " + score, 975, 50);
    }
  }

  public void mousePressed() {
    shoot.play();
    spaceship.mousePressed();
    shoot.cue(0);
       
  }

  public void addScore(Asteroid asteroid) {
    if (asteroid.isSmall()) {
      score += 5;
    }
    else {
      score += 100;
    }
  }

  public void playerAsteroidCollisions() {

    ArrayList<Asteroid> removedAsteroids = new ArrayList<Asteroid>();

    for (Asteroid asteroid : asteroids.asteroids) {
      //If the asteroid has exited the screen, remove it and move on
      if (asteroid.x + asteroid.sizeW < 0 || asteroid.y + asteroid.sizeH < 0 || asteroid.y - asteroid.sizeH > height) {
        removedAsteroids.add(asteroid);
        continue;
      }
      //Otherwise, if it collided with the player, if so, remove it and reduce fuel
      if (collided(spaceship.x, spaceship.y, spaceship.sizeW - 50, spaceship.sizeH, asteroid.x - asteroid.sizeH / 2, asteroid.y - asteroid.sizeH / 2, asteroid.sizeW, asteroid.sizeH)) {
          spaceship.leakFuel();
          hit.rewind();
          hit.play();
          removedAsteroids.add(asteroid);
          spaceship.fuel.reduce();
      }
    }

    //Remove all asteroids that exited the screen or hit the player
    for (Asteroid asteroid : removedAsteroids) {
        asteroids.asteroids.remove(asteroid); 
    }
  }

  public void bulletAsteroidCollisions() {

    ArrayList<Asteroid> removedAsteroids = new ArrayList<Asteroid>();
    ArrayList<Bullet> removedBullets = new ArrayList<Bullet>();

    for (Asteroid asteroid : asteroids.asteroids) {
       if(asteroid.done()){
         removedAsteroids.add(asteroid);
         continue;
       }
      for (Bullet bullet : spaceship.bullets) {
        //If the bullet has exited the screen, remove it and move on
        if (bullet.x > width) {
          removedBullets.add(bullet);
          continue;
        }
        //Otheriwse, if a bullet and asteroid collided, remove both and increment score
        if (collided(bullet.x, bullet.y, bullet.sizeW - 30, bullet.sizeH - 30, asteroid.x - asteroid.sizeW / 2, asteroid.y - asteroid.sizeH / 2, asteroid.sizeW, asteroid.sizeH)) {
          removedBullets.add(bullet);
          crumble.rewind();
          crumble.play();
          if (asteroid.isDestroyed()) {
            asteroid.hit();
            gameplay.addScore(asteroid);
           // removedAsteroids.add(asteroid);
          }
          else{
            asteroid.hitBig();
          }
        }
      }
    }

    //Remove all asteroids and bullets marked for deletion
    for (Asteroid asteroid : removedAsteroids) {
        asteroids.asteroids.remove(asteroid);
    }
    for (Bullet bullet : removedBullets) {
      spaceship.bullets.remove(bullet);
    }
  }

  public void playerCanisterCollisions() {

    ArrayList<Canister> removedCanisters = new ArrayList<Canister>();

    for (Canister canister : canisters.canisters) {
      //If the canister has exited the screen, remove it and move on
      if (canister.x + canister.sizeW < 0 || canister.y + canister.sizeH < 0 || canister.y - canister.sizeH > height) {
        removedCanisters.add(canister);
        continue;
      }
      //Otherwise, if it collided with the player, if so, remove it and add fuel
      if (collided(spaceship.x, spaceship.y, spaceship.sizeW - 50, spaceship.sizeH, canister.x - canister.sizeW / 2, canister.y - canister.sizeH / 2, canister.sizeW, canister.sizeH)){
          removedCanisters.add(canister);
          get.rewind();
          get.play();
          spaceship.fuel.increment();
      }
    }

    //Remove all canisters that exited the screen or hit the player
    for (Canister canister : removedCanisters) {
        canisters.canisters.remove(canister);
    }
  }

  public void bulletCanisterCollisions() {

    ArrayList<Canister> removedCanisters = new ArrayList<Canister>();
    ArrayList<Bullet> removedBullets = new ArrayList<Bullet>();
    long tried = 0;
    long waitThresh = 3000;
    for (Canister canister : canisters.canisters) {
       if (canister.done()){
          removedCanisters.add(canister);
          explode.rewind();
          explode.play();
          continue;
       }
      for (Bullet bullet : spaceship.bullets) {
        //Otheriwse, if a bullet and canister collided, remove both and increment score
        if (collided(bullet.x, bullet.y, bullet.sizeW - 30, bullet.sizeH - 30, canister.x - canister.sizeW / 2, canister.y - canister.sizeH / 2, canister.sizeW, canister.sizeH)) {
          removedBullets.add(bullet);
          canister.hit();
          //removedCanisters.add(canister);
         // explode.play();
        }
      }
    }
    
    //Remove all canisters and bullets marked for deletion
    for (Canister canister : removedCanisters) {
           canisters.canisters.remove(canister);
           //explode.cue(0);
    }
    for (Bullet bullet : removedBullets) {
      spaceship.bullets.remove(bullet);
    }
    
  }
  

  boolean collided(float x1, float y1, int w1, int h1, float x2, float y2, int w2, int h2) {
    return x1 < x2 + w2 && x1 + w1 > x2 && y1 < y2 + h2 && h1 + y1 > y2;
  }
}

