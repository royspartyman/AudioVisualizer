public class Puddle{
  private ArrayList<Arc> arc_list;
  final private int padding = 20;
  private int outer_radius;
  private final int center_x;
  private final int center_y;
  Puddle(){
    arc_list = new ArrayList();
    center_x = mouseX;
    center_y = mouseY;
    outer_radius = (int)random(50,100);
  }
  Puddle(int x, int y, int r){
    arc_list = new ArrayList();
    center_x = x;
    center_y = y;
    outer_radius = r;
    System.out.print("x: " + center_x + " y: " + center_y);
  }
  public void add_beat(int w, color c){
    arc_list.add(new Arc(center_x,center_y, w, c, outer_radius));
    outer_radius += padding;
  }
  void update(){
    for (int i = 0; i < arc_list.size(); i++){
       arc_list.get(i).update();
    }
  }
  public int center_x(){
    return center_x;
  }
  public int center_y(){
    return center_y;
  }
  
}

  