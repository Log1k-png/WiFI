// Classe frame et ses fonctions pour affichage simplifié de cadres et de textes

class Frame{
    float Top;
    float Height;
    float Bottom;
    float Left;
    float Width;
    float Right;
    
    color Border;
    color Fill;
    boolean filling;
    
    boolean defineCorners(float TLx, float TLy, float BRx, float BRy){
      Top = TLy;
      Bottom = BRy;
      Height = Bottom - Top;
      Left = TLx;
      Right = BRx;
      Width = Right - Left;
      if(Height < 0 || Width < 0){
        return false;
      }
      else{
        return true;
      }
    }
    
    void defineLength(float TLx, float TLy, float W, float H){
      Top = TLy;
      Height = H;
      Bottom = Top + Height;
      Left = TLx;
      Width = W;
      Right = Left + Width;
    }
    
    
    void display(){

      stroke(Border);
      if(filling){
        fill(Fill);
      }
      else{
        noFill();
      }
      rect(Left, Top, Width, Height);
    }

    
}

void textFrame(String text, Frame frame){ //permet d'afficher un texte dans un cadre de manière à ce qu'il rentre bien dedans à la taille de police maximale
  
  //MUST PUT THIS IN SETUP
  //textAlign(CENTER,CENTER);
  
  int textSize = 0;
  do{
    textSize++;
    textSize(textSize);
    
  }while(textWidth(text) < frame.Width && textSize < frame.Height );
  textSize *= 0.95;
  textSize(textSize);
  
  text(text, (frame.Right + frame.Left)/2, (frame.Top + frame.Bottom) /2);
  
}


boolean clickFrame(Frame frame){ //permet de savoir si la souris est dans un certain cadre 
  
  if(mouseX > frame.Left && mouseX < frame.Right && mouseY > frame.Top && mouseY < frame.Bottom){
    return true;
  } 
  else{
    return false;
  }
}


void imgFrame(PImage image, Frame frame){ //permet d'afficher une image dans un cadre
  int marge = 10;
  image(image, frame.Left + marge, frame.Top + marge, frame.Width - 2*marge, frame.Height - 2*marge);
  
}
  
  
  
  
