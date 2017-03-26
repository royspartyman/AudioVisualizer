import ddf.minim.*;
import ddf.minim.analysis.*;

Visualizer visualizer = new Visualizer();
boolean circlesOnMousePress = false;
boolean puddleOnMousePress = false;
boolean circlingSphereOnMousePress = false;

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
  if(key == 'a' || key == 'A'){
    for (int i = 0; i < visualizer.puddleList.size(); i++){
      visualizer.add_beat(i);
    }
  }
  else if(key == 'c' || key == 'C'){
     circlesOnMousePress = true;
     puddleOnMousePress = false;
  }
  else if (key == 'p' || key == 'P'){
    puddleOnMousePress = true;
    circlesOnMousePress = false;
  }
  else if (key == 's'|| key == 'S'){
    circlingSphereOnMousePress = true;
    circlesOnMousePress = false;
    puddleOnMousePress = false;
  }
}

public void mousePressed(){
  if (circlesOnMousePress){
    visualizer.addCircle(mouseX, mouseY);
  }
  else if(puddleOnMousePress){
    visualizer.puddleList.add(new Puddle(mouseX, mouseY, ((int)random(20,50))));
  }
  else if(circlingSphereOnMousePress){
    visualizer.addCirclingSphere(mouseX, mouseY);
  }
}