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
    void update(ofColor _background);
    void draw();
    
    ofImage screenGrab; // We'll use this object to store color data from the screen.
    
    int shiftX; // Shift the xPos by this much.
    int shiftY; // Shift the yPos by this much, and get up to no good.
    float rotX, rotY; // Store the intial rotation information in coordinates.
    float xPos;
    float yPos;
    int xVel;
    int yVel;
    int wide;
    float wideSoul; // Control the width of the soul emanation (of course!).
    float wideSoulVel; // Control the changing size of the soul.
    float soulMultiplier; // How much can the soul exceed the triangle?
    float tall;
    float tallSoul;
    int pixelSpacer; // Give sufficient distance from the triangle when checking the pixel data that the rotation won't screw things up.
    bool moveUP;
    bool moveDOWN;
    bool moveLEFT;
    bool moveRIGHT;
    bool youSpinMeRightRound; // Rotate about the hexagon.
    int spinMeFaster; // Control the speed of constricted rotation.
    bool suddenFreedom; // Move freely.
    ofColor background;
    ofColor cPlayer;
    ofColor cGhost; // Control the player's alpha value when a ghost.
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
    int degrees; // Rotate the triangle based on movement.
    int degreesVel; // Direction of rotation.
    int rotateWait; // Wait to rotate.
    int rotateWaitMax; // Default starting value for the timer.
    bool ghost; // Move through solid objects.
    
};

#endif /* defined(__MS2_Final_Project__player__) */
