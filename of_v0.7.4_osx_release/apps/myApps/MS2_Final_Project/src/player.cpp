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
    
    wide = 20;
    tall = 20;
    xPos = ofGetWidth()/2-(wide/2)-3;
    yPos = ofGetHeight()/2-70;
    xVel = 5;
    yVel = 5;
    cPlayer.r = 255;
    cPlayer.g = 255;
    cPlayer.b = 255;
    closeEnough = 5;
    cVelR = 1;
    cVelRdelay = 0;
    cVelG = 1;
    cVelGdelay = 0;
    cVelB = 1;
    cVelBdelay = 0;
    randLimit = 60;
    
}

//--------------------------------------------------------------
void player::update(ofColor _background){
    
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
    
    // Allow player movement if the key is pressed and the pixel in the direction of movement is a different color than the player:
    if (moveUP == true && cUPdiff) yPos += -yVel;
    if (moveDOWN == true && cDOWNdiff) yPos += yVel;
    if (moveLEFT == true && cLEFTdiff) xPos += -xVel;
    if (moveRIGHT == true && cRIGHTdiff) xPos += xVel;
    
}

//--------------------------------------------------------------
void player::draw(){
    
    unsigned char * pixels = screenGrab.getPixels();
    
    // Prep for collision detection with color analysis: [
    
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
    
    // Print the color data:
    //cout<<"UP = "<<cUP<<"; DOWN = "<<cDOWN<<"; LEFT = "<<cLEFT<<"; RIGHT = "<<cRIGHT<<"; cPlayer = "<<cPlayer<<endl;
    
    // ] end color analysis.
    
    ofSetColor(cPlayer);
    ofTriangle(xPos, yPos+tall, xPos+wide, yPos+tall, xPos+wide/2, yPos);
    ofSetColor(255);
    
}