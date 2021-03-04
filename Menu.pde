//Menu screen code

Frame DirectCoBtn = new Frame();
Frame LocalCoBtn = new Frame();


void MenuSetup(){
  background(34,34,34);
  
  
  textAlign(CENTER,CENTER);
  
    DirectCoBtn.defineLength(width/4,height/8,width/2,height/4);
  DirectCoBtn.Border = color(255);
  DirectCoBtn.Fill = color(255, 64);
  DirectCoBtn.filling = false;
  
  LocalCoBtn.defineLength(width/4,height/2,width/2,height/4);
  LocalCoBtn.Border = color(255);
  LocalCoBtn.Fill = color(255, 64);
  LocalCoBtn.filling = false;
  
  }


void MenuScreen(){
  background(34,34,34);
  
  DirectCoBtn.display();
  LocalCoBtn.display();
  
  fill(255);
  textFrame("Direct Connection", DirectCoBtn);
  textFrame("Connect Through Local Network", LocalCoBtn);
  
  
  
}

void MenuLoop(){
  
  
  
}



void MenuPressed(){
  
  if(clickFrame(DirectCoBtn)){
    DirectCoBtn.filling = true;
  }
  
  else if(clickFrame(LocalCoBtn)){
    LocalCoBtn.filling = true;
  }
  
  
  
}

void MenuReleased(){
  
  
  
  if(clickFrame(DirectCoBtn) && DirectCoBtn.filling ){
    DirectCoBtn.filling = false;
    screen = "Direct";
  }
  
  else if(clickFrame(LocalCoBtn) && LocalCoBtn.filling ){
    LocalCoBtn.filling = false;
    screen = "Local";
  }
  DirectCoBtn.filling = false;
  LocalCoBtn.filling = false;
  
 
  
}
