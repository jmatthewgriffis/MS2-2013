//
//  rm_discarded.cpp
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#include "ofMain.h"
#include "rm_discarded.h"

//--------------------------------------------------------------
void rm_discarded::setup(int _thisLevel, int _thickWall){
    
    thisLevel = _thisLevel;
    thickWall = _thickWall;
    
}

//--------------------------------------------------------------
void rm_discarded::update(int _currentLevel){
    
    currentLevel = _currentLevel;
    
    if (currentLevel == thisLevel) {
        
        // Update goes here.
        
    }
    
}

//--------------------------------------------------------------
void rm_discarded::draw(ofColor _collider){
    
    if (currentLevel == thisLevel) {
        
        // Placeholder: draw the current level number onscreen:
        ofDrawBitmapString(ofToString(thisLevel), ofGetWidth()/2, ofGetHeight()/2);
        
        collider = _collider;
        
        ofSetColor(collider);
        
        // Draw the boundary walls:
        ofRect(0, 0, thickWall, ofGetHeight()); // Left
        ofRect(0, ofGetHeight()-thickWall, ofGetWidth(), thickWall); // Bottom
        
        
        // Draw the room contents:
        
        ofSetColor(255);
    }
    
}