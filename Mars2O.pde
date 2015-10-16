import java.util.Iterator;

Status status;

MainMenu mainMenu;
Gameplay gameplay;

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

boolean[] keys = new boolean[255];

void keyPressed() {
  keys[keyCode] = true;
}

void keyReleased() {
  keys[keyCode] = false;
}
