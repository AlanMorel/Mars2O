import ddf.minim.*;

class Endscreen{
  Background space;
  PImage text;
  PImage fail;
  PImage pass;
  PImage display;
  int score;
  int set;
  Bttn play;
  Bttn exit;
  
  public Endscreen(){
    space = new Background(false);
    text = loadImage("endScreens.png");
    fail = text.get(0, 58, 574, 46);
    pass = text.get(0, 164, 630, 45);
    play = new Bttn(text, 0, 317, 320, 45, width/4, 400, 320, 45, 372);
    exit = new Bttn(text, 0, 421, 155, 46, width/4, 450, 155, 46, 215);
 
//    Bttn(PImage ref, int sx, int sy, int sw, int sh, int x, int y,  int dw, int dh, int offset)
  }
  
  public void changeState(){
    if(play.clicked()){
      failsong.pause();
      winsong.pause();
      mission.cue(0);
      gameplay = new Gameplay(spriteSheet);
      status = Status.GAME_PLAY;
    }if(exit.clicked()){
      exit();
    }
  }

  public void setStatus(int set){
    this.set = set;
    if(set == 1){
      display = fail;
    }if(set == 0){
      display = pass;
    }
  }
    
  public void setScore(int score){
    this.score = score;
  }
  
  public void draw(){
    space.draw();
    image(display, width/4, height/4);
    play.display();
    exit.display();
    textSize(32);
    text("Score         "  + score, width/4, height/2);
  }
  
}
