 import processing.net.*; 


//11:FD:35:DB:32:98:01:9F:F2:A7:29:30:27:ED:5F:D4:07:43:7D:48

Client c; //création de l'objet client pour les connexions wifi

int PORT = 574;
String cst_DirectIP = "192.168.4.1";

String screen, previousScreen;
String data = "";

String LocalIP = "192.168.1.25";

int size;

int millis;
int ping;

boolean pressed;




Frame ToggleBtn = new Frame(); //permet de définir un cadre pour faciliter l'affichage
Frame ExitBtn = new Frame();
Frame PingBtn = new Frame();

Frame BackBtn = new Frame();
Frame PlusBtn = new Frame();

void setup() { //EQUIVALENT à la partie du main avant le while(1), n'est executé qu'un fois au lancement
  background(255, 0 ,0);
  size(displayWidth, displayHeight); 
  textAlign(CENTER,CENTER);
  //size(400,800);
  orientation(PORTRAIT);
  size = width/10;
  textSize(size);
  
  screen = "Menu";
  
  //define BTN

  
  //initialisation des cadres définitions de position, bordures, couleurs et remplissage
  
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
  
  BackBtn.defineLength(5,5,width/15,width/15);
  BackBtn.Border = color(255);
  BackBtn.Fill = color(255, 64);
  BackBtn.filling = false;
  
  PlusBtn.defineLength(width-5-width/15,5,width/15,width/15);
  PlusBtn.Border = color(255);
  PlusBtn.Fill = color(255,64);
  PlusBtn.filling = false;
  
  
  //END define BTN
} 

void draw() { //equivalent au while(1) dans un main, est executé en boucle et l'affichage est mis à jour à chaque fin de boucle
//L'affichage fonctionne par couches donc un élement placé au même endroit qu'un autre mais plus loin dans le code sera affiché par dessus
  
  if( !screen.equals(previousScreen) ){//si il y a un changement d'écran alors il faut lancer la fonction d'initialisation de l'écran et mettre à jour la variable qui enregistre l'écran actuel
    
    previousScreen = screen;   
    switch(screen){
    
      case "Menu" :   MenuSetup();
      break;
      
      case "Local" :  LocalSetup();
      break;
      
      case "Direct" : DirectSetup();
      break;
      
      case "Plus" : PlusSetup();
      break;
      
      default : println("NETWORK.draw");exit();
      break;
    
    }
    
  }
  
  switch(screen){ //lance le code d'affichage et de fonction de l'écran actuel
    
    case "Menu" :   MenuScreen();
                    MenuLoop();
    break;
    
    case "Local" :  LocalScreen();
                    LocalLoop();
    break;
    
    case "Direct" : DirectScreen();
                    DirectLoop();
    break;
    
    case "Plus" :   PlusScreen();
                    PlusLoop();
    break;
    
    default : println("NETWORK.draw2");exit();
    break;
    
  }

  
}





void mousePressed(){ //cette fonction est appelée automatiquement dès que l'évenement de la souris cliqué (ou écran touché sur smartphone) est enclenché
  
  switch(screen){ //on lance alors la fonction correspondante à l'écran actuel
    
    case "Menu" : MenuPressed();
    break;
    
    case "Local" : LocalPressed();
    break;
    
    case "Direct" : DirectPressed();
    break;
    
    case "Plus" : PlusPressed();
    break;
    
    default : println("NETWORK.mousePressed");exit();
    break;
    
  }  
  
}

void mouseReleased(){ //cette fonction est appelée automatiquement dès que l'évenement de la souris relachée (ou écran relaché sur smartphone) est enclenché
  
  
  switch(screen){//on lance alors la fonction correspondante à l'écran actuel
    
    case "Menu" : MenuReleased();
    break;
    
    case "Local" : LocalReleased();
    break;
    
    case "Direct" : DirectReleased();
    break;
    
    case "Plus" : PlusReleased();
    break;
    
    default : println("NETWORK.mouseReleased");exit();
    break;
    
  }
  
}

void keyPressed(){ //cette fonction est appelée automatiquement dès que l'évenement de touche du clavier enfoncé (ou clavier virtuel sur smartphone) est enclenché
  
  switch(screen){
      
    case "Plus" : PlusKeyPressed();
    break;
    
    default : println("NETWORK.keyPressed");exit();
    break;
    
  }  
  
}
