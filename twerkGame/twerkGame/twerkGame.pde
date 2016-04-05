
import processing.serial.*;
Serial port;

String pressed;
float num;

String averageIn;
float average;

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

AudioPlayer song5;
AudioPlayer song6;
AudioPlayer song7;
AudioPlayer song8;

boolean s1;
boolean s2;
boolean s3;
boolean s4;

boolean s5;
boolean s6;
boolean s7;
boolean s8;

int state;

int timer = 0;

PImage title;
PImage state1;
PImage state2;
PImage state3;
PImage state4;

PImage oneD;
PImage miley;
PImage rihanna;
PImage beyonce;
PImage nicki;

int count = 1800;
int countDown;


void setup() {
 //port = new Serial(this, "/dev/cu.usbmodem1421", 250000);
  port = new Serial(this, "/dev/cu.usbmodem1421", 9600);
  port.bufferUntil('\n');
  
  size(1000, 700);

  
  minim = new Minim (this);
  
  state =0 ;
  
  minim = new Minim (this);
  song1 = minim.loadFile("BottomsUp.wav");
  minim = new Minim (this);
  song2 = minim.loadFile("Drake-The Motto.mp3");
  minim = new Minim (this);
  song3 = minim.loadFile("Jeremih-DontTellEm.mp3");
  minim = new Minim (this);
  song4 = minim.loadFile("Zipper.mp3");
  
  minim = new Minim (this);
  song5 = minim.loadFile("MsNewBooty.mp3");
  minim = new Minim (this);
  song6 = minim.loadFile("BootyWhop.mp3");
  minim = new Minim (this);
  song7 = minim.loadFile("GetLow.wav");
  minim = new Minim (this);
  song8 = minim.loadFile("GDFR.wav");
  
  title = loadImage("twerk.png");
  state1 = loadImage("twerk2-2.png");
  state2 = loadImage("twerk2.png");
  state3 = loadImage("twerk3.png");
  state4 = loadImage("twerk4.png");
  
  oneD = loadImage("oneDirection.png");
  miley = loadImage("mileyC.png");
  rihanna = loadImage("rihannaC.png");
  beyonce = loadImage("beyonceC.png");
  nicki = loadImage("nickiMinaj.png");
  
  frameRate(30);

}

