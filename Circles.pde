public class Circles{
  private int centerX;
  private int centerY;
  private float lifetime;
  private float angle;
  private boolean falling;
  
  ArrayList<String> colors = new ArrayList();
  
  Circles(int x, int y){
    this.centerX = x;
    this.centerY = y;
    this.falling = true;
    this.lifetime = random(700, 1600);
  }
  
  public void drawHigh(float avg, color newColor){
        if(falling){
          centerY += 6;
        }
        lifetime--;
        fill(newColor);
        stroke(3);
        strokeWeight(2);
        ellipseMode(CENTER);
        ellipse(centerX, centerY, avg*30, avg*30);
        angle++;
  }
  
   public void drawLow(float avg, color newColor){
        lifetime--;
        fill(#ffffff);
        ellipseMode(CENTER);
        strokeWeight(2 );
        ellipse(centerX, centerY, avg/1, avg/1);
   }
   
   

};