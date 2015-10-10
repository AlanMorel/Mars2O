import java.util.Iterator;

Status status;

MainMenu mainMenu;
Gameplay gameplay;

boolean[] keys = new boolean[255];

void setup() {
  size(1280, 720);
  frameRate(60);
  noStroke();
  fill(0, 0, 0);

  mainMenu = new MainMenu();

  status = Status.MAIN_MENU;
}

void draw() {
  if (status == Status.MAIN_MENU) {
    mainMenu.update();
    mainMenu.draw();
  } else if (status == Status.GAME_PLAY) {
    gameplay.update();
    gameplay.draw();
  }
}

void mousePressed() {
  if (status == Status.MAIN_MENU) {
    mainMenu.mousePressed();
  } else if (status == Status.GAME_PLAY) {
    gameplay.mousePressed();
  }
}

void keyPressed() {
  keys[keyCode] = true;
}

void keyReleased() {
  keys[keyCode] = false;
}

boolean collided(float x1, float y1, int w1, int h1, float x2, float y2, int w2, int h2) {
  return x1 < x2 + w2 && x1 + w1 > x2 && y1 < y2 + h2 && h1 + y1 > y2;
}

