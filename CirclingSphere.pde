public class CirclingSphere{
  private float lifetime;
  private float angle;
  private int centerX;
  private int centerY;
  private boolean radiusChange = false;
  private int radius;
  
  ArrayList<String> colors = new ArrayList();
  
  CirclingSphere(int x, int y){
    this.centerX = x;
    this.centerY = y;
    this.lifetime = random(300, 878);
  }
  
  public void draw(color colorOne, color colorTwo, color colorThree, color colorFour){
      fill(colorOne);
      float x=300*cos(radians(angle)) + centerX;
      float y=300*sin(radians(angle)) + centerY;
      ellipse(x, y, 30, 30);
      
      fill(colorTwo);
      float x1=300*cos(radians(angle+90)) + centerX;
      float y1=300*sin(radians(angle+90)) + centerY;
      ellipse(x1, y1, 30, 30);
      
      fill(colorThree);
      float x2=300*cos(radians(angle+180)) + centerX;
      float y2=300*sin(radians(angle+180)) + centerY;
      ellipse(x2, y2, 30, 30);
      
      fill(colorFour);
      float x3=300*cos(radians(angle+270)) + centerX;
      float y3=300*sin(radians(angle+270)) + centerY;
      ellipse(x3, y3, 30, 30);
      angle++;
      
   }
};