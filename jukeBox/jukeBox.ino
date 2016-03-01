

int potPin = 2;    // select the input pin for the potentiometer
int song1 = 3;   // select the pin for the LED
int song2 = 5;
int song3 = 6;
int song4 = 8;
int song5 = 9;
int song6 = 10;
int sensorValue;       // variable to store the value coming from the sensor
int outputValue;

int brightness = 50;

int buttonOn = 12;
int buttonOff = 13;

void setup() {
  Serial.begin(9600);
  
  pinMode(song1, OUTPUT);  // declare the ledPin as an OUTPUT
  pinMode(song2, OUTPUT); 
  pinMode(song3, OUTPUT); 
  pinMode(song4, OUTPUT); 
  pinMode(song5, OUTPUT); 
  pinMode(song6, OUTPUT); 

  pinMode(buttonOn, INPUT); 
  pinMode(buttonOff, INPUT); 
}

void loop() {

  if (buttonOn ==HIGH){
    state == 1;
    
    }

    if (buttonOff ==HIGH){
    state == 2;
    
    }

    
  sensorValue = analogRead(potPin);    // read the value from the sensor
  outputValue = map(sensorValue, 0, 1023, 0, 6);

  if (outputValue == 0){
    digitalWrite(song1, LOW);
    digitalWrite(song2, LOW);
    digitalWrite(song3, LOW);
    digitalWrite(song4, LOW);
    digitalWrite(song5, LOW);
    digitalWrite(song6, LOW);
    }
   else if (outputValue == 1){
    digitalWrite(song1, HIGH);
    digitalWrite(song2, LOW);
    digitalWrite(song3, LOW);
    digitalWrite(song4, LOW);
    digitalWrite(song5, LOW);
    digitalWrite(song6, LOW);
    }
    else if (outputValue == 2){
    digitalWrite(song1, LOW);
    digitalWrite(song2, HIGH);
    digitalWrite(song3, LOW);
    digitalWrite(song4, LOW);
    digitalWrite(song5, LOW);
    digitalWrite(song6, LOW);
    }
    else if (outputValue == 3){
    digitalWrite(song1, LOW);
    digitalWrite(song2, LOW);
    digitalWrite(song3, HIGH);
    digitalWrite(song4, LOW);
    digitalWrite(song5, LOW);
    digitalWrite(song6, LOW);
    }
    else if (outputValue == 4){
    digitalWrite(song1, LOW);
    digitalWrite(song2, LOW);
    digitalWrite(song3, LOW);
    digitalWrite(song4, HIGH);
    digitalWrite(song5, LOW);
    digitalWrite(song6, LOW);
    }
    else if (outputValue == 5){
    digitalWrite(song1, LOW);
    digitalWrite(song2, LOW);
    digitalWrite(song3, LOW);
    digitalWrite(song4, LOW);
    digitalWrite(song5, HIGH);
    digitalWrite(song6, LOW);
    }
    else if (outputValue == 6){
    digitalWrite(song1, LOW);
    digitalWrite(song2, LOW);
    digitalWrite(song3, LOW);
    digitalWrite(song4, LOW);
    digitalWrite(song5, LOW);
    digitalWrite(song6, HIGH);
    }
  
  
  
  Serial.print(outputValue);
  Serial.print("\n");
  delay(100);                  // stop the program for some time
}
