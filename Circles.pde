public class Circles{
  private int centerX;
  private int centerY;
 
  ArrayList<String> colors = new ArrayList();
  
  Circles(int x, int y){
    this.centerX = x;
    this.centerY = y;

  }
  
  public void drawHigh(float avg, color newColor){
        fill(newColor);
        stroke(0);
        strokeWeight(2);
        ellipseMode(CENTER);
        ellipse(centerX, centerY, avg*20, avg*20);
        
  }
  
   public void drawLow(float avg, color newColor){
        fill(#000000);
        ellipseMode(CENTER);
        strokeWeight(20);
        ellipse(centerX, centerY, avg/1, avg/1);
   }
   
   

};