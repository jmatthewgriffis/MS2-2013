//
//  rm_blocked.cpp
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#include "ofMain.h"
#include "rm_blocked.h"

//--------------------------------------------------------------
void rm_blocked::setup(int _thisLevel, int _thickWall){
    
    thisLevel = _thisLevel;
    thickWall = _thickWall;
    uberWall = thickWall*3;
    uberGap = uberWall/3*20;
    
}

//--------------------------------------------------------------
void rm_blocked::update(int _currentLevel){
    
    currentLevel = _currentLevel;
    
    if (currentLevel == thisLevel) {
        
        // Update goes here.
        
    }
    
}

//--------------------------------------------------------------
void rm_blocked::draw(ofColor _collider){
    
    if (currentLevel == thisLevel) {
        
        // Placeholder: draw the current level number onscreen:
        //ofDrawBitmapString(ofToString(thisLevel), ofGetWidth()/2, ofGetHeight()/2);
        
        collider = _collider;
        
        ofSetColor(collider);
        
        // Draw the boundary walls:
        ofRect(0, 0, thickWall, ofGetHeight()); // Left
        ofRect(ofGetWidth()-thickWall, 0, thickWall, ofGetHeight()); // Right
        ofRect(ofGetWidth()/2, ofGetHeight()-thickWall, ofGetWidth()/2, thickWall); // Bottom
        
        
        // Draw the room contents:
        
        ofRect(0, 0, ofGetWidth()/2-uberGap/2, uberWall); // Top-left
        ofRect(ofGetWidth()/2+uberGap/2, 0, ofGetWidth()-(ofGetWidth()/2+uberGap/2), uberWall); // Top-right
        ofRect(ofGetWidth()/2-(uberGap/1.5), uberWall, ofGetWidth()/2, uberWall); // Blockade
        
        ofSetColor(255);
    }
    
}