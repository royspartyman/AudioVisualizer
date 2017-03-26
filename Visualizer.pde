import java.util.Iterator;

public class Visualizer implements BeatDetectionListener{
  
  final int start_radius = 100;
  final int num_circles = 5;
  final int frame_rate = 60;
  int count;
  int start_time;
  ArrayList<Puddle> puddleList = new ArrayList();
  ArrayList<Circles> circlesList = new ArrayList();
  ArrayList<String> colorList = new ArrayList();
  ArrayList<CirclingSphere> circlingSpheresList = new ArrayList();
  BufferedReader reader;
  String line = "";
  MusicService musicService;
  Keyboard keyboard = new Keyboard();
  
  Visualizer(){
    
  }


 public void initialize(Object obj){
    musicService = new MusicService(obj);
    musicService.setBDLListener(this);
    start_time = 0;
    puddleList = new ArrayList();
    musicService.playMusic();
    
    for(int i = 0; i < 12; i++){
      KeyboardPiece keyboardPiece = new KeyboardPiece(i);
      keyboard.keyboardPieces.add(keyboardPiece);
    }  
      
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
  if(millis() >= start_time + 33){
    start_time = millis();
    background(255);
    for(Puddle puddle : puddleList){
      for(Arc arc : puddle.arc_list){
        arc.update();
      }
    }
    for (int i = 0; i < circlingSpheresList.size(); i++){
      circlingSpheresList.get(i).draw(generateRandomColor(), generateRandomColor(), generateRandomColor(), generateRandomColor());
    }
    musicService.update();
    
    keyboard.draw();
  }
}

public void highFreq(float avg){
    for (Iterator<Circles> iterator = circlesList.iterator(); iterator.hasNext();) {
        Circles circle = iterator.next();
        if (circle.lifetime < 0) {
            iterator.remove();
        }
        else{
          circle.drawHigh(avg, generateRandomColor());
        }
    }

    int int_avg = round(avg, 3);
    Arc temp;
     for (Puddle pIndex : puddleList){
       count = 0;
         while (count < pIndex.num_arcs()){
           temp = pIndex.get_arc(count);
           if (temp.amplitude() == 0){
             temp.set_amplitude(int_avg);
             System.out.print("avg: " + int_avg + " ");
           }
           else if (int_avg == temp.amplitude()){
               temp.flip_growing();
               System.out.println("flip: " + int_avg);
           }
           count++;
         }
     }
    
}
public int round(float val, int precision){
  return (int)(val * (10*precision));
}

    

public void lowFreq(float avg){
    for (Iterator<Circles> iterator = circlesList.iterator(); iterator.hasNext();) {
        Circles circle = iterator.next();
        if (circle.lifetime < 0) {
            iterator.remove();
        }
        else{
          circle.drawLow(avg, generateRandomColor());
        }
    }
}

public void keyboardFrequencyHit(float band){
    float r;
    if(band < .1){
      r = random(0,1);
    }
    else if(band > .2 && band < .3){
      r = random(2,3);
    }
    else if(band >= .3 && band < .4){
      r = random(4,5);
    }
    else if(band >=.5 && band <.6){
      r = random(6,7);
    }
    else if(band >=.6 && band <.7){
      r = random(7,8);
    }
    else if(band >=.8 && band <.9){
      r = random(9,10);
    }
    else{
      r = random(11);
    }
    keyboard.keyboardPieces.get((int)r).setLight(true, generateRandomColor());
    
}


public void add_beat(int i){
    puddleList.get(i).add_beat((int)random(3,30),generateRandomColor());
}

public void addCircle(int x, int y){
  Circles circles = new Circles(x,y);
  circlesList.add(circles);
}

public void addCirclingSphere(int x, int y){
  CirclingSphere circlingSphere = new CirclingSphere(x,y);
  circlingSpheresList.add(circlingSphere);
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