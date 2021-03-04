//Local connection SCREEN Code

void LocalSetup(){
  println("LOCAL SCREEN");
  
  c = new Client(this, LocalIP, PORT); //"192.168.1.25", 574
  println("laa");
  while(c == null){
     println("ERROR IN CONNECTION");
     if(mousePressed){
       c = new Client(this, LocalIP, PORT); //"192.168.1.25", 574
     }
  }
  c.write("CONNECTION \r\n");
  
  
  
}

void LocalScreen(){
 
 
 background(34,34,34);

 strokeWeight(4);
 noFill();
 
 ToggleBtn.display();
 ExitBtn.display();
 PingBtn.display();
 
 fill(255);
 textFrame("Toggle", ToggleBtn);
 textFrame("EXIT", ExitBtn);
 textFrame("PING", PingBtn);
 
 
 //swicth
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

void LocalLoop(){
  
  if( c.active() == false){
    c.stop(); 
    exit();
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





void LocalPressed(){
  
  
  if(clickFrame(ToggleBtn)){
    ToggleBtn.filling = true;
  }
  
  if(clickFrame(ExitBtn)){
    ExitBtn.filling = true;
  }
  
  if(clickFrame(PingBtn)){
    PingBtn.filling = true;
  }
  
  
  
}

void LocalReleased(){
  
  if(clickFrame(ToggleBtn) && ToggleBtn.filling ){
    ToggleBtn.filling = false;
   c.write("TOGGLE\r\n"); 
  }
  
  if(clickFrame(ExitBtn) && ExitBtn.filling){
    ExitBtn.filling = false;
   c.stop(); 
   exit();
  }
  
  if(clickFrame(PingBtn) && PingBtn.filling){
    PingBtn.filling = false;
    println("Ping Send !");
    millis = millis();
    c.write("PING\r\n");
  }
  
  ToggleBtn.filling = false;
  ExitBtn.filling = false;
  PingBtn.filling = false;
  
  
  
}
