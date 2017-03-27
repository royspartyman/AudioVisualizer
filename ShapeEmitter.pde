public class ShapeEmitter{
  
  protected ArrayList<Shape> shapes = new ArrayList();
  
  ShapeEmitter(){
    
  }
 
  public void draw(){
    for (Iterator<Shape> iterator = shapes.iterator(); iterator.hasNext();) {
       Shape shape = iterator.next();
       shape.draw();
       shape.lifetime--;
       if(shape.lifetime < 0){
           iterator.remove();
       }
    }
  }
 
};