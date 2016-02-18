int pin = 11;

void setup() {
  // put your setup code here, to run once:
   pinMode(pin,OUTPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  tone(pin, 550);
  delay(500);
  tone(pin, 500);
  delay(500);
  tone(pin, 500);
  delay(500);
  tone(pin, 550);
  delay(500);
  tone(pin,650);
  delay(500);
}
