public class Dialogue{
PImage dialogueref;
ArrayList <Line> lineGroup;
int x, y;
int frameCounter = 0;
int lineCounter = 0;
int spacer = 0;
int i = 0;
int maxFrame;
int numLines;
boolean visible = false;


public Dialogue(PImage text, int numLines, int sx, int sy, int x, int y, int maxFrame){
  this.x = x;
  this.y = y;
  lineGroup = new ArrayList<Line>();
  int starty = sy;
  int displayY = y;
  for(int i = 0; i < numLines; i++){
    Line toAdd = new Line(text, sx, starty, x, displayY, maxFrame);
    starty = starty + 53;
    displayY = displayY + 32;
    lineGroup.add(toAdd);
  }  
}

public void visible(){
  this.visible = true;
}

public void hide(){
  this.visible = false;
}

public void display(){
  if (visible){
       if(frameCount%5 == 0){
        spacer = spacer + 1;
      }
      if(i < lineGroup.size()){
        lineGroup.get(i).visible();
        for(Line toAdd : lineGroup){
          toAdd.display();
        }
          if(lineGroup.get(i).done()){
            i++;
            spacer = 0;
          }
      }
      else{
        for(Line toAdd : lineGroup){
          toAdd.display();
        }
      }
  }
}
}
