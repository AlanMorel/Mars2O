import java.util.Iterator;
import ddf.minim.*;

Minim minim;
AudioPlayer shoot;
AudioPlayer get;
AudioPlayer explode;
AudioPlayer crumble;
AudioPlayer hit;
AudioPlayer textscrol;
AudioPlayer menu;
AudioPlayer cutscene;
AudioPlayer mission;
AudioPlayer failsong;
AudioPlayer winsong;

Status status;
PImage spriteSheet;
PImage menuItems;
MainMenu mainMenu;
Gameplay gameplay;
Cutscene1 cutscene_1;
Endscreen testscreen;
void setup() {
  size(1280, 720);
  frameRate(60);
  noStroke();
  fill(0, 0, 0);
  minim = new Minim(this);
  shoot = minim.loadFile("shoot.mp3");
  textscrol = minim.loadFile("textscrol.wav");
  cutscene = minim.loadFile("cutscene.mp3");
  menu = minim.loadFile("menu.mp3");
  mission = minim.loadFile("mission.mp3");
  failsong = minim.loadFile("fail.mp3");
  winsong = minim.loadFile("win.mp3");
  hit = minim.loadFile("hit.wav");
  get = minim.loadFile("get.wav");
  crumble = minim.loadFile("crumble.wav");
  explode = minim.loadFile("explode.wav");
  
  spriteSheet = loadImage("Mars20SpriteSheet.png");
  menuItems = loadImage("Mars20Buttons&Text.png");

  mainMenu = new MainMenu(spriteSheet, menuItems);

  status = Status.MAIN_MENU;
}

void draw() {
  if (status == Status.MAIN_MENU) {
    menu.play();
    mainMenu.update();
    mainMenu.draw();
  }else if (status == Status.CUTSCENE_1) {
    menu.pause();
    cutscene.play();
    cutscene_1.update();
    cutscene_1.draw();
  } else if (status == Status.GAME_PLAY) {
    mission.play();
    gameplay.update();
    gameplay.draw();
  }else if (status == Status.ENDSCREEN)  {
    mission.pause();
    if(testscreen.set == 1){
      failsong.play();
    }
    if(testscreen.set == 0){
      winsong.play();
    }
    testscreen.draw();
  }
}

void mousePressed() {
  if (status == Status.MAIN_MENU) {
    mainMenu.changeState();
  } else if (status == Status.GAME_PLAY) {
    gameplay.mousePressed();
  }else if (status == Status.ENDSCREEN){
    testscreen.changeState();
  }
}

boolean[] keys = new boolean[255];

void keyPressed() {
  keys[keyCode] = true;
}

void keyReleased() {
  keys[keyCode] = false;
}
