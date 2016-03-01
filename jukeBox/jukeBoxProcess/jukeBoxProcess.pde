import processing.serial.*;
Serial port;

int state;

boolean s1;
boolean s2;
boolean s3;
boolean s4;
boolean s5;
boolean s6;

String strOutputValue;
float outputValue; 

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;

AudioPlayer song1; //<>//
AudioPlayer song2;
AudioPlayer song3;
AudioPlayer song4;
AudioPlayer song5;
AudioPlayer song6;

void setup(){
  //size(400,400);
  port = new Serial(this, "/dev/cu.usbmodem1421", 9600);
  port.bufferUntil('\n');
  
  minim = new Minim (this);
  song1 = minim.loadFile("BottomsUp.wav");
  //song1.loop();
    minim = new Minim (this);
  song2 = minim.loadFile("Drake-The Motto.mp3");
    minim = new Minim (this);
  song3 = minim.loadFile("Jeremih-DontTellEm.mp3");
    minim = new Minim (this);
  song4 = minim.loadFile("T.I.-Dead and Gone.mp3");
    minim = new Minim (this);
  song5 = minim.loadFile("Nicki Minaj-Feeling Myself.mp3");
    minim = new Minim (this);
  song6 = minim.loadFile("Zipper.mp3");
 //<>//
}

void draw(){
  if(port.available()>0){
    strOutputValue = port.readStringUntil('\n');
   
    if(strOutputValue != null){
      outputValue = float(strOutputValue);
      //println(strOutputValue);
      println(outputValue);
    }
      

    } // end of port loop
    
      
    if(outputValue == 1.0){
       state = 1;
       s1 = true;
       s2 = false;
       s3 = false;
       s4 = false;
       s5 = false;
       s6 = false;
      }
      
      else if(outputValue == 2.0){
       state = 2;
       s2 = true;
       s1 = false;
       s3 = false;
       s4 = false;
       s5 = false;
       s6 = false;
      }
      else if(outputValue == 3.0){
        state = 3;
        s3 = true;
        s1 = false;
        s2 = false;
        s4 = false;
        s5 = false;
        s6 = false;
        
      }
      else if(outputValue == 4.0){
        state = 4;
        s4 = true;
        s1 = false;
        s2 = false;
        s3 = false;
        s5 = false;
        s6 = false;
        
      }
      
      else if(outputValue == 5.0){
        s5 = true;
        s1 = false;
        s2 = false;
        s3 = false;
        s4 = false;
        s6 = false;
        
      }
      else if(outputValue == 6.0){
        s6 = true;
        s1 = false;
        s2 = false;
        s3 = false;
        s4 = false;
        s5 = false;
          
      }
      else if(outputValue == 0.0){
        state = 0;
        s1 = false;
        s2 = false;
        s3 = false;
        s4 = false;
        s5 = false;
        s6 = false;
        
      }

    if(s1 == true){
    s2 = false;
    s3=false;
    s4 = false;
    song1.play();
    song2.pause();
    song3.pause();
    song4.pause();
    song5.pause();
    song6.pause();
    
    }
    
    if(s2 == true){
    s1 = false;
    s3=false;
    s4 = false;
    song2.play();
    song1.pause();
    song3.pause();
    song4.pause();
    song5.pause();
    song6.pause();
    
    }
    if(s3 == true){
    s1 = false;
    s2=false;
    s4 = false;
    song3.play();
    song1.pause();
    song2.pause();
    song4.pause();
    song5.pause();
    song6.pause();
    
    }
    if(s4 == true){
    s1 = false;
    s2=false;
    s3 = false;
    song4.play();
    song1.pause();
    song2.pause();
    song3.pause();
    song5.pause();
    song6.pause();
    
    }
    if(s5 == true){
    s1 = false;
    s2=false;
    s3 = false;
    s4 = false;
    song5.play();
    song1.pause();
    song2.pause();
    song3.pause();
    song4.pause();
    song6.pause();
    
    }
    if(s6 == true){
    s1 = false;
    s2=false;
    s3 = false;
    s4 = false;
    s5 = false;
    song6.play();
    song1.pause();
    song2.pause();
    song3.pause();
    song4.pause();
    song5.pause();
    
    }
    
    if(state == 0){
    minim.stop();
    }


  
}