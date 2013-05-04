//
//  player.cpp
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/3/13.
//
//

#include "ofMain.h"
#include "player.h"

//--------------------------------------------------------------
void player::setup(){
    
    shiftX = -3;
    shiftY = -80;
    wide = 20;
    wideSoul = wide;
    wideSoulVel = 0.5;
    soulMultiplier = 2;
    tall = powf((powf(wide, 2)-powf(wide/2, 2)), 0.5); // Use the Pythagorian theorem to calculate the height so that the triangle will be equilateral.
    tallSoul = tall;
    pixelSpacer = 10;
    xPos = ofGetWidth()/2-(wide/2)+shiftX;
    yPos = ofGetHeight()/2+shiftY;
    xVel = 5;
    yVel = 5;
    cPlayer.r = 255;
    cPlayer.g = 255;
    cPlayer.b = 255;
    cGhost = cPlayer;
    closeEnough = 5;
    cVelR = 1;
    cVelRdelay = 0;
    cVelG = 1;
    cVelGdelay = 0;
    cVelB = 1;
    cVelBdelay = 0;
    randLimit = 60;
    degrees = 0;
    degreesVel = 1;
    rotateWaitMax = 180;
    rotateWait = rotateWaitMax;
    youSpinMeRightRound = true;
    spinMeFaster = 10;
    
}

