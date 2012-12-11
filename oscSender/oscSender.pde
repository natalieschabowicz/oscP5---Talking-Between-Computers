import oscP5.*;
import netP5.*;

OscP5 osc;

void setup() {
  osc = new OscP5(this, 1234); // listen on port 1243 
}

void draw() {
  
}

void mouseDragged() {
  // send a message 
  OscMessage msg = new OscMessage("/mouse");
  
  msg.add(mouseX); 
  msg.add(mouseY); 
  
  NetAddress destination = new NetAddress("127.0.0.1", 1235);
  osc.send(msg, destination); 
  
}

void keyPressed() {
  OscMessage msg = new OscMessage("/key");
  msg.add(key);
  NetAddress destination = new NetAddress("127.0.0.1", 1235);
  osc.send(msg, destination); 
  
}
