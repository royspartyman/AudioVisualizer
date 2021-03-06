import ddf.minim.*;
import ddf.minim.analysis.*;

class MusicService implements BeatDetectionListener{
  
  BeatDetectionListener beatdetectionListener;
  ArrayList<Float> freqs = new ArrayList();
  AudioPlayer song;
  Minim minim;
  FFT fft;
  int sampleRate = 44100;
  float smoothFactor = 0.25;
  float angle;
  float bpm = 80;
  float halfminute = 30000;
  int time;
  float interval = halfminute / bpm;
  
  
  MusicService(Object ob){
     minim = new Minim(ob);
     setBDLListener(this);
  }
  
  public void highFreq(float avg){}
  public void lowFreq(float avg){}
  public void keyboardFrequencyHit(float avg){}
  public void bang(float avg){}
  public void superBang(float avg){}
    public void sphereMelody(float avg){}
  
  public void playMusic(){
     song = minim.loadFile("smn.mp3", 2048);
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
      
      if(avg > 7 && time > 10000){
        beatdetectionListener.bang(avg);
      }
      
      if(avg > 25 && time > 25000){
        beatdetectionListener.sphereMelody(avg);
      }
      
      if(avg > 45  && time > 40000){
        beatdetectionListener.superBang(avg);
      }
      
    if (millis() - time > interval ) {
      beatdetectionListener.keyboardFrequencyHit(fft.getBand(i));
      time = millis();
    }
    
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