//--------------------------------------------------------------
void player::update(ofColor _background){
    
    // Start color change behavior.
    
    
    
    
    background = _background;
    
    // If the player color gets too close to the background color (which would prevent movement), change the player color:
    if ((fabs(cPlayer.r-background.r) < closeEnough) && (fabs(cPlayer.g-background.g) < closeEnough) && (fabs(cPlayer.b-background.b) < closeEnough)) {
        cPlayer.r += cVelR;
        cPlayer.g += cVelG;
        cPlayer.b += cVelB;
    }
    
    // Use a delay to control when the color changes:
    if (cVelRdelay > 0) cVelRdelay--;
    if (cVelGdelay > 0) cVelGdelay--;
    if (cVelBdelay > 0) cVelBdelay--;
    
    // Change the RGB color values. If one maxes or mins out, reverse the direction of change after a randomly-determined interval:
    if (cPlayer.r + cVelR < 255 && cPlayer.r + cVelR > 1) cPlayer.r += cVelR;
    else {
        cVelRdelay = int(ofRandom(randLimit));
        if (cVelRdelay == 0) cVelR *= -1;
    }
    if (cPlayer.g + cVelG < 255 && cPlayer.g + cVelG > 1) cPlayer.g += cVelG;
    else {
        cVelGdelay = int(ofRandom(randLimit));
        if (cVelGdelay == 0) cVelG *= -1;
    }
    if (cPlayer.b + cVelB < 255 && cPlayer.b + cVelB > 1) cPlayer.b += cVelB;
    else {
        cVelBdelay = int(ofRandom(randLimit));
        if (cVelBdelay == 0) cVelB *= -1;
    }
    
    // Print the RGB values of the player color:
    //cout<<int(cPlayer.r)<<", "<<int(cPlayer.g)<<", "<<int(cPlayer.b)<<endl;
    
    cGhost = cPlayer;
    cGhost.a = 75; // When the player goes into "ghost" mode, become transparent.
    
    
    
    
    // End color change behavior.
    //-------------------------------------
    // Start collision/movement behavior.
    
    
    
    
    // Take the data from the screen and convert it into an image. We'll use the pixel data for gameplay:
    screenGrab.grabScreen(0, 0, ofGetWidth(), ofGetHeight());
    
    /* We're going to compare the color of the player with the color of the surrounding environment and use that to control movement. However, the player/environmental color changes and there is a tiny bit of lag before the pixel data updates. This could prevent the collision from registering, so we use some mathematical jiujitsu. Instead of checking if the pixel data returns the identical color as the player, we check if it's within a certain range (big enough to cover the lag). */
    
    if ((fabs(cPlayer.r-cUP.r) <= closeEnough) && (fabs(cPlayer.g-cUP.g) <= closeEnough) && (fabs(cPlayer.b-cUP.b) <= closeEnough)) cUPdiff = false;
    else cUPdiff = true;
    if ((fabs(cPlayer.r-cDOWN.r) <= closeEnough) && (fabs(cPlayer.g-cDOWN.g) <= closeEnough) && (fabs(cPlayer.b-cDOWN.b) <= closeEnough)) cDOWNdiff = false;
    else cDOWNdiff = true;
    if ((fabs(cPlayer.r-cLEFT.r) <= closeEnough) && (fabs(cPlayer.g-cLEFT.g) <= closeEnough) && (fabs(cPlayer.b-cLEFT.b) <= closeEnough)) cLEFTdiff = false;
    else cLEFTdiff = true;
    if ((fabs(cPlayer.r-cRIGHT.r) <= closeEnough) && (fabs(cPlayer.g-cRIGHT.g) <= closeEnough) && (fabs(cPlayer.b-cRIGHT.b) <= closeEnough)) cRIGHTdiff = false;
    else cRIGHTdiff = true;
    
    if (youSpinMeRightRound) {
        
    }
    else {
        
        // Allow player movement if the key is pressed and the pixel in the direction of movement is a different color than the player:
        
        // But first, check if a ghost, and if so allow movement regardless:
        if (ghost) cUPdiff = cDOWNdiff = cLEFTdiff = cRIGHTdiff = true;
        
        if (moveUP == true && cUPdiff) yPos += -yVel;
        if (moveDOWN == true && cDOWNdiff) yPos += yVel;
        if (moveLEFT == true && cLEFTdiff) xPos += -xVel;
        if (moveRIGHT == true && cRIGHTdiff) xPos += xVel;
        
    }
    
    // If the player moves offscreen:
    if (xPos < -wide || xPos > ofGetWidth() || yPos < -tall || yPos > ofGetHeight()) {
        // First, prevent a pixel check since the player is offscreen:
        cUP = (0,0,0);
        cDOWN = (0,0,0);
        cLEFT = (0,0,0);
        cRIGHT = (0,0,0);
        // Then shift the player's position to the other side:
        if (xPos < -wide) xPos = ofGetWidth()-wide;
        if (xPos > ofGetWidth()) xPos = 0;
        if (yPos < -tall) yPos = ofGetHeight()-tall;
        if (yPos > ofGetHeight()) yPos = 0;
    }
    
    
    
    
    // End collision/movement behavior.
    //-------------------------------------
    // Start rotation behavior.
    
    if (suddenFreedom == true) {
        xPos = ofGetWidth()/2+shiftX-rotX;
        yPos = ofGetHeight()/2+rotY;
        youSpinMeRightRound = false;
        suddenFreedom = false;
    }
    
    cout<<"rotX = "<<rotX<<"; rotY = "<<rotY<<"; xPos = "<<xPos<<"; yPos = "<<yPos<<endl;
    //cout<<"freedom="<<suddenFreedom<<"; youspinme="<<youSpinMeRightRound<<endl;
    
    
    // We'll set the rotation based on what directions are pressed.
    // First, we check if movement is restricted.
    if (youSpinMeRightRound) {
        if (moveLEFT) degrees -= spinMeFaster;
        if (moveRIGHT) degrees += spinMeFaster;
        if (degrees > 360) degrees = 0;
        if (degrees < 0) degrees = 360;
    }
    else { // Free movement is allowed?
        // If no directions are pressed, wait a bit, then rotate:
        if (!moveUP && !moveDOWN && !moveLEFT && !moveRIGHT) { // Nothing pressed?
            if (rotateWait > 0) rotateWait--; // Deplete the timer...
            else degrees += degreesVel; // ...then start rotating.
        }
        
        else { // Something pressed?
            rotateWait = rotateWaitMax; // Reset the timer.
            
            // Change the degree of rotation appropriate to the movement:
            if (moveUP == true) {
                if (moveLEFT == true) degrees = 315;
                else if (moveRIGHT == true) degrees = 45;
                else degrees = 0;
            }
            else if (moveDOWN == true) {
                if (moveLEFT == true) degrees = 225;
                else if (moveRIGHT == true) degrees = 135;
                else degrees = 180;
            }
            else if (moveLEFT == true) degrees = 270;
            else if (moveRIGHT == true) degrees = 90;
        }
        
        // Vary the direction of rotation with some randomness:
        if (degrees < 0 || degrees > 360) {
            if (ofRandom(1) < 0.5f) degreesVel *= -1;
            else {
                if (degrees < 0) degrees = 360;
                else if (degrees > 360) degrees = 0;
            }
        }
    }
    
    
    
    
    // End rotation behavior.
    //-------------------------------------
    // Start soul behavior.
    
    
    
    
    // The size of the "soul" triangle fluctuates between two limits:
    wideSoul += wideSoulVel;
    tallSoul = powf((powf(wideSoul, 2)-powf(wideSoul/2, 2)), 0.5); // Use the Pythagorian theorem to calculate the height so that the triangle will be equilateral.
    
    if (wideSoul >= wide*soulMultiplier || wideSoul <= wide) wideSoulVel *= -1;
    
    
    
    
    // End soul behavior.
    //-------------------------------------
    // New stuff goes here.
    
    
    
    
    // New stuff goes here.
    
}

