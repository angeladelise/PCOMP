
//DISTANCE SENSOR
const int trigPin = 9;
const int echoPin = 10;

//BUZZER
int pin = 11;

//WHITE LIGHTS
int blue1 = 5;
int blue2 = 6;

int brightness = 0;    // how bright the LED is
int fadeAmount = 5;    // how many points to fade the LED by

//RED LIGHTS
int red1 = 7;
int red2 = 8;

// defines variables
long duration;
int distance;

void setup() {
  // initialize serial communication at 9600 bits per second:
  Serial.begin(9600);
  // make the pushbutton's pin an input:
  pinMode(pin, OUTPUT);

  pinMode(trigPin, OUTPUT); // Sets the trigPin as an Output
  pinMode(echoPin, INPUT); // Sets the echoPin as an Input

  pinMode(blue1, OUTPUT);
  pinMode(blue2, OUTPUT);
  pinMode(red1, OUTPUT);
  pinMode(red2, OUTPUT);
}


void loop() {

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

     //   digitalWrite(red1, LOW);
      //  digitalWrite(red2, LOW);


      if (distance <= 10){
        digitalWrite(red1, LOW);
        digitalWrite(red2, LOW);

        analogWrite(blue1, 255);
        analogWrite(blue2, 255);
        
        tone(pin, 550);
        }
        
      else if (distance > 10){
        noTone(pin);

        digitalWrite(red1, HIGH);
        digitalWrite(red2, HIGH);

        analogWrite(blue1, brightness);
        analogWrite(blue2, brightness);
        // change the brightness for next time through the loop:
          brightness = brightness + fadeAmount;

          // reverse the direction of the fading at the ends of the fade:
          if (brightness == 0 || brightness == 255) {
            fadeAmount = -fadeAmount ;
          }
        }
  
  delay(1);        // delay in between reads for stability
}
