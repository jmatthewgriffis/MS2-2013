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
    
}

//--------------------------------------------------------------
void player::update(ofColor _collider){
    
    collider = _collider;
    
    // Take the data from the screen and convert it into an image. We'll use the pixel data for gameplay:
    screenGrab.grabScreen(0, 0, ofGetWidth(), ofGetHeight());
    
    // Allow player movement under certain conditions:
    if (moveUP == true && cUP != collider) yPos += -yVel;
    if (moveDOWN == true && cDOWN != collider) yPos += yVel;
    if (moveLEFT == true && cLEFT != collider) xPos += -xVel;
    if (moveRIGHT == true && cRIGHT != collider) xPos += xVel;
    
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
    //cout<<"UP = "<<cUP<<"; DOWN = "<<cDOWN<<"; LEFT = "<<cLEFT<<"; RIGHT = "<<cRIGHT<<endl;
    
    // ] end color analysis.
    
    ofSetColor(cPlayer);
    ofTriangle(xPos, yPos+tall, xPos+wide, yPos+tall, xPos+wide/2, yPos);
    ofSetColor(255);
    
}