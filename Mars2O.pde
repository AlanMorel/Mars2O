import java.util.Iterator;

Status status;
PImage spriteSheet;
PImage menuItems;
MainMenu mainMenu;
Gameplay gameplay;
Cutscene1 cutscene_1;
void setup() {
  size(1280, 720);
  frameRate(60);
  noStroke();
  fill(0, 0, 0);
  
  spriteSheet = loadImage("Mars20SpriteSheet.png");
  menuItems = loadImage("Mars20Buttons&Text.png");

  mainMenu = new MainMenu(spriteSheet, menuItems);

  status = Status.MAIN_MENU;
}

void draw() {
  if (status == Status.MAIN_MENU) {
    mainMenu.update();
    mainMenu.draw();
  }else if (status == Status.CUTSCENE_1) {
    cutscene_1.update();
    cutscene_1.draw();
  } else if (status == Status.GAME_PLAY) {
    gameplay.update();
    gameplay.draw();
  }
}

void mousePressed() {
  if (status == Status.MAIN_MENU) {
    mainMenu.changeState();
  }else if (status == Status.CUTSCENE_1){
    cutscene_1.changeState();
  } else if (status == Status.GAME_PLAY) {
    gameplay.mousePressed();
  }
}

boolean[] keys = new boolean[255];

void keyPressed() {
  keys[keyCode] = true;
}

void keyReleased() {
  keys[keyCode] = false;
}
