public class Visualizer implements BeatDetectionListener{
  
  final int start_radius = 100;
  final int num_circles = 5;
  final int frame_rate = 60;
  int start_time;
  ArrayList<Puddle> puddleList = new ArrayList();
  ArrayList<Circles> circlesList = new ArrayList();
  ArrayList<String> colorList = new ArrayList();
  BufferedReader reader;
  String line = "";
  MusicService musicService;
  Visualizer(){
    
  }


 public void initialize(Object obj){
    musicService = new MusicService(obj);
    musicService.setBDLListener(this);
    start_time = 0;
    puddleList = new ArrayList();
    musicService.playMusic();
      
    reader = createReader("colors.txt");
      while(line != null){
         try {
          line = reader.readLine();
          colorList.add(line);
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
    for (int i = 0; i < puddleList.size(); i++){
      puddleList.get(i).update();
    }
    musicService.update();
  }
}

public void highFreq(float avg){
    for(Circles circles : circlesList){
          circles.drawHigh(avg, generateRandomColor());
    }
}

public void lowFreq(float avg){
    for(Circles circles : circlesList){
          circles.drawHigh(avg, generateRandomColor());
    }
}


public void add_beat(int i){
    puddleList.get(i).add_beat((int)random(3,10),generateRandomColor());
}

public void addCircle(int x, int y){
  Circles circles = new Circles(x,y);
  circlesList.add(circles);
}

public color generateRandomColor(){
    color newColor = #000000;
    if(colorList.size() != 0){
          float r = random(0, colorList.size());
          String c = colorList.get(int(r)).replace("#", "");
          c = "FF" + c.replace("#", "");
          newColor = unhex(c);
    }
    return newColor;
}
}