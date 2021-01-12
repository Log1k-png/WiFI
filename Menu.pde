


void MenuSetup(){
  background(34,34,34);
  
  
  textAlign(CENTER,CENTER);
  
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
  
  
  
  if(clickFrame(DirectCoBtn) && DirectCoBtn.filling == true){
    DirectCoBtn.filling = false;
    screen = "Direct";
  }
  
  else if(clickFrame(LocalCoBtn) && LocalCoBtn.filling == true){
    LocalCoBtn.filling = false;
    screen = "Local";
  }
  DirectCoBtn.filling = false;
  LocalCoBtn.filling = false;
  
 
  
}
