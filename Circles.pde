public class Circles{
  
  private int centerX;
  private int centerY;
  float finalVal;
  ArrayList<String> colors = new ArrayList();
  
  Circles(int x, int y){
    this.centerX = x;
    this.centerY = y;
  }
  
  public void drawHigh(float avg, color newColor){
        if(avg >= .7){
          finalVal = avg*15;
        }
        else if(avg > .5 && avg < .7){
          finalVal = avg*25;
        }
        else if(avg > .3 && avg <= .5){
          finalVal = avg*35;
        }
        fill(newColor);
        stroke(#000000);
        strokeWeight(2);
        ellipseMode(CENTER);
        ellipse(centerX, centerY, finalVal , finalVal);
        
  }
  
   public void drawLow(float avg, color newColor){
        fill(#000000);
        ellipseMode(CENTER);
        strokeWeight(20);
        ellipse(centerX, centerY, avg/1, avg/1);
   }
   
   

};