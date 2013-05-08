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
    thickWall = _thickWall*3;
    gap = thickWall/3*20;
    
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
        
        ofRect(0, 0, ofGetWidth()/2-gap/2, thickWall); // Top-left
        ofRect(ofGetWidth()/2+gap/2, 0, ofGetWidth()-(ofGetWidth()/2+gap/2), thickWall); // Top-right
        ofRect(ofGetWidth()/2-(gap/1.5), thickWall, ofGetWidth()/2, thickWall); // Blockade
        
        ofSetColor(255);
    }
    
}