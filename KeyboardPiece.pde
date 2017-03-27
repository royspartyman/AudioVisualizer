  public class KeyboardPiece extends Keyboard{
    
      private int keyNumber;
      private boolean lightUp = false;
      private color randomColor;
      private float colourincrement=1;
      private int counter = 0;
      
      KeyboardPiece(int keyNumber){
       this.keyNumber = keyNumber;
      }
      
      public void draw(){
        float totalWidth = getKeyboardWidth();
        float totalHeight = getKeyboardHeight();
        float pieceWidth = totalWidth/12;
          
        stroke(0);
        
        if(lightUp){
          fill(randomColor);
        }
        else{
          fill(255);
        }
        
        rect(getMarginX()+pieceWidth*keyNumber, getMarginY(), pieceWidth, totalHeight);
        counter +=1;
        if(counter == 10){
          counter = 0;
          lightUp = false;
        }else{
          randomColor -=colourincrement;
        }
      }  
      
      public void setLight(boolean bool, color randomColor){
        lightUp = bool;
        this.randomColor = randomColor;
      }
}