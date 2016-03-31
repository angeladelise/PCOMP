
import processing.serial.*;
Serial port;

String pressed;
float num;

String averageIn;
float average;

String yawIn;
String pitchIn;
String rollIn;

float yaw;
float pitch;
float roll;

int count;
int imageCount;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;

AudioPlayer music;

void setup() {
 //port = new Serial(this, "/dev/cu.usbmodem1421", 250000);
  port = new Serial(this, "/dev/cu.usbmodem1421", 38400);
  port.bufferUntil('\t');
  
  size(640, 800);

  
  minim = new Minim (this);
}

void draw() {
    background(0);
    if(port.available()>0){
    //pressed = port.readStringUntil('\t');
    
    //yawIn = port.readStringUntil('\t');
    //pitchIn = port.readStringUntil('\t');
    //rollIn = port.readStringUntil('\n');
    
    averageIn = port.readStringUntil('\n');
    }
    
    if(averageIn != null){
      average = float(averageIn);
      
      
    
    }
    
   
    println("average" + average);

  // println("yaw" + yaw);
  //  println("pitch" + pitch);
  //  println("roll" + roll);
    
    if(average > 10){
      fill(255,0,0);
      rect(50, height-50, 100, height- average);
    }
 

}