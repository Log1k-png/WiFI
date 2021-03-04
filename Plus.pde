//Plus screen code

String ssid = "";
String password = "";


boolean writingSSID = false;
boolean writingPassword = false;



Frame SSIDframe = new Frame();
Frame Passwordframe = new Frame();

Frame SSIDtext = new Frame();
Frame Passwordtext = new Frame();

Frame SaveBtn = new Frame();
Frame ConnectBtn = new Frame();

Frame LocalIPtext = new Frame();

void PlusSetup(){
  background(34,34,34);
  
  ssid = loadString("ssid");
  password = loadString("password");
  
  
  LocalIPtext.defineLength(width/4, height/32, width/2, height/16);
  LocalIPtext.Border = color(255);
  LocalIPtext.Fill = color(255,64);
  LocalIPtext.filling = false;
  
  SSIDtext.defineLength(width/8, height/8, 3*width/4, height/8);
  SSIDtext.Border = color(255);
  SSIDtext.Fill = color(255,64);
  SSIDtext.filling = false;
  
  SSIDframe.defineLength(width/8, height/4, 3*width/4, height/8);
  SSIDframe.Border = color(255);
  SSIDframe.Fill = color(255,64);
  SSIDframe.filling = false;
  
  Passwordtext.defineLength(width/8, 3*height/8, 3*width/4, height/8);
  Passwordtext.Border = color(255);
  Passwordtext.Fill = color(255,64);
  Passwordtext.filling = false;
  
  Passwordframe.defineLength(width/8, height/2, 3*width/4, height/8);
  Passwordframe.Border = color(255);
  Passwordframe.Fill = color(255,64);
  Passwordframe.filling = false;

  SaveBtn.defineLength(width/8, 3*height/4, 3*width/4, height/8);
  SaveBtn.Border = color(0, 0, 255);
  SaveBtn.Fill = color(0, 0, 255, 64);
  SaveBtn.filling = false;
  
  ConnectBtn.defineLength(width/4, 29*height/32, width/2, height/16);
  ConnectBtn.Border = color(0, 255, 0);
  ConnectBtn.Fill = color(0, 255, 0, 64);
  ConnectBtn.filling = false;
  
  }


void PlusScreen(){
  background(34,34,34);
  
  BackBtn.display();
  
  fill(255);
  textFrame("<", BackBtn);
  
  SSIDframe.display();
  Passwordframe.display();
  SaveBtn.display();
  ConnectBtn.display();
  
  
  fill(255);
  textFrame("Save", SaveBtn);
  textFrame("Connect", ConnectBtn);
  
  
  textFrame(ssid, SSIDframe);
  textFrame(password, Passwordframe);
  
  textFrame(LocalIP, LocalIPtext);
  textFrame("SSID", SSIDtext);
  textFrame("Password", Passwordtext);
  
}

void PlusLoop(){
  
  //if (c.available() > 0) {    // If there's incoming data from the client...
  //  data = c.readString();  
  //  println("-" + data + "-"); 
  //  LocalIP=data;
  //}
  
  
}



void PlusPressed(){
  
    println(height);
    
  if(clickFrame(BackBtn)){
    writingSSID = false;
    writingPassword = false;
    
    BackBtn.filling = true;
    
   
      closeKeyboard();
    
  }
  else if(clickFrame(SSIDframe)){
    writingSSID = true;
    writingPassword = false;
    

    
      openKeyboard();
    
  }
  else if(clickFrame(Passwordframe)){
    writingSSID = false;
    writingPassword = true;

   
      openKeyboard();
    
  }
  else if(clickFrame(SaveBtn)){
    writingSSID = false;
    writingPassword = false;
    
    SaveBtn.filling = true;
    
    
      closeKeyboard();
    
  }
  else if(clickFrame(ConnectBtn)){
    writingSSID = false;
    writingPassword = false;
    
    ConnectBtn.filling = true;
    
    
      closeKeyboard();
    
  }
  else{

    writingSSID = false;
    writingPassword = false;
    
      closeKeyboard();
    
  }
  
  
  SSIDframe.filling = writingSSID;
  Passwordframe.filling = writingPassword;
}
    
    


void PlusReleased(){
  
  
  
  if(clickFrame(BackBtn) && BackBtn.filling){
    BackBtn.filling = false;
    screen = "Direct";
  }
  
  if(clickFrame(SaveBtn) && SaveBtn.filling){
    SaveBtn.filling = false;
    saveVar(ssid, "ssid");
    saveVar(password, "password");
  }
  
  if(clickFrame(ConnectBtn) && ConnectBtn.filling){
    ConnectBtn.filling = false;
    c.write("ssid="+ssid+"passwd="+password+"\r\n");
    //send to esp
  }
 
  
}



void PlusKeyPressed(){
  
 
  if(keyCode != 59 && keyCode != 66){ //MAJ & ENTER
    if(writingSSID){
      if(keyCode == 67){ //backspace
        if(ssid.length() > 0){
          ssid = ssid.substring(0, ssid.length()-1);
        }
      }
      else{
        ssid += key;
      }
      
    }
    if(writingPassword){
      if(keyCode == 67){ //backspace
        if(password.length() > 0){
          password = password.substring(0, password.length()-1);
        }
      }
      else{
        password += key;
      }
      
    }
  }
  
  
  
  
  
}
