public class CirclingSphere{
  private float lifetime;
  private float angle;
  private int centerX;
  private int centerY;
  private boolean radiusChange = false;
  private boolean decreasing = true;

  private int radius = 300;
  
  ArrayList<String> colors = new ArrayList();
  
  CirclingSphere(int x, int y){
    this.centerX = x;
    this.centerY = y;
    this.lifetime = random(300, 878);
  }
  
  public void draw(color colorOne, color colorTwo, color colorThree, color colorFour){
      fill(colorOne);
      
      for(int i = 0; i < 10; i++){
      
      float x=radius*cos(radians(angle)) + centerX;
      float y=radius*sin(radians(angle)) + centerY;
      ellipse(x, y, 30, 30);
      
      fill(colorTwo);
      float x1=radius*cos(radians(angle+90)) + centerX;
      float y1=radius*sin(radians(angle+90)) + centerY;
      ellipse(x1, y1, 30, 30);
      
      fill(colorThree);
      float x2=radius*cos(radians(angle+180)) + centerX;
      float y2=radius*sin(radians(angle+180)) + centerY;
      ellipse(x2, y2, 30, 30);
      
      fill(colorFour);
      float x3=radius*cos(radians(angle+270)) + centerX;
      float y3=radius*sin(radians(angle+270)) + centerY;
      ellipse(x3, y3, 30, 30);
      
     angle++;
      
     if(radiusChange && decreasing){
         radius--;
         if(radius < 5){
           decreasing = false;
         }
       }
       else if (radiusChange && !decreasing){
         radius++;
         if( radius > 250){
           decreasing = true;
         }
     }
      
   }
  }
  
};