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
  }
  
  public int num_arcs(){
    return arc_list.size();
  }
  public Arc get_arc(int i){
    return arc_list.get(i);
  }
  
  public void add_beat(int w, color c){
    outer_radius += w;
    Arc arc = new Arc(center_x,center_y, w, c, outer_radius);
    arc_list.add(arc);
    outer_radius += w + padding;
  }
  
  public int center_x(){
    return center_x;
  }
  public int center_y(){
    return center_y;
  }
}

  