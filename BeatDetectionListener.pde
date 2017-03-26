interface BeatDetectionListener{
  
  void highFreq(float avg);
  void lowFreq(float avg);
  
  void keyboardFrequencyHit(float band);
  
}