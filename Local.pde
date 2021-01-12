

void LocalSetup(){
  println("LOCAL SCREEN");
  
  c = new Client(this, LocalIP, PORT); //"192.168.1.25", 574
  while(c == null){
     println("ERROR IN CONNECTION");
     if(mousePressed){
       c = new Client(this, LocalIP, PORT); //"192.168.1.25", 574
     }
  }
  c.write("CONNECTION \r\n");
  
  
  
}

void LocalScreen(){
 
 textSize(size);
 background(34,34,34);

 strokeWeight(4);
 noFill();
 
 ToggleBtn.display();
 ExitBtn.display();
 PingBtn.display();
 
 fill(255);
 centerText("Toggle", ToggleBtn.Left, ToggleBtn.Right, ToggleBtn.Top+size);
 //text("TOGGLE",width/4+size/2,height/4+2*size);
 
 
 
 
 centerText("EXIT", ExitBtn.Left, ExitBtn.Right, ExitBtn.Top + size);
 //text("EXIT",width/4+size/2,5*height/8+2*size);
 
 
 textSize(height/24);
 centerText("PING", PingBtn.Left, PingBtn.Right, PingBtn.Top + height/24);
 //text("PING", 3*width/8 + height/16, height/24);
 
 line(0, height/10, width/10, height/10);
 line(2*width/10, height/10, 3*width/10, height/10);
 line(2*width/10, height/10, 2*width/10, height/10-15);
 if(pressed){
   line(width/10, height/10, 2*width/10, height/10);
 }
 else{
   
   line(width/10, height/10, 2*width/10, height/10 - 30);
 }
 
 
 
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
  
  
  if(mouseX > ToggleBtn.Left && mouseX < ToggleBtn.Right + width/2 && mouseY > ToggleBtn.Top && mouseY < ToggleBtn.Bottom){
    ToggleBtn.filling = true;
   c.write("TOGGLE\r\n"); 
  }
  
  if(mouseX > ExitBtn.Left && mouseX < ExitBtn.Right + width/2 && mouseY > ExitBtn.Top && mouseY < ExitBtn.Bottom){
    ExitBtn.filling = true;
   c.stop(); 
   exit();
  }
  
  if(mouseX > PingBtn.Left && mouseX < PingBtn.Right && mouseY> PingBtn.Top && mouseY< PingBtn.Bottom){
    PingBtn.filling = true;
    println("Ping Send !");
    millis = millis();
    c.write("PING\r\n");
  }
  
  
  
}

void LocalReleased(){
  
  ToggleBtn.filling = false;
  ExitBtn.filling = false;
  PingBtn.filling = false;
  
  
  
}
