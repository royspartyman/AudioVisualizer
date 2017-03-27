public class Shape extends ShapeEmitter{
    
    private int shapeNumber;
    private boolean falling;
    private float shapeHeight;
    private float shapeWidth;
    private color shapeColor;
    private float fallSpeed;
    private ArrayList<String> colors = new ArrayList();
    private float lifetime;
    private float randomVal;
    
    Shape(int shapeNumber){
      this.randomVal = random(30,60);
      this.falling = true;
      this.shapeNumber = shapeNumber;
      this.shapeHeight = random(50, 78);
      this.shapeWidth = width/10;
      this.fallSpeed = random(5.6, 9.7);
      this.lifetime = random(300, 600);
    }
    
    public void draw(){
      
         fill(shapeColor);
      
         if(falling){
            if(height - shapeHeight <= 50){
              falling = false;
              shapeColor = generateRandomColor();
            }else{
              shapeHeight += fallSpeed;
            }
        }
        else{
          shapeHeight -= fallSpeed;
          if(shapeHeight < 50){
            falling = true;
            fallSpeed = random(7.7, 9.8);
            shapeColor = generateRandomColor();
          }
        }
        
        ellipse(shapeWidth*shapeNumber, shapeHeight, randomVal, randomVal);  
        
         }
         
         
     public color generateRandomColor(){
    color newColor = #000000;
    if(colors.size() != 0){
          float r = random(0, colors.size());
          String c = colors.get(int(r)).replace("#", "");
          c = "FF" + c.replace("#", "");
          newColor = unhex(c);
    }
    return newColor;
}  
         
         
  };
  
  
  