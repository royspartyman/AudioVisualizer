interface BeatDetectionListener{
  
  void highFreq(float avg);
  void lowFreq(float avg);
  
  void keyboardFrequencyHit(float band);
  
  void bang(float avg);
  
  void sphereMelody(float avg);
  
  void superBang(float avg);
  
}