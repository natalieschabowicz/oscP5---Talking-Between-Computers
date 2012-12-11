import oscP5.*;
import netP5.*;

import processing.serial.*;
Serial port;

OscP5 osc;
//float disappear = 0;
int LED = 8; 
void setup() {
  //println("Available serial ports:");
  //println(Serial.list());
  port = new Serial(this, Serial.list()[6], 9600); 
  
  osc = new OscP5(this, 1235); // listen on port 1243 
//osc.plug(this, "inByte", "/byte");  
  osc.plug(this, "mouseData", "/mouse");
   // osc.plug(this, "keyData", "/key");

}

//void keyData(char k) {
//  println(k);  
//}
//

//void mouseData(int mx, int my) {
//        ellipse(mx, my, 50, 50); 
//
//}
 //void inByte (int bt) 
 //{
 //}


void oscEvent( OscMessage msg ) {
  println(msg.addrPattern()); 
  if (msg.addrPattern().equals("/mouse")) {
    int mx = msg.get(0).intValue();
    
    // we just got a /mouse message
    int my = msg.get(1).intValue();
    //float my = msg.get(1).intValue();
    ellipse(mx, height/2, 50, 50);
    
    port.write(mx);
   // println(bt);
  }  
}


void draw() {
  
}
