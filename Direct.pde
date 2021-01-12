


void DirectSetup(){
  println("DIRECT SCREEN");
  
  c = new Client(this, cst_DirectIP, PORT); //"192.168.1.25", 574
  while(c == null){
     println("ERROR IN CONNECTION");
     if(mousePressed){
       c = new Client(this, cst_DirectIP, PORT); //"192.168.1.25", 574
     }
  }
  c.write("CONNECTION \r\n");
  
  
}



void DirectScreen(){
  background(34,34,34);
  
  //NON TERMINE
  
  
}


void DirectLoop(){
  //NON TERMINE
  
}

void DirectPressed(){
  
  
  //NON TERMINE
  
}


void DirectReleased(){
  
  
  //NON TERMINE
}
