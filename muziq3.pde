/*
  Melody
 
 Plays a melody
 
 circuit:
 * 8-ohm speaker on digital pin 8
 
 created 21 Jan 2010
 modified 30 Aug 2011
 by Tom Igoe
 
 This example code is in the public domain.
 
 http://arduino.cc/en/Tutorial/Tone
 
 */
#include "pitches.h"

int speakerOut = 8; 
int potentiometerPin1 = 1;  //speed 
int potentiometerPin2 = 2;  //height of melody's notes
int melodySpeed = 0;
int melodyHeight = 0;  

// notes in the melody:
int melody[] = {
  NOTE_C4,
  NOTE_DS4,
  NOTE_E4,
  NOTE_FS4,
  NOTE_A4,
  NOTE_B4,
  NOTE_C5,
  NOTE_DS5,
  NOTE_E5,
  NOTE_FS5,
  NOTE_A5,
  NOTE_B5
};

void setup() {
  Serial.begin(9600);
  
  int melodySpeed = 0;
  int melodyHeight = 0;
}

void loop() {
  
  melodySpeed = analogRead(potentiometerPin1); 
  melodySpeed = map(melodySpeed, 0, 1024, 20, 500);
  
  melodyHeight = analogRead(potentiometerPin2); 
  melodyHeight = map(melodyHeight, 0, 1024, 0, 7);
  
  /*
  Serial.print("height: ");
  Serial.print(melodyHeight);
  Serial.print("; ");
  Serial.print("speed: ");
  Serial.print(melodySpeed);
  Serial.print("\n");
  */
  
  tone(speakerOut, melody[melodyHeight], 1000);
  delay(melodySpeed);
  tone(speakerOut, melody[melodyHeight+1], 1000);
  delay(melodySpeed);
  tone(speakerOut, melody[melodyHeight+2], 1000);
  delay(melodySpeed);
  tone(speakerOut, melody[melodyHeight+3], 1000);
  delay(melodySpeed);
  tone(speakerOut, melody[melodyHeight+4], 1000);
  delay(melodySpeed);

  delay(200);
  // stop the tone playing:
  noTone(speakerOut);
}

