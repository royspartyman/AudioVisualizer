import ddf.minim.*;
import ddf.minim.analysis.*;

class MusicService implements BeatDetectionListener{
  
  BeatDetectionListener beatdetectionListener;
  AudioPlayer song;
  Minim minim;
  FFT fft;
  int sampleRate = 44100;
  float smoothFactor = 0.25;
  float angle;
  
  MusicService(Object ob){
     minim = new Minim(ob);
     setBDLListener(this);
  }
  
  public void highFreq(float avg){}
  public void lowFreq(float avg){}
  
  public void playMusic(){
     song = minim.loadFile("eb.mp3", 2048);
     song.loop();
     fft = new FFT( song.bufferSize(), song.sampleRate());
  }
 
  
  public void update(){
    fft.forward(song.mix);
      
    for (int i = 0; i < 12; i++) {  // 12 is the number of bands 
      int lowFreq;
      if ( i == 0 ) {
        lowFreq = 0;
      } 
      else {
        lowFreq = (int)((sampleRate/2) / (float)Math.pow(2, 12 - i));
      }
  
      int hiFreq = (int)((sampleRate/2) / (float)Math.pow(2, 11 - i));
      int lowBound = fft.freqToIndex(lowFreq);
      int hiBound = fft.freqToIndex(hiFreq); 
      float avg = fft.calcAvg(lowBound, hiBound) * smoothFactor;
      
  
      if ((lowBound >= 32) && ( hiBound <= 64)) {
        beatdetectionListener.lowFreq(avg);
      }
      
      if ((lowBound >= 256) && ( hiBound <= 512)) {
        beatdetectionListener.highFreq(avg);
      }   
        
      //line(width/2, height/2, i, height - fft.getBand(i)*8);
      
    }
  }
  
  void setBDLListener(BeatDetectionListener beatdetectionListener){
    this.beatdetectionListener = beatdetectionListener;
} 
  
   void stop() {  
    song.close(); // always close Minim audio classes when you are finished with them
    minim.stop(); // always stop Minim before exiting
  }
  
}