import ddf.minim.*;
import ddf.minim.analysis.*;


class Colors{
  
  private ArrayList<String> tags= new ArrayList();
  
  void draw()
  {
    background(255);
    noStroke();
    frameRate(4);
    fft.forward(song.mix);
    
      // float bw = fft.getBandWidth(); // returns the width of each frequency band in the spectrum (in Hz).
    // println(bw); // returns 21.5332031 Hz for spectrum [0] & [512]
    
    color newColor = #000000;
    if(colors.tags.size() != 0){
          float r = random(0,colors.tags.size());
          String c = colors.tags.get(int(r)).replace("#", "");
          c = "FF" + c.replace("#", "");
          newColor = unhex(c);
    }
  
    for (int i = 0; i < 20; i++) {  // 12 is the number of bands 
    
      int lowFreq;
  
      if ( i == 0 ) {
        lowFreq = 0;
      } 
      else {
        lowFreq = (int)((sampleRate/2) / (float)Math.pow(2, 12 - i));
      }
  
      int hiFreq = (int)((sampleRate/2) / (float)Math.pow(2, 11 - i));
  
      // we're asking for the index of lowFreq & hiFreq
      int lowBound = fft.freqToIndex(lowFreq); // freqToIndex returns the index of the frequency band that contains the requested frequency
      int hiBound = fft.freqToIndex(hiFreq); 
  
      //println("range " + i + " = " + "Freq: " + lowFreq + " Hz - " + hiFreq + " Hz " + "indexes: " + lowBound + "-" + hiBound);
  
      // calculate the average amplitude of the frequency band
      float avg = fft.calcAvg(lowBound, hiBound);
      // println(avg);
  
      if ((lowBound >= 32) && ( hiBound <= 64)) {
        fill(newColor);
        ellipseMode(CENTER);
        ellipse(width/2, height/2, avg/1, avg/1);
      }
      else if ((lowBound >= 256) && ( hiBound <= 512)) {
        fill(newColor);
        stroke(255);
        strokeWeight(2);
        ellipseMode(CENTER);
        ellipse(width/2, height/2, avg*50, avg*50);
      }    
      else{
        float scale = 2 / (3 - cos(2*height/2 ));
        float x = scale * cos(height/2 );
        float y = scale * sin(2*height/2 ) / 2;
         ellipse(width/2 + x, height/2 + y, avg*50, avg*50);  
      }
    }
    
  }
  
  void stop() {  
    song.close(); // always close Minim audio classes when you are finished with them
    minim.stop(); // always stop Minim before exiting
  }
};