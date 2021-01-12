import processing.net.*; 
//import oscP5.*;
//import netP5.*;

//11:FD:35:DB:32:98:01:9F:F2:A7:29:30:27:ED:5F:D4:07:43:7D:48

Client c;
//OscP5 c;

int PORT = 574;
String cst_DirectIP = "192.168.4.1";

String screen, previousScreen;
String data = "";

String LocalIP = "192.168.1.25";

int size;

int millis;
int ping;

boolean pressed;


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

Frame DirectCoBtn = new Frame();
Frame LocalCoBtn = new Frame();


Frame ToggleBtn = new Frame();
Frame ExitBtn = new Frame();
Frame PingBtn = new Frame();




void setup() { 
  background(255, 0 ,0);
  size(displayWidth, displayHeight); 
  orientation(PORTRAIT);
  size = width/10;
  textSize(size);
  
  screen = "Menu";
  
  //define BTN
  DirectCoBtn.defineLength(width/4,height/8,width/2,height/4);
  DirectCoBtn.Border = color(255);
  DirectCoBtn.Fill = color(255, 64);
  DirectCoBtn.filling = false;
  
  LocalCoBtn.defineLength(width/4,height/2,width/2,height/4);
  LocalCoBtn.Border = color(255);
  LocalCoBtn.Fill = color(255, 64);
  LocalCoBtn.filling = false;
  
  
  
  ToggleBtn.defineLength(width/4,height/4,width/2,height/4);
  ToggleBtn.Border = color(0,0,255);
  ToggleBtn.Fill = color(0,0,255, 64);
  ToggleBtn.filling = false;
  
  ExitBtn.defineLength(width/4,5*height/8,width/2,height/4);
  ExitBtn.Border = color(255,0,0);
  ExitBtn.Fill = color(255,0,0, 64);
  ExitBtn.filling = false;
  
  PingBtn.defineLength(3*width/8, 0, width/4, height/16);
  PingBtn.Border = color(0,255,0);
  PingBtn.Fill = color(0,255,0, 64);
  ExitBtn.filling = false;
  
  //END define BTN
} 

void draw() {
  if( !screen.equals(previousScreen) ){
    
    previousScreen = screen;   
    switch(screen){
    
      case "Menu" :   MenuSetup();
      break;
      
      case "Local" :  LocalSetup();
      break;
      
      case "Direct" : DirectSetup();
      break;
      
      default : exit();
      break;
    
    }
    
  }
  
  switch(screen){
    
    case "Menu" :   MenuScreen();
                    MenuLoop();
    break;
    
    case "Local" :  LocalScreen();
                    LocalLoop();
    break;
    
    case "Direct" : DirectScreen();
                    DirectLoop();
    break;
    
    default : exit();
    break;
    
  }

  
}





void mousePressed(){
  
  switch(screen){
    
    case "Menu" : MenuPressed();
    break;
    
    case "Local" : LocalPressed();
    break;
    
    case "Direct" : DirectPressed();
    break;
    
    default : exit();
    break;
    
  }  
  
}

void mouseReleased(){
  
  
  switch(screen){
    
    case "Menu" : MenuReleased();
    break;
    
    case "Local" : LocalReleased();
    break;
    
    case "Direct" : DirectReleased();
    break;
    
    default : exit();
    break;
    
  }
  
}


void centerText(String text, float left, float right, float hauteur){
  
  float longueur = textWidth(text);
  float middle = (right + left)/2;
  
  text(text, middle-longueur/2, hauteur);
  
}

void textFrame(String text, Frame frame){
  
  int textSize = 0;
  do{
    textSize++;
    textSize(textSize);
    
  }while(textWidth(text) < frame.Width && textSize < frame.Height );
  textSize *= 0.95;
  textSize(textSize);
  
  text(text, (frame.Right + frame.Left)/2, (frame.Top + frame.Bottom) /2);
  
}

boolean clickFrame(Frame frame){
  
  if(mouseX > frame.Left && mouseX < frame.Right && mouseY > frame.Top && mouseY < frame.Bottom){
    return true;
  } 
  else{
    return false;
  }
}