//--------------------------------------------------------------
void player::draw(){
    
    unsigned char * pixels = screenGrab.getPixels();
    
    // Prep for collision detection with color analysis.
    
    // Debug the location of the relevant pixels:
    /*
     ofLine(int(xPos+wide/2), int(yPos-pixelSpacer), int(xPos+wide/2), int(yPos-pixelSpacer)-10); // UP
     ofLine(int(xPos+wide/2), int(yPos+tall+pixelSpacer), int(xPos+wide/2), int(yPos+tall+pixelSpacer)+10); // DOWN
     ofLine(int(xPos-pixelSpacer), int(yPos+tall/2), int(xPos-pixelSpacer)-10, int(yPos+tall/2)); // LEFT
     ofLine(int(xPos+wide+pixelSpacer), int(yPos+tall/2), int(xPos+wide+pixelSpacer)+10, int(yPos+tall/2)); // RIGHT
     */
    
    // Check if the player is onscreen, and if so, store the pixel data:
    if (xPos >= 0 && xPos <= ofGetWidth()-wide && yPos >= 0 && yPos <= ofGetHeight()-tall) {
        
        // Store the color above the player:
        cUP.r = pixels[ (int(yPos-pixelSpacer) * screenGrab.width + int(xPos+wide/2)) * 3];
        cUP.g = pixels[ (int(yPos-pixelSpacer) * screenGrab.width + int(xPos+wide/2)) * 3 + 1];
        cUP.b = pixels[ (int(yPos-pixelSpacer) * screenGrab.width + int(xPos+wide/2)) * 3 + 2];
        
        // Store the color below the player:
        cDOWN.r = pixels[ (int(yPos+tall+pixelSpacer) * screenGrab.width + int(xPos+wide/2)) * 3];
        cDOWN.g = pixels[ (int(yPos+tall+pixelSpacer) * screenGrab.width + int(xPos+wide/2)) * 3 + 1];
        cDOWN.b = pixels[ (int(yPos+tall+pixelSpacer) * screenGrab.width + int(xPos+wide/2)) * 3 + 2];
        
        // Store the color left of the player:
        cLEFT.r = pixels[ (int(yPos+tall/2) * screenGrab.width + int(xPos-pixelSpacer)) * 3];
        cLEFT.g = pixels[ (int(yPos+tall/2) * screenGrab.width + int(xPos-pixelSpacer)) * 3 + 1];
        cLEFT.b = pixels[ (int(yPos+tall/2) * screenGrab.width + int(xPos-pixelSpacer)) * 3 + 2];
        
        // Store the color right of the player:
        cRIGHT.r = pixels[ (int(yPos+tall/2) * screenGrab.width + int(xPos+wide+pixelSpacer)) * 3];
        cRIGHT.g = pixels[ (int(yPos+tall/2) * screenGrab.width + int(xPos+wide+pixelSpacer)) * 3 + 1];
        cRIGHT.b = pixels[ (int(yPos+tall/2) * screenGrab.width + int(xPos+wide+pixelSpacer)) * 3 + 2];
        
    }
    
    // If the player is not onscreen, don't check the pixel data (this prevents crashes):
    else {
        cUP = (0,0,0);
        cDOWN = (0,0,0);
        cLEFT = (0,0,0);
        cRIGHT = (0,0,0);
    }
    
    // Print the color data:
    //cout<<"UP = "<<cUP<<"; DOWN = "<<cDOWN<<"; LEFT = "<<cLEFT<<"; RIGHT = "<<cRIGHT<<"; cPlayer = "<<cPlayer<<endl;
    
    // End color analysis.
    
    if (ghost == true) ofSetColor(cGhost);
    else ofSetColor(cPlayer);
    //ofTriangle(xPos, yPos+tall, xPos+wide, yPos+tall, xPos+wide/2, yPos);
    
    // We'll translate the origin to achieve two kinds of rotation:
    ofPushMatrix();
    // First we check if movement is constricted:
    if (youSpinMeRightRound) {
        // If so, we translate the origin to the center of the architecture and rotate the triangle about the origin:
        ofTranslate(ofGetWidth()/2+shiftX, ofGetHeight()/2);
        
        // Store the rotation data to make new coordinates for when we enable free movement. This preserves the position of the player when we switch modes (maybe it would have been easier just to do rotation this way too, but oh well):
        // IMPORTANT: THESE COORDINATES ARE FOR THE CENTER OF THE TRIANGLE!
        rotX = sin(ofDegToRad(degrees-180))*fabs(shiftY+tall/2);
        rotY = sin(ofDegToRad(270-degrees))*fabs(shiftY+tall/2);

        ofLine(-rotX, rotY, 0, 0);
        ofRotate(degrees);
        ofTriangle(-wide/2, shiftY+tall, wide/2, shiftY+tall, 0, shiftY);
        ofNoFill();
        ofSetLineWidth(2);
        ofTriangle(-wideSoul/2, shiftY+tallSoul/2+tall/2, wideSoul/2, shiftY+tallSoul/2+tall/2, 0, shiftY-tallSoul/2+tall/2);
    }
    // If movement is unrestricted, we translate to the center of the triangle and then rotate it about its center as needed:
    else {
        //ofTranslate(xPos+wide/2, yPos+tall/2);
        ofTranslate(xPos, yPos);
        ofRotate(degrees);
        ofTriangle(-wide/2, tall/2, wide/2, tall/2, 0, -tall/2);
        ofNoFill();
        ofSetLineWidth(2);
        ofTriangle(-wideSoul/2, tallSoul/2, wideSoul/2, tallSoul/2, 0, -tallSoul/2);
    }
    ofPopMatrix();
    ofSetColor(255);
    
}

