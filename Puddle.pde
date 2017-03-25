public class Puddle{
  private ArrayList<Arc> arc_list;
  final public int center_x;
  final public int center_y;
  final private int padding = 20;
  private int outer_radius;
  Puddle(){
    arc_list = new ArrayList();
    center_x = width/2;
    center_y = height/2;
    outer_radius = (int)random(50,100);
  }
  Puddle(int x, int y, int r){
    arc_list = new ArrayList();
    center_x = x;
    center_y = y;
    outer_radius = r;
  }
  public void add_beat(int w, color c){
    arc_list.add(new Arc(w, c, outer_radius));
    outer_radius += padding;
  }
  void update(){
    for (int i = 0; i < arc_list.size(); i++){
       arc_list.get(i).update();
    }
  }
  
}

  