final int start_radius = 100;
final int num_circles = 5;
final int frame_rate = 60;
int start_time;
ArrayList<Puddle> puddle_list;
int count;
void setup(){
  size(500,500);
  background(255);
  start_time = 0;
  count = (int)frameRate;
  puddle_list = new ArrayList();
}
void draw(){
  
  if(millis() >= start_time + 100){
    start_time = millis();
    background(255);
    for (int i = 0; i < puddle_list.size(); i++){
      puddle_list.get(i).update();
    }
  }

}
void keyPressed(){
  if(key == ' '){
    for (int i = 0; i < puddle_list.size(); i++){
      add_beat(i);
    }
  }
}
void mousePressed(){
  puddle_list.add(new Puddle(mouseX, mouseY, ((int)random(20,50))));
}
void add_beat(int i){
    puddle_list.get(i).add_beat((int)random(3,10),((int)random(0,255)));
}