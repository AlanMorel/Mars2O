class DialogueBox {
  private PImage ref;
  private PImage [] box;
  private PImage Nicon;
  private PImage Cicon;
  private PImage displayIcon;
  private Dialogue [] lines;
  private int frame = 0;
  private int x, y;
  private int next = 0;
  private int past;
  private boolean visible = false;

  public DialogueBox(PImage text, int x, int y) {
    this.x = x;
    this.y = y;
    ref = loadImage("DialogueBox.png");
    Nicon = ref.get(0, 0, 107, 104);
    Cicon = ref.get(163, 0, 107, 104);
    box = new PImage[3];
    box[0] = ref.get(0, 112, 264, 105);
    box[1] = ref.get(0, 216, 470, 154);
    box[2] = ref.get(0, 371, 628, 200);
    lines = new Dialogue[14];
    //narration
    lines[0] = new Dialogue(text, 4, 0, 0, x + 20, y + 20, 10);
    //mission control to dasani
    lines[1] = new Dialogue(text,2, 0, 217, x + 175, y + 50, 8);
    //this is dasani
    lines[2] = new Dialogue(text,1, 0, 317, x + 175, y + 50, 7);
    //we are detecting
    lines[3] = new Dialogue(text,3, 0, 370, x + 175, y + 50, 8);
    //please exercise extreme caution
    lines[4] = new Dialogue(text,2, 0, 526, x + 175, y + 50, 5);
    //how many
    lines[5] = new Dialogue(text,2, 575, 0, x + 175, y + 50, 6);
    //give an estimate
    lines[6] = new Dialogue(text,2, 575, 112, x + 175, y + 50, 5);
    //its hard to say
    lines[7] = new Dialogue(text,2, 575, 217, x + 175, y + 50, 8);
    //over9000
    lines[8] = new Dialogue(text,1, 575, 317, x + 175, y + 50, 4);
    //what
    lines[9] = new Dialogue(text,1, 894, 0, x + 175, y + 50, 2);
    //how am I supposed
    lines[10] = new Dialogue(text,3, 894, 59, x + 175, y + 50, 7);
    //...(NASA)
    lines[11] = new Dialogue(text,1, 575, 370, x + 175, y + 50, 4);
    //do a barrel roll
    lines[12] = new Dialogue(text,1, 575, 630, x + 175, y + 50, 5);
    //...(captain)
    lines[13] = new Dialogue(text,1, 575, 370, x + 175, y + 50, 4);
    
  }
  public void iconDisplay(){
    if (next == 1 || next == 3 || next == 4 || next == 7 || next == 8 || next == 11|| next ==12){
        displayIcon = Nicon;
    }if (next == 2 || next == 5 || next == 6 || next == 9 || next == 13){
        displayIcon = Cicon; 
    }
    if (next != 0){
      image(displayIcon, x+30, y+30);
    }
  }
  
  
  public void visible(){
    this.visible = true;
  }
  
  public void hide(){
    lines[next].hide();
    if (frame != 0){
      frame--;
    }
    if(frame == 0&& frameCount%10 == 0){
      visible = false;
    }
  }

  public void switchLine(int lineNum){
    this.past = this.next;
    this.next = lineNum;
  }


  public void update() {
    //switch between lines
    if (visible){
      if (frame != 2 && frameCount%10 == 0) {
        frame++;
      }
    }
  }

  public void draw() {
    if (visible){
      image(box[frame], x, y);
      if (frame == 2) {
        lines[past].hide();
        lines[next].visible();
        lines[next].display();
        iconDisplay();
      }
    }
  }
}

