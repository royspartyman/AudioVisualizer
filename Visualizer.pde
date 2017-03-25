public class Visualizer implements BeatDetectionListener{
  
  final int start_radius = 100;
  final int num_circles = 5;
  final int frame_rate = 60;
  int start_time;
  ArrayList<Puddle> puddle_list = new ArrayList();
  ArrayList<String> color_list = new ArrayList();
  BufferedReader reader;
  String line = "";
  MusicService musicService;
  Circles circles = new Circles();
  Visualizer(){
    
  }


 public void initialize(Object obj){
    musicService = new MusicService(obj);
    musicService.setBDLListener(this);
    start_time = 0;
    puddle_list = new ArrayList();
    musicService.playMusic();
      
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
  }


public void draw(){
  if(millis() >= start_time + 100){
    start_time = millis();
    background(255);
    for (int i = 0; i < puddle_list.size(); i++){
      puddle_list.get(i).update();
    }
    musicService.update();
  }
}

public void highFreq(float avg){
    circles.drawHigh(avg, generateRandomColor());
}

public void lowFreq(float avg){
     circles.drawLow(avg, generateRandomColor());
}


public void add_beat(int i){
    puddle_list.get(i).add_beat((int)random(3,10),generateRandomColor());
}

public color generateRandomColor(){
    color newColor = #000000;
    if(color_list.size() != 0){
          float r = random(0, color_list.size());
          String c = color_list.get(int(r)).replace("#", "");
          c = "FF" + c.replace("#", "");
          newColor = unhex(c);
    }
    return newColor;
}
}