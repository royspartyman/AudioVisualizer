public class Arc{
  private int radius;
  private int arc_width;
  private int arc_start;
  private int arc_end;
  private boolean growing;
  private color c;
  private boolean alive;
  private final int center_x;
  private final int center_y;
  Arc(){
    c = 255;
    radius = 10;
    growing = true;
    alive = true;
    center_x = mouseX;
    center_y = mouseY;
  }
  
  Arc(int x, int y, int w, color my_c, int outer_radius){
    center_x = x;
    center_y = y;
    arc_width = w;
    c = my_c;
    radius = outer_radius;
    arc_start = (int)random(0, 360);
    arc_end = (int)random(0, 360);
    alive = true;
    if (arc_start > arc_end){
      int temp = arc_start;
      arc_start = arc_end;
      arc_end = temp;
    }
    if (random(0,1) >= .5)
      growing = false;
    else
      growing = true;

  }
  
  public void update(){
    fill(c);
    if (growing)
      arc_end++;
    else
      arc_end--;
    if (arc_end - arc_start >= 360) //has the arc start getting shorter
      growing = false;
    if (arc_end - arc_start <= 0) //deletes the arc if the length = 0;
      growing = true;
    draw_arc();
      //alive = false;
     
  }
  private void draw_arc(){
    noFill();
    strokeWeight(arc_width);
        arc(center_x, center_y, radius, radius, (arc_start*PI)/180, (arc_end*PI)/180);
  }
  public boolean alive(){
    return alive;
  }
}