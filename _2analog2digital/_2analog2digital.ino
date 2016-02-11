/*
  DigitalReadSerial
 Reads a digital input on pin 2, prints the result to the serial monitor

 This example code is in the public domain.
 */

// digital pin 2 has a pushbutton attached to it. Give it a name:
//int pushButton = A0;
//BUTTONS
int pushButtonOff = 2;
int pushButtonRed = 4;

//JOYSTICK
const int xPin = 0; // analog pin connected to X output
const int yPin = 1; // analog pin connected to Y output

//DISTANCE SENSOR
const int trigPin = 9;
const int echoPin = 10;

//RGB LED
const int RED_PIN = 5;
const int GREEN_PIN = 6;
const int BLUE_PIN = 7;

// defines variables
long duration;
int distance;

// the setup routine runs once when you press reset:
void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  // make the pushbutton's pin an input:
  pinMode(pushButtonRed, INPUT);
  pinMode(pushButtonOff, INPUT);

  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input

  pinMode(RED_PIN, OUTPUT);
  pinMode(GREEN_PIN, OUTPUT);
  pinMode(BLUE_PIN, OUTPUT);
}

// the loop routine runs over and over again forever:
void loop() {
 

  
  // read the input pin:
  int buttonStateRed = digitalRead(pushButtonRed);
  int buttonStateOff = digitalRead(pushButtonOff);
  // print out the state of the button:
    Serial.println("buttonStateRed");
    Serial.println(buttonStateRed);
    Serial.println("buttonStateOff");
    Serial.println(buttonStateOff);

   

  //JOYSTICK
  int xPos = map(analogRead(xPin), 0, 1023, -255, 255); 
  Serial.print("xPos");
  Serial.print(xPos);
  Serial.print("\n");
  int yPos = map(analogRead(yPin), 0, 1023, -255, 255); 
  Serial.print("yPos");
  Serial.print(yPos);
  Serial.print("\n");
//
//   analogWrite(RED_PIN, xPos);
//   analogWrite(BLUE_PIN, yPos);
//   analogWrite(GREEN_PIN, xPos-yPos);


    //DISTANCE SENSOR
    digitalWrite(trigPin, LOW);
    //delayMicroseconds(2);
    // Sets the trigPin on HIGH state for 10 micro seconds
    digitalWrite(trigPin, HIGH);
    //delayMicroseconds(10);
    digitalWrite(trigPin, LOW);
    // Reads the echoPin, returns the sound wave travel time in microseconds
    duration = pulseIn(echoPin, HIGH);
    // Calculating the distance
    distance= duration*0.034/2;
    // Prints the distance on the Serial Monitor
    Serial.print("Distance: ");
    Serial.println(distance);


 //if buttonOff is pressed then shut it off
    if(buttonStateOff == 1){
      analogWrite(RED_PIN, 0);
      analogWrite(GREEN_PIN, 0);
      analogWrite(BLUE_PIN, 0);
      }

    //if buttonRED is pressed then it will only be red
    else if(buttonStateRed == 1){
      analogWrite(RED_PIN, 250);
      analogWrite(GREEN_PIN, 0);
      analogWrite(BLUE_PIN, 0);
      }

    else if (xPos > 0){
      analogWrite(RED_PIN, xPos);
      analogWrite(BLUE_PIN, xPos-yPos);
      analogWrite(GREEN_PIN, yPos);
      }

    else if (yPos>0){
     analogWrite(RED_PIN, yPos);
     analogWrite(BLUE_PIN, xPos-yPos);
     analogWrite(GREEN_PIN, xPos);
      
      }

      else if (distance <= 10){
        analogWrite(RED_PIN, distance*10);
        analogWrite(BLUE_PIN, distance*20);
        analogWrite(GREEN_PIN, distance*10);
        }
        
      else{
      //INITALLY HAVE LED ON GREEN
      analogWrite(RED_PIN, 50);
      analogWrite(GREEN_PIN, 50);
      analogWrite(BLUE_PIN, 150);
        }
  
  delay(1);        // delay in between reads for stability
}

