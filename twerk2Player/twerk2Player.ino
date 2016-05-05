// I2C device class (I2Cdev) demonstration Arduino sketch for MPU6050 class
// 10/7/2011 by Jeff Rowberg <jeff@rowberg.net>
// Updates should (hopefully) always be available at https://github.com/jrowberg/i2cdevlib
//
// Changelog:
//      2013-05-08 - added multiple output formats
//                 - added seamless Fastwire support
//      2011-10-07 - initial release

/* ============================================
I2Cdev device library code is placed under the MIT license
Copyright (c) 2011 Jeff Rowberg

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
===============================================
*/

// I2Cdev and MPU6050 must be installed as libraries, or else the .cpp/.h files
// for both classes must be in the include path of your project
#include "I2Cdev.h"
#include "MPU6050.h"

// Arduino Wire library is required if I2Cdev I2CDEV_ARDUINO_WIRE implementation
// is used in I2Cdev.h
#if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
    #include "Wire.h"
#endif

// class default I2C address is 0x68
// specific I2C addresses may be passed as a parameter here
// AD0 low = 0x68 (default for InvenSense evaluation board)
// AD0 high = 0x69
MPU6050 accelgyro1;
MPU6050 accelgyro(0x69); // <-- use for AD0 high

int16_t ax, ay, az;
int16_t gx, gy, gz;
int16_t gx1, gy1, gz1;


// uncomment "OUTPUT_READABLE_ACCELGYRO" if you want to see a tab-separated
// list of the accel X/Y/Z and then gyro X/Y/Z values in decimal. Easy to read,
// not so easy to parse, and slow(er) over UART.
#define OUTPUT_READABLE_ACCELGYRO

// uncomment "OUTPUT_BINARY_ACCELGYRO" to send all 6 axes of data as 16-bit
// binary, one right after the other. This is very fast (as fast as possible
// without compression or data loss), and easy to parse, but impossible to read
// for a human.
//#define OUTPUT_BINARY_ACCELGYRO


#define LED_PIN 13
bool blinkState = false;



//BASELINE!!!

int baseline = 0;
int baseline2 = 0;
int timer = 0;

//SMOOTHING
const int numReadings = 50;

//FOR GYRO 1
int readings[numReadings];      // the readings from the analog input
int readIndex = 0;              // the index of the current reading
int total = 0;                  // the running total
int average = 0;                // the average

//FOR GYRO2
int readings2[numReadings];      // the readings from the analog input
int readIndex2 = 0;              // the index of the current reading
int total2 = 0;                  // the running total
int average2 = 0;                // the average

int mapping =0;

float score = 0;
float score2 =0;


void setup() {
    // join I2C bus (I2Cdev library doesn't do this automatically)
    #if I2CDEV_IMPLEMENTATION == I2CDEV_ARDUINO_WIRE
        Wire.begin();
        TWBR = 24; // 400kHz I2C clock (200kHz if CPU is 8MHz)
    #elif I2CDEV_IMPLEMENTATION == I2CDEV_BUILTIN_FASTWIRE
        Fastwire::setup(400, true);
    #endif

    // initialize serial communication
    // (38400 chosen because it works as well at 8MHz as it does at 16MHz, but
    // it's really up to you depending on your project)
    Serial.begin(9600);

    // initialize device
   // Serial.println("Initializing I2C devices...");
    accelgyro.initialize();
    accelgyro1.initialize();

    // verify connection
//    Serial.println("Testing device connections...");
//    Serial.println(accelgyro.testConnection() ? "MPU6050 connection successful" : "MPU6050 connection failed");
//    Serial.println(accelgyro1.testConnection() ? "MPU6050 connection successful" : "MPU6050 connection failed");

    // use the code below to change accel/gyro offset values
    /*
    Serial.println("Updating internal sensor offsets...");
    // -76	-2359	1688	0	0	0
    Serial.print(accelgyro.getXAccelOffset()); Serial.print("\t"); // -76
    Serial.print(accelgyro.getYAccelOffset()); Serial.print("\t"); // -2359
    Serial.print(accelgyro.getZAccelOffset()); Serial.print("\t"); // 1688
    Serial.print(accelgyro.getXGyroOffset()); Serial.print("\t"); // 0
    Serial.print(accelgyro.getYGyroOffset()); Serial.print("\t"); // 0
    Serial.print(accelgyro.getZGyroOffset()); Serial.print("\t"); // 0
    Serial.print("\n");
    accelgyro.setXGyroOffset(220);
    accelgyro.setYGyroOffset(76);
    accelgyro.setZGyroOffset(-85);
    Serial.print(accelgyro.getXAccelOffset()); Serial.print("\t"); // -76
    Serial.print(accelgyro.getYAccelOffset()); Serial.print("\t"); // -2359
    Serial.print(accelgyro.getZAccelOffset()); Serial.print("\t"); // 1688
    Serial.print(accelgyro.getXGyroOffset()); Serial.print("\t"); // 0
    Serial.print(accelgyro.getYGyroOffset()); Serial.print("\t"); // 0
    Serial.print(accelgyro.getZGyroOffset()); Serial.print("\t"); // 0
    Serial.print("\n");
    */

    // configure Arduino LED for
    pinMode(LED_PIN, OUTPUT);

    for (int thisReading = 0; thisReading < numReadings; thisReading++) {
    readings[thisReading] = 0;
     }

    score = 0; 

    for (int thisReading2 = 0; thisReading2 < numReadings; thisReading2++) {
    readings2[thisReading2] = 0;
     }

    score2 = 0; 

    timer =0;
    
}