void draw() {
    background(0);
    
    if(port.available()>0){
    
    averageIn = port.readStringUntil('\n');
    }
    
    if(state == 0){
    //title screen
    image(title, 0,0);

    if(mousePressed == true){
        state = 1;
        timer = 0;
        count = 1800;
        }
    }
    
 //STATE 1
     if(state == 1){
     timer++;
      image(state1, 0,0);
      
     //if(keyReleased() && timer >30){
     // if (key == CODED) {
     //   if (keyCode == LEFT || keyCode == RIGHT) {
     //      state = 2;
     //     } 
     //    }
     // }
     
     keyReleased();
      
      //ARROWS
      if(mousePressed && mouseX > 950 && mouseX < 990 && mouseY > 400 && mouseY < 505 && timer >30){
      state = 2;
      }
      if(mousePressed && mouseX > 20 && mouseX < 60 && mouseY > 400 && mouseY < 505 && timer >30){
      state = 2;
      }
      
      //if(mousePressed && 
      
      //println(mouseX, mouseY);
      
      println(state);
      
     //choose a song
     if (timer > 30){
       if(mousePressed && mouseX> 82 && mouseX < 482 && mouseY > 330 && mouseY < 440){
       s5 = true;
       state = 3;
       }
       
       if(mousePressed && mouseX> 82 && mouseX < 482 && mouseY > 500 && mouseY < 610){
       s6 = true;
       state = 3;
       }
       
       if(mousePressed && mouseX> 530 && mouseX < 930 && mouseY > 330 && mouseY < 440){
       s7 = true;
       state = 3;
       }
   
       if(mousePressed && mouseX> 530 && mouseX < 930 && mouseY > 500 && mouseY < 610){
       s8 = true;
       state = 3;
       }
     }
   }//end of state 1
    
    
    if(state == 2){
     timer++;
      image(state2, 0,0);
      
      keyReleased();
      
      //ARROWS
      if(mousePressed && mouseX > 950 && mouseX < 990 && mouseY > 400 && mouseY < 505 && timer >30){
      state = 1;
      }
      if(mousePressed && mouseX > 20 && mouseX < 60 && mouseY > 400 && mouseY < 505 && timer >30){
      state = 1;
      }
      
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
     
     //println("X");
     //println(mouseX);
     //println("Y");
     //println(mouseY);

//CONTROLS WHICH SONGS ARE PLAYING
    if(s1 == true){
    s2 = false;
    s3=false;
    s4 = false;
    s5 = false;
    s6=false;
    s7 = false;
    s8 = false;
    song1.play();
    song2.pause();
    song3.pause();
    song4.pause();  
    song5.pause();
    song6.pause();
    song7.pause();
    song8.pause();
    }
    
    if(s2 == true){
    s1 = false;
    s3=false;
    s4 = false;
    s5 = false;
    s6=false;
    s7 = false;
    s8 = false;
    song2.play();
    song1.pause();
    song3.pause();
    song4.pause();
    song5.pause();
    song6.pause();
    song7.pause();
    song8.pause();
    }
    if(s3 == true){
    s1 = false;
    s2=false;
    s4 = false;
    s5 = false;
    s6=false;
    s7 = false;
    s8 = false;
    song3.play();
    song1.pause();
    song2.pause();
    song4.pause();
    song5.pause();
    song6.pause();
    song7.pause();
    song8.pause();
    }
    if(s4 == true){
    s1 = false;
    s2=false;
    s3 = false;
    s5 = false;
    s6=false;
    s7 = false;
    s8 = false;
    song4.play();
    song1.pause();
    song2.pause();
    song3.pause();
    song5.pause();
    song6.pause();
    song7.pause();
    song8.pause();
    }
    if(s5 == true){
    s1 = false;
    s2=false;
    s3 = false;
    s4 = false;
    s6=false;
    s7 = false;
    s8 = false;
    song5.play();
    song1.pause();
    song2.pause();
    song3.pause();
    song4.pause();
    song6.pause();
    song7.pause();
    song8.pause();
    }
    if(s6 == true){
    s1 = false;
    s2=false;
    s3 = false;
    s4 = false;
    s5=false;
    s7 = false;
    s8 = false;
    song6.play();
    song1.pause();
    song2.pause();
    song3.pause();
    song4.pause();
    song5.pause();
    song7.pause();
    song8.pause();
    }
    if(s7 == true){
    s1 = false;
    s2=false;
    s3 = false;
    s4 = false;
    s5=false;
    s6 = false;
    s8 = false;
    song7.play();
    song1.pause();
    song2.pause();
    song3.pause();
    song4.pause();
    song5.pause();
    song6.pause();
    song8.pause();
    }
    
    if(s8 == true){
    s1 = false;
    s2=false;
    s3 = false;
    s4 = false;
    s5=false;
    s6 = false;
    s7 = false;
    song8.play();
    song1.pause();
    song2.pause();
    song3.pause();
    song4.pause();
    song5.pause();
    song6.pause();
    song7.pause();
    }
    
//STATE 3
  if(state == 3){
    image(state3, 0, 0);
    
    countDown = count/30;
    
    
    
    if(averageIn != null){
      average = float(averageIn);
      
      fill(200, 100, 50);
      textSize(100);
      text(countDown, width/2 + 300, height/2 + 200);
      count --;
    
    }
    
   
    println("average" + average);

    
    if(average > 10){
      fill(240,100,0);
      rectMode(CORNERS);
      rect(width/2 - 50, height-50, width/2 - 200, height-50-average/2);
      
      
      //rect(width/2 - 200, height-50, 100, height-50-average);
    }
    
    if(count == 0){
      state = 4;
    }
    
  } // end of state 3
  
 //STATE 4
 if (state == 4){
   //print results
   image(state4, 0, 0);
   
   //one direction
   if(average < 300){
   image(oneD, 0, height/2 - 150);
   }
   
   //miley
   if(average >= 300 && average < 400){ //<>//
    image(miley, 0, height/2 - 150);
   }
   
   //rihana
   if(average >= 400 && average < 500){
    image(rihanna, 0, height/2 - 150);
   }
   
   //beyonce //<>//
   if(average >= 500 && average < 600){
    image(beyonce, 0, height/2 - 200);
   }
   
   //nicki
   if(average >= 600){
   image(nicki, 0, height/2 - 150);
   }
   
   if(mousePressed && mouseX> 320 && mouseX < 720 && mouseY > 540 && mouseY < 640){
       state = 1;
       }
   
 }
 


}// end of draw

void keyReleased(){
  
  if(state == 1){
  if (key == CODED) {
     if (keyCode == RIGHT) {
          state = 2;
           }     
      }
  }
  
  if(state == 2){
  if (key == CODED) {
     if (keyCode == LEFT) {
       state = 1;
           }     
    }
  }
}