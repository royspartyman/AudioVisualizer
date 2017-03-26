  public class KeyboardPiece extends Keyboard{
    
      private int keyNumber;
      private boolean lightUp = false;
      private color randomColor;
      
      KeyboardPiece(int keyNumber){
       this.keyNumber = keyNumber;
      }
      
      public void draw(){
        float totalWidth = getKeyboardWidth();
        float totalHeight = getKeyboardHeight();
        float pieceWidth = totalWidth/12;
          
        stroke(0);
        strokeWeight(4);
        
        if(lightUp){
          fill(randomColor);
        }
        else{
          fill(255);
        }
        
        rect(getMarginX()+pieceWidth*keyNumber, getMarginY(), pieceWidth, totalHeight);
        lightUp = false;
      }  
      
      public void setLight(boolean bool, color randomColor){
        lightUp = bool;
        this.randomColor = randomColor;
      }
}