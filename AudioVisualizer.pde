import ddf.minim.*;
import ddf.minim.analysis.*;

Visualizer visualizer = new Visualizer();

void setup(){
  fullScreen();
  smooth(8);
  background(255);
  visualizer.initialize(this);
}

void draw(){
   visualizer.draw();
}

public void keyPressed(){
  if(key == ' '){
    for (int i = 0; i < visualizer.puddle_list.size(); i++){
      visualizer.add_beat(i);
    }
  }
}

public void mousePressed(){
  visualizer.puddle_list.add(new Puddle(mouseX, mouseY, ((int)random(20,50))));
}