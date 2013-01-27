/* 
 Plays random notes from a pentatonic sequence with potentiometer control of note heights and tempo
 
 for a fritzing circuit representation see fritzing folder
 
 created 19 Jan 2013
 by Eugenio Pombi
 @euxpom
 
 This example code is in the public domain.
 */
#include "pitches.h"

int speakerOut = 13; 
int potentiometerPin1 = 1;  //speed 
int potentiometerPin2 = 2;  //height of melody's notes
int melodySpeed = 0;
int melodyHeight = 0;  
int randomNumber = 0;  

// pentatonic notes:
int pentatonic[][5] = {
  {
    NOTE_G2,
    NOTE_A2,
    NOTE_B2,
    NOTE_D2,
    NOTE_E2
  },
  {
    NOTE_G3,
    NOTE_A3,
    NOTE_B3,
    NOTE_D3,
    NOTE_E3
  },
  {
    NOTE_G4,
    NOTE_A4,
    NOTE_B4,
    NOTE_D4,
    NOTE_E4
  },
  {
    NOTE_G5,
    NOTE_A5,
    NOTE_B5,
    NOTE_D5,
    NOTE_E5
  },
  {
    NOTE_G6,
    NOTE_A6,
    NOTE_B6,
    NOTE_D6,
    NOTE_E6
  },
};


void setup() {
  Serial.begin(9600);
  
  int melodySpeed = 0;
  int melodyHeight = 0;
  int randomNumber = 0;
}

void loop() {
  
  melodySpeed = analogRead(potentiometerPin1); 
  melodySpeed = map(melodySpeed, 0, 1024, 20, 500);
  
  melodyHeight = analogRead(potentiometerPin2); 
  melodyHeight = map(melodyHeight, 0, 1024, 0, 4);
  
  randomNumber = random(0, 4);
  
  
  Serial.print("height: ");
  Serial.print(melodyHeight);
  Serial.print("; ");
  Serial.print("speed: ");
  Serial.print(melodySpeed);
  Serial.print("\n");
  Serial.print("random: ");
  Serial.print(randomNumber);
  Serial.print("\n");
  
  tone(speakerOut, pentatonic[melodyHeight][randomNumber], 1000);
  delay(melodySpeed);
  
  // stop the tone playing:
  noTone(speakerOut);
}

