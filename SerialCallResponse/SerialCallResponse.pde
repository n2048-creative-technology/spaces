
import processing.serial.*;

Serial myPort;                       // The serial port
boolean first = true;
import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;


void setup() {
  size(256, 256);  // Stage size
  frameRate(10);
  noLoop();
  oscP5 = new OscP5(this, 12001);
  myRemoteLocation = new NetAddress("127.0.0.1", 12000);

  printArray(Serial.list());
  String portName =  "/dev/tty.usbmodem0007601801641";
  myPort = new Serial(this, portName, 115200);

  wakeUp();
  les();
  loop();
}

void wakeUp() {
  delay(1000);
  myPort.write(0x0D);
  delay(200);
  myPort.write(0x0D);
  int Tout = millis()+3000;
  while (Tout > millis());
}

void les() {
  delay(200);
  myPort.write(0x6C); //send "l"
  delay(200);
  myPort.write(0x65); //send "e"
  delay(200);
  myPort.write(0x73); //send "s"
  delay(200);
  myPort.write(0x0D); //send "Enter"
  delay(200);
}

void draw() {
  serial2Osc();
}


void processLine(String res) {
  try {
  String[] values = res.split(" ");
  for (int i = 0; i < values.length; i++ ) {
    String value = values[i];          
    if (value.indexOf("=") > 0) {
      String id = value.substring(0, 4);
      float distance = parseFloat(value.substring(value.indexOf("=")+1));
      Measurement m = new Measurement(id, distance);
      m.sendOverOsc(oscP5);
      m.log();
    }
  }
  }
  catch(Exception e){
   println(e);
  }
}

void serial2Osc() {
  if ( myPort.available() > 0) {  // If data is available,
    //println("data available", myPort.available());
    String res = myPort.readStringUntil('\n');
    println(res);
    if (res != null) {
      processLine(res);
    }
  }
}

void serialEvent(Serial myPort) {
}
