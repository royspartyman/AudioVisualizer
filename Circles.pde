public class Circles{
  
  ArrayList<String> colors = new ArrayList();
  
  public void drawHigh(float avg, color newColor){
        fill(newColor);
        stroke(255);
        strokeWeight(20);
        ellipseMode(CENTER);
        ellipse(width/2, height/2, avg*75, avg*75);
  }
  
   public void drawLow(float avg, color newColor){
        fill(#000000);
        ellipseMode(CENTER);
        strokeWeight(20);
        ellipse(width/2, height/2, avg/1, avg/1);
   }
   
   

};