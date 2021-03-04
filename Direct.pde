
//Direct connection SCREEN Code

void DirectSetup(){
  println("DIRECT SCREEN");
  
  c = new Client(this, cst_DirectIP, PORT); //"192.168.4.1", 574
  println(c);
  println("Here");
  while(c == null){
     println("ERROR IN CONNECTION");
     if(mousePressed){
       c = new Client(this, cst_DirectIP, PORT); //"192.168.4.1", 574
     }
  }
  c.write("CONNECTION \r\n");
  
  
}



void DirectScreen(){
  background(34,34,34);
  
  textSize(size);
 background(34,34,34);

 strokeWeight(4);
 noFill();
 
 ToggleBtn.display();
 ExitBtn.display();
 PingBtn.display();
 BackBtn.display();
 PlusBtn.display();
 
 fill(255);
 textFrame("Toggle", ToggleBtn);
 textFrame("EXIT", ExitBtn);
 textFrame("PING", PingBtn);
 textFrame("<", BackBtn);
 textFrame("+", PlusBtn);
 
 //switch 
 line(0, height/10, width/10, height/10);
 line(2*width/10, height/10, 3*width/10, height/10);
 line(2*width/10, height/10, 2*width/10, height/10-15);
 if(pressed){
   line(width/10, height/10, 2*width/10, height/10);
 }
 else{
   
   line(width/10, height/10, 2*width/10, height/10 - 30);
 }
  //fin switch
  
}


void DirectLoop(){
  //NON TERMINE
  
  if( c.active() == false){
    //c.stop(); 
    //println("Direct.Loop");exit();
  }
  if (c.available() > 0) {    // If there's incoming data from the client...
    data = c.readString();  
    println("-" + data + "-"); 
    if(data.equals("BPON")){
      pressed = true;
    }
    else if(data.equals("BPOFF")){
      pressed = false;
    }
    else if(data.equals("PONG")){
      ping = millis() - millis;
      print("ping = ");
      println(ping);
    }
    else{
      println("Unknown CMD"); 
    }
  }
  
}

void DirectPressed(){
  
  

  if(clickFrame(ToggleBtn)){
    ToggleBtn.filling = true;
  }
  
  if(clickFrame(ExitBtn)){
    ExitBtn.filling = true;
  }
  
  if(clickFrame(PingBtn)){
    PingBtn.filling = true;
  }
  
  if(clickFrame(BackBtn)){
    BackBtn.filling = true;
    
  }
}


void DirectReleased(){
  
  
  
  if(clickFrame(ToggleBtn) && ToggleBtn.filling ){
    ToggleBtn.filling = false;
   c.write("TOGGLE\r\n"); 
  }
  
  if(clickFrame(ExitBtn) && ExitBtn.filling){
    ExitBtn.filling = false;
   c.stop(); 
   println("Direct.released");exit();
  }
  
  if(clickFrame(PingBtn) && PingBtn.filling){
    PingBtn.filling = false;
    println("Ping Send !");
    millis = millis();
    c.write("PING\r\n");
  }
  
  if(clickFrame(BackBtn) && BackBtn.filling){
    BackBtn.filling = false;
   c.stop(); 
   screen = "Menu";
  }
  
  ToggleBtn.filling = false;
  ExitBtn.filling = false;
  PingBtn.filling = false;
  BackBtn.filling = false;

  
}
