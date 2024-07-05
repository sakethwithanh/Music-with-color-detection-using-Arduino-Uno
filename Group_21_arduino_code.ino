// Include the necessary libraries
#include <Adafruit_TCS34725.h>
#include <SoftwareSerial.h>

// Define the pins for the color sensor
int sensorPin[] = {A0, A1, A2, A3}; // sensor pin array
int colorValues[4]; // array to store color sensor readings

// Define the pins for the speaker
#define SPEAKER_PIN 9

// Initialize the software serial object for the speaker
SoftwareSerial speakerSerial(0, SPEAKER_PIN);

void setup() {
  Serial.begin(9600); // initialize serial communication
  speakerSerial.begin(9600); // initialize the speaker serial communication
}

void loop() {
  // read color sensor values
  for (int i = 0; i < 4; i++) {
    colorValues[i] = analogRead(sensorPin[i]);
  }



  // play music based on color sensor readings
  if (colorValues[0] > colorValues[1] && colorValues[0] > colorValues[2]) {
    Serial.println("red.mp3");
  }
  else if (colorValues[1] > colorValues[0] && colorValues[1] > colorValues[2]) {
    Serial.println("green.mp3");
  }
  else if (colorValues[2] > colorValues[0] && colorValues[2] > colorValues[1]) {
    Serial.println("blue.mp3");
  }
  
  delay(100); // wait for 100 milliseconds
}