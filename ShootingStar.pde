public class ShootingStar {

  private int x, y;
  private float angle, speed;

  //for animation
  private PImage artwork;
  private int sx;
  private int sy = 704;
  private int stateTrack = 0;

  public ShootingStar(PImage ref, int x, int y, float angle, float speed) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.speed = speed;
    this.artwork = ref;
  }

  public void update() {
    double dy = speed * Math.sin(Math.toRadians(angle));
    double dx = speed * Math.sin(Math.toRadians(90 - angle));

    x += dx;
    y += dy;
    
    //update sw, sy
    if(millis()%10 == 0){
      if (stateTrack == 0){
        stateTrack = 1;
      } 
      else{
        stateTrack = 0;
      }
    }
    
    if(stateTrack == 0){
      sx = 930;
    }
    else{
      sx = 1039;
    }
  }

  public void draw() {
    
    copy(artwork, sx, sy, 109, 110, x, y, 109, 110);
  }
}

