//
//  rm_hallway.cpp
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#include "ofMain.h"
#include "rm_hallway.h"

//--------------------------------------------------------------
void rm_hallway::setup(int _thisLevel, int _thickWall, int _gap){
    
    thisLevel = _thisLevel;
    thickWall = _thickWall;
    gap = _gap;
    
}

//--------------------------------------------------------------
void rm_hallway::update(int _currentLevel){
    
    currentLevel = _currentLevel;
    
    if (currentLevel == thisLevel) {
        
        // Update goes here.
        
    }
    
}

//--------------------------------------------------------------
void rm_hallway::draw(ofColor _collider){
    
    if (currentLevel == thisLevel) {
        
        // Placeholder: draw the current level number onscreen:
        //ofDrawBitmapString(ofToString(thisLevel), ofGetWidth()/2, ofGetHeight()/2);
        
        collider = _collider;
        
        ofSetColor(collider);
        
        ofRect(ofGetWidth()/2, 0, ofGetWidth()/2, thickWall); // Top
        ofRect(0, ofGetHeight()-thickWall, ofGetWidth()/4, thickWall); // Bottom-left
        ofRect(ofGetWidth()/4+gap, ofGetHeight()-thickWall, ofGetWidth()-(ofGetWidth()/4+gap), thickWall); // Bottom-right
        ofRect(0, 0, thickWall, ofGetHeight()); // Left
        
        ofSetColor(255);
    }
    
}