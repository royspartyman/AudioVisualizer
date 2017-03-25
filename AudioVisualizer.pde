final int start_radius = 100;
final int num_circles = 5;
final int frame_rate = 60;
int start_time;
ArrayList<Puddle> puddle_list = new ArrayList();
ArrayList<String> color_list = new ArrayList();
BufferedReader reader;
String line = "";
int sampleRate = 44100;
int timeSize = 1024;
Circles circles = new Circles();
AudioPlayer song;
Minim minim;
FFT fft;

void setup(){
  size(500,500);
  background(255);
  
  start_time = 0;
  puddle_list = new ArrayList();
  
   minim = new Minim(this);
    
   song = minim.loadFile("sayMyName.wav", 2048);
   song.loop();
   fft = new FFT( song.bufferSize(), song.sampleRate() );
  
  reader = createReader("colors.txt");
    
    while(line != null){
       try {
        line = reader.readLine();
        color_list.add(line);
        line= reader.readLine();
        
      } catch (IOException e) {
        e.printStackTrace();
        line = null;
      }
    }
    
    circles.colors = color_list;
}

color generate_random_color(){
    color newColor = #000000;
    if(color_list.size() != 0){
          float r = random(0, color_list.size());
          String c = color_list.get(int(r)).replace("#", "");
          c = "FF" + c.replace("#", "");
          newColor = unhex(c);
    }
    return newColor;
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
    puddle_list.get(i).add_beat((int)random(3,10),generate_random_color());
}