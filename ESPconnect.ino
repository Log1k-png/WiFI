#define BP 8
#define LED 7
#define PORT 574

void Toggle(short int pin);




short int connectionList[1000];
String NB = "closed";

String one = "AT+CIPSERVER=1," ;
String two = "\r\n";
String serverInit = one + PORT + two;
String received;
short int previous;
short int currentState;

void setup() {
  // put your setup code here, to run once:
  previous = LOW;
  pinMode(BP, INPUT);
  pinMode(LED, OUTPUT);
  Serial.begin(115200);
  Serial.setTimeout(10);
  delay(1000);
  Serial.write("ATE0\r\n");
  delay(100);
  //Serial.write("AT+SLEEP=0\r\n");
  //delay(100);
  Serial.write("AT+CIPMODE=0\r\n");
  delay(100);
  Serial.write("AT+CIPMUX=1\r\n");
  delay(100);
  Serial.print(serverInit);
  delay(1000);
  
  digitalWrite(LED, HIGH);
  delay(100);
  digitalWrite(LED, LOW);
  delay(100);
  digitalWrite(LED, HIGH);
  delay(100);
  digitalWrite(LED, LOW);
  
}

void loop() {
  // put your main code here, to run repeatedly:

  if(Serial.available()>0){
    received = Serial.readString();
    if(received.indexOf("+IPD,") == 0){
      NB = received.substring(5, received.indexOf(",",5));
    }
    if(received.indexOf("TOGGLE") != -1){
      Toggle(LED);
    }
    if(received.indexOf("PING") != -1){
      Serial.write("AT+CIPSEND=0,4\r\n");
      delay(10);
      Serial.write("PONG\r\n");
    }
    if(received.indexOf("CLOSED") != -1){
      NB= "closed";
      digitalWrite(LED, HIGH);
      delay(100);
      digitalWrite(LED, LOW);
      delay(100);
      digitalWrite(LED, HIGH);
      delay(100);
      digitalWrite(LED, LOW);
    }
  }

currentState = digitalRead(BP);
  if(1){//!NB.equals("closed")){
    if(currentState != previous){
      previous = currentState;
      if(currentState == HIGH){

        Serial.write("AT+CIPSEND=0,5\r\n");
//        Serial.write("0");
//        Serial.write(",5\r\n");
        delay(100);
        Serial.write("BPOFF\r\n");
        delay(100);
      }
      else{
        
        Serial.write("AT+CIPSEND=0,4\r\n");
//        Serial.write("0");
//        Serial.write(",5\r\n");
        delay(100);
        Serial.write("BPON\r\n");
        delay(100);
      }
      
      
    }
  }
  

}

void Toggle(short int pin){
  digitalWrite(pin, !digitalRead(pin));
}
