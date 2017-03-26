import java.awt.Rectangle ;

public class Keyboard {
  private float lifetime = 0;
  private int marginX = 0;
  private int marginY = 0;
  private float keyboardWidth = 0;
  private float keyboardHeight = 0;
  private ArrayList<KeyboardPiece> keyboardPieces = new ArrayList();
  
  ArrayList<String> keyColors = new ArrayList();
    
  Keyboard(){
    this.marginX = 150;
    this.marginY = 300;
    this.keyboardWidth = width - (2*marginX);
    this.keyboardHeight = height - (2*marginY);
  }
  
  public void draw(){
    fill(0);
    int startX = marginX;
    int startY = marginY;
    int rec_width = width - (2*marginX);
    int rec_height = height - (2*marginY);
    
    rect(startX, startY, rec_width, rec_height);
    
    for(KeyboardPiece keyboardPiece : keyboardPieces){
       keyboardPiece.draw();
    }
    
  }
  
    public float getMarginX(){
      return marginX;
  }
  
    public float getMarginY(){
      return marginY;
  }
  
  public float getKeyboardHeight(){
      return keyboardHeight;
  }
  
  public float getKeyboardWidth(){
      return keyboardWidth;
  }
  

};