/* Store this old color detection code for the time being, just in case:
 // Original debug line set:
 ofLine(int(xPos), int(yPos-tall/2), int(xPos), int(yPos-tall/2)-10); // UP
 ofLine(int(xPos), int(yPos+tall), int(xPos), int(yPos+tall)+10); // DOWN
 ofLine(int(xPos-wide/2), int(yPos), int(xPos-wide/2)-10, int(yPos)); // LEFT
 ofLine(int(xPos+wide), int(yPos), int(xPos+wide)+10, int(yPos)); // RIGHT
 
 // Original pixel set:
 // Store the color above the player:
 cUP.r = pixels[ (int(yPos-tall/2) * screenGrab.width + int(xPos)) * 3];
 cUP.g = pixels[ (int(yPos-tall/2) * screenGrab.width + int(xPos)) * 3 + 1];
 cUP.b = pixels[ (int(yPos-tall/2) * screenGrab.width + int(xPos)) * 3 + 2];
 
 // Store the color below the player:
 cDOWN.r = pixels[ (int(yPos+tall) * screenGrab.width + int(xPos)) * 3];
 cDOWN.g = pixels[ (int(yPos+tall) * screenGrab.width + int(xPos)) * 3 + 1];
 cDOWN.b = pixels[ (int(yPos+tall) * screenGrab.width + int(xPos)) * 3 + 2];
 
 // Store the color left of the player:
 cLEFT.r = pixels[ (int(yPos) * screenGrab.width + int(xPos-wide/2)) * 3];
 cLEFT.g = pixels[ (int(yPos) * screenGrab.width + int(xPos-wide/2)) * 3 + 1];
 cLEFT.b = pixels[ (int(yPos) * screenGrab.width + int(xPos-wide/2)) * 3 + 2];
 
 // Store the color right of the player:
 cRIGHT.r = pixels[ (int(yPos) * screenGrab.width + int(xPos+wide)) * 3];
 cRIGHT.g = pixels[ (int(yPos) * screenGrab.width + int(xPos+wide)) * 3 + 1];
 cRIGHT.b = pixels[ (int(yPos) * screenGrab.width + int(xPos+wide)) * 3 + 2];
 */