 import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.serial.Serial;

import java.io.*;

Serial myPort;  // Create object from Serial class
AudioPlayer redSound, blueSound, greenSound;
Minim minim;


void setup() {
  size(200, 200);  // Set the window size
  minim = new Minim(this);
 String portName = Serial.list()[0];  // Get the first available port
  myPort = new Serial(this, "COM7", 9600);  // Open the port at 9600 baud rate
  // Load audio files
  redSound = minim.loadFile("red.wav");
  blueSound = minim.loadFile("blue.wav");
  greenSound = minim.loadFile("green.wav");
}

void draw() {
  if (myPort.available() > 0) {  // If data is available
    String receivedData = myPort.readStringUntil('\n');  // Read the data until a newline character is received
    if (receivedData != null) {
      receivedData = trim(receivedData);  // Remove any whitespace characters
      if (receivedData.equals("red.mp3")) {
        //redSound.rewind();  // Rewind the audio file to the beginning
        blueSound.pause();
        greenSound.pause();  // Play the audio file

        redSound.play();  // Play the audio file
      } else if (receivedData.equals("blue.mp3")) {
        redSound.pause();
        greenSound.pause();  // Play the audio file
        blueSound.play();  // Play the audio file
      } else if (receivedData.equals("green.mp3")) {
        blueSound.pause();
        redSound.pause();  // Play the audio file
        greenSound.play();  // Play the audio file
      }
    }
  }
}

void stop() {
  // Close the audio files
  redSound.close();
  blueSound.close();
  greenSound.close();
  // Stop the audio engine
  minim.stop();
  super.stop();
}
