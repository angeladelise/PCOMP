
import processing.serial.*;
Serial port;

String pressed;
float num;

String data [] = new String [2];
int num1, num2;
boolean isNum1 = true;

String player1In;
float player1;

String player2In;
float player2;

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
int stateChange;

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
int continueCount;

void setup() {
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

  stateChange =0;
}

void draw() {
    background(0);
    
    //if(port.available()>0){
    
    //player1In = port.readStringUntil('\n');
    //}
   
   
   println(mouseX, mouseY);
   
//STATE 0 IS TITLE SCREEN
    if(state == 0){
    image(title, 0,0);

    if(mousePressed == true){
        state = 1;
        timer = 0;
        count = 1800;
        continueCount = 0;
        }
    }
    
 //STATE 1 IS ONE LIST OF SONGS
     if(state == 1){
     timer++;
      image(state1, 0,0);
      
     
     keyReleased();
      if(mouseX> 950 && mouseX < 990 && mouseY> 440 && mouseY < 500 && mousePressed){
        stateChange = 2;
        
      }
      
      if (stateChange == 2){
      state = 2;
      }
      
      //println(state);
      
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
    
 //STATE 2 IS SECOND LIST OF SONGS
    if(state == 2){
     timer++;
      image(state2, 0,0);
      
      keyReleased();
      
      if(mouseX> 20 && mouseX < 60 && mouseY> 440 && mouseY < 500 && mousePressed){
      stateChange = 1;
      }
      
      if (stateChange == 1){
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
    
//STATE 3 IS GAME STATE
  if(state == 3){
    image(state3, 0, 0);
    
    countDown = count/30;
    
    
    
    if(player1 > 0 && player2 > 0){
      continueCount = 1;
      countDown();
 
    }
    
    if(continueCount == 1){
      countDown();
    }
   
   // println("player1" + player1);
   // println("player2" + player2);

    //green player
    if(player1 > 10){
      fill(40,250,93);
      rectMode(CORNERS);
      
      float rectHeightMath = height-50-player1/3;
      float rectHeight = rectHeightMath;
      rect(width/2 - 150, height-50, width/2 - 300, rectHeight);
      
       if (rectHeightMath >= 750){
        rectHeight = 750;
      }
      
    }
    
    //purple player
    if(player2 > 10){
      fill(240,70,240);
      rectMode(CORNERS);
      
      float rectHeightMath2 = height-50-player2/3;
      float rectHeight2 = rectHeightMath2;
      rect(width/2 + 150, height-50, width/2 + 300, rectHeight2);
      
       if (rectHeightMath2 >= 750){
        rectHeight2 = 750;
      }
      
    }
    
   
    
    if(count == 0){
      state = 4;
    }
    
  } // end of state 3
  
 //STATE 4 IS RESULTS
 if (state == 4){
   //print results
   image(state4, 0, 0);
   
   //one direction
   if(player1 < 100){
   image(oneD, 0, height/2 - 150);
   }
   
   //miley
   if(player1 >= 100 && player1 < 200){
    image(miley, 0, height/2 - 150);
   }
   
   //rihanna
   if(player1 >= 200 && player1 < 300){
    image(rihanna, 0, height/2 - 150);
   }
   
   //beyonce
   if(player1 >= 300 && player1 < 400){
    image(beyonce, 0, height/2 - 200);
   }    
   
   //nicki
   if(player1 >= 400){
   image(nicki, 0, height/2 - 150);
   }
   
   if(mousePressed && mouseX> 320 && mouseX < 720 && mouseY > 540 && mouseY < 640){
       state = 0;
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


void serialEvent(Serial p) { 
  String serdata= p.readStringUntil('\n');
  
 // println(serdata);
  

  int n = int(serdata.trim());
 
 //FLIP FLOP BETWEEN TWO PLAYER VALUES!!!
 if (isNum1 == true) {
   player1 = n;
   isNum1 = false;
   } 
 else {
   player2 = n;
   isNum1 = true;
 }
 
 
 
 //println(player1);
 //println(player2);
  
 
}

void countDown(){
      fill(20, 255, 255);
      textSize(100);
      //noFill();
      strokeWeight(2);
     // tint(255, 250);
      ellipse(width/2, height/2, 150,150);
      textMode(CENTER);
      //dark blue fill
      fill(231, 58, 52);
      text(countDown, width/2-60, height/2+35);
      count --;
}