void loop() {
    // read raw accel/gyro measurements from device
    accelgyro.getMotion6(&ax, &ay, &az, &gx, &gy, &gz);
    accelgyro1.getMotion6(&ax, &ay, &az, &gx1, &gy1, &gz1);

    // these methods (and a few others) are also available
    //accelgyro.getAcceleration(&ax, &ay, &az);
    //accelgyro.getRotation(&gx, &gy, &gz);

    #ifdef OUTPUT_READABLE_ACCELGYRO
        // display tab-separated accel/gyro x/y/z values
      //  Serial.print("FIRST GYRO");
       // Serial.print(ax); Serial.print("\t");
       // Serial.print(ay); Serial.print("\t");
       // Serial.print(az); Serial.print("\t");
      //  Serial.print(gx); Serial.print("\t");
      //  Serial.print(gy); Serial.print("\t");
       // Serial.println(gz);

      //  Serial.print("SECOND GYRO");
      //  Serial.print(gx1); Serial.print("\t");
      //  Serial.print(gy1); Serial.print("\t");
      //  Serial.println(gz1);

        
//FOR GYRO ONE
        // subtract the last reading:
        total = total - readings[readIndex];
        // read from the sensor:
        readings[readIndex] = (gz);
        // add the reading to the total:
        total = total + readings[readIndex];
        // advance to the next position in the array:
        readIndex = readIndex + 1;
            
        // if we're at the end of the array...
        if (readIndex >= numReadings) {
        // ...wrap around to the beginning:
          readIndex = 0;
          }
            
        // calculate the average:
        average = total / numReadings;

        


//FOR GYRO TWO
 // subtract the last reading:
        total2 = total2 - readings2[readIndex2];
        // read from the sensor:
        readings2[readIndex2] = (gz1);
        // add the reading to the total:
        total2 = total2 + readings2[readIndex2];
        // advance to the next position in the array:
        readIndex2 = readIndex2 + 1;
            
        // if we're at the end of the array...
        if (readIndex2 >= numReadings) {
        // ...wrap around to the beginning:
          readIndex2 = 0;
          }
            
        // calculate the average:
        average2 = total2 / numReadings;

        timer ++;
        
       if(timer == 600){
        baseline = average;
        Serial.print("BASELINE*************FOR PLAYER ONE");
        Serial.println(average);

        baseline2 = average2;
        Serial.print("BASELINE**********FOR PLAYER TWO");
        Serial.println(average2);
        }

      if(timer > 600){
        getScore();
        getScore2();
        }

      Serial.print("time");
      Serial.println(timer);
      

//PRINT OUT VALUES FOR EACH PLAYER!

       // Serial.print(average);
       // Serial.print("\t");
       // Serial.println(average2);
       // Serial.println("  ");

        
    #endif

//    #ifdef OUTPUT_BINARY_ACCELGYRO
//      //  Serial.write((uint8_t)(ax >> 8)); Serial.write((uint8_t)(ax & 0xFF));
//      //  Serial.write((uint8_t)(ay >> 8)); Serial.write((uint8_t)(ay & 0xFF));
//      //  Serial.write((uint8_t)(az >> 8)); Serial.write((uint8_t)(az & 0xFF));
//        Serial.write((uint8_t)(gx >> 8)); Serial.write((uint8_t)(gx & 0xFF));
//        Serial.write((uint8_t)(gy >> 8)); Serial.write((uint8_t)(gy & 0xFF));
//        Serial.write((uint8_t)(gz >> 8)); Serial.write((uint8_t)(gz & 0xFF));
//    #endif

    // blink LED to indicate activity
    blinkState = !blinkState;
    digitalWrite(LED_PIN, blinkState);


       
              
}


//FOR PLAYER ONE
void getScore(){
   int change = average-baseline;
   
//  if (change >10 && change < 15){
//    score = score +.1;
//    }
   if (change <= 20 && change >= 15){
    score = score +.2;
    }
   else if (change <= 30 && change >= 20){
    score = score +.3;
    }
   else if (change <= 40 && change >= 30){
    score = score +.4;
    }
    else if (change <= 50 && change >= 40){
    score = score +.5;
    }
    else if (change <= 60 && change >= 50){
    score = score +.6;
    }
    else if (change <= 70 && change >= 60){
    score = score +.7;
    }
    else if (change <= 80 && change >= 70){
    score = score +.8;
    }
    else if (change <= 90 && change >= 80){
    score = score +.9;
    }
    else if (change > 100){
    score = score +1;
    }

  Serial.println("Score*************");
  Serial.println(score);

    
  }

//FOR PLAYER TWO
  void getScore2(){
   int change2 = average2-baseline2;
   
//  if (change2 >10 && change2 < 15){
//    score2 = score2 +.1;
//    }
   if (change2 <= 20 && change2 >= 15){
    score2 = score2 +.2;
    }
   else if (change2 <= 30 && change2 >= 20){
    score2 = score2 +.3;
    }
   else if (change2 <= 40 && change2 >= 30){
    score2 = score2 +.4;
    }
    else if (change2 <= 50 && change2 >= 40){
    score2 = score2 +.5;
    }
    else if (change2 <= 60 && change2 >= 50){
    score2 = score2 +.6;
    }
    else if (change2 <= 70 && change2 >= 60){
    score2 = score2 +.7;
    }
    else if (change2 <= 80 && change2 >= 70){
    score2 = score2 +.8;
    }
    else if (change2 <= 90 && change2 >= 80){
    score2 = score2 +.9;
    }
    else if (change2 > 100){
    score2 = score2 +1;
    }

    Serial.println("score2*************");
   Serial.println(score2);

    
  }
