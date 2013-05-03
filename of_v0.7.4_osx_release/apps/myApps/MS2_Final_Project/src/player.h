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
    void update(ofColor _collider);
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
    ofColor collider;
    ofColor cUP;
    ofColor cDOWN;
    ofColor cLEFT;
    ofColor cRIGHT;
    
};

#endif /* defined(__MS2_Final_Project__player__) */
