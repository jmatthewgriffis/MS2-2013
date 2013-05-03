//
//  player.h
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/3/13.
//
//

#ifndef __MS2_Final_Project__player__
#define __MS2_Final_Project__player__

class player {
    
public:
    
    void setup();
    void update();
    void draw();
    
    ofImage screenGrab; // We'll use this object to store color data from the screen.
    
    float xPos;
    float yPos;
    float xVel;
    float yVel;
    float wide;
    float tall;
    bool moveUP;
    bool moveDOWN;
    bool moveLEFT;
    bool moveRIGHT;
    ofColor cPlayer;
    ofColor cUP; // The color just above the player.
    ofColor cDOWN; // The color just below the player.
    ofColor cLEFT; // The color just left of the player.
    ofColor cRIGHT; // The color just right of the player.
    int closeEnough; // How close do the colors have to be?
    bool cUPdiff; // Player color and cUP are close enough.
    bool cDOWNdiff; // Player color and cDOWN are close enough.
    bool cLEFTdiff; // Player color and cLEFT are close enough.
    bool cRIGHTdiff; // Player color and cRIGHT are close enough.
    int cVelR; // Speed of red color change.
    int cVelRdelay; // Delay when the color changes.
    int cVelG; // Speed of green color change.
    int cVelGdelay; // Delay when the color changes.
    int cVelB; // Speed of blue color change.
    int cVelBdelay; // Delay when the color changes.
    int randLimit; // Set the upper limit for random determinatino of color change timing.
    
};

#endif /* defined(__MS2_Final_Project__player__) */