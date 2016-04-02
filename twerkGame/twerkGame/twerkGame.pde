
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
AudioPlayer song1;
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song4;

boolean s1;
boolean s2;
boolean s3;
boolean s4;

int state;

int timer = 0;

PImage title;
PImage state2;

void setup() {
 //port = new Serial(this, "/dev/cu.usbmodem1421", 250000);
  port = new Serial(this, "/dev/cu.usbmodem1421", 9600);
  port.bufferUntil('\n');
  
  size(1000, 700);

  
  minim = new Minim (this);
  
  state =1 ;
  
  minim = new Minim (this);
  song1 = minim.loadFile("BottomsUp.wav");
  //song1.loop();
    minim = new Minim (this);
  song2 = minim.loadFile("Drake-The Motto.mp3");
    minim = new Minim (this);
  song3 = minim.loadFile("Jeremih-DontTellEm.mp3");
    minim = new Minim (this);
  song4 = minim.loadFile("Zipper.mp3");
  
  title = loadImage("twerk.png");
  state2 = loadImage("twerk2.png");
}

void draw() {
    background(0);
    
    if(state == 1){
    //title screen
    image(title, 0,0);
    if(mousePressed == true){
        state = 2;
        }
    }
    
    if(state == 2){
     timer++;
      image(state2, 0,0);
      
     //choose a song
     if (timer > 30){
       if(mousePressed && mouseX> 82 && mouseX < 482 && mouseY > 330 && mouseY < 440){
       s1 = true;
       state = 3;
       }
       
       if(mousePressed && mouseX> 82 && mouseX < 482 && mouseY > 500 && mouseY < 610){
       s2 = true;
       state = 3;
       }
       
       if(mousePressed && mouseX> 530 && mouseX < 930 && mouseY > 330 && mouseY < 440){
       s3 = true;
       state = 3;
       }
   
       if(mousePressed && mouseX> 530 && mouseX < 930 && mouseY > 500 && mouseY < 610){
       s4 = true;
       state = 3;
       }
     }
   }//end of state 2
     
     println("X");
     println(mouseX);
     println("Y");
     println(mouseY);

//CONTROLS WHICH SONGS ARE PLAYING
    if(s1 == true){
    s2 = false;
    s3=false;
    s4 = false;
    song1.play();
    song2.pause();
    song3.pause();
    song4.pause();  
    }
    
    if(s2 == true){
    s1 = false;
    s3=false;
    s4 = false;
    song2.play();
    song1.pause();
    song3.pause();
    song4.pause();
    }
    if(s3 == true){
    s1 = false;
    s2=false;
    s4 = false;
    song3.play();
    song1.pause();
    song2.pause();
    song4.pause();
    }
    if(s4 == true){
    s1 = false;
    s2=false;
    s3 = false;
    song4.play();
    song1.pause();
    song2.pause();
    song3.pause();
    }
    
//STATE 3
  if(state == 3){
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
    
  } // end of state 3
  
 //STATE 4
 if (state == 4){
   //print results
 
 }
 

}