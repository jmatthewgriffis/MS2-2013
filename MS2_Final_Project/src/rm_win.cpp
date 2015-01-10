//
//  rm_win.cpp
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#include "ofMain.h"
#include "rm_win.h"

//--------------------------------------------------------------
void rm_win::setup(int _thisLevel, int _thickWall){
    
    thisLevel = _thisLevel;
    thickWall = _thickWall;
    
}

//--------------------------------------------------------------
void rm_win::update(int _currentLevel){
    
    currentLevel = _currentLevel;
    
    if (currentLevel == thisLevel) {
        
        // Update goes here.
        
    }
    
}

//--------------------------------------------------------------
void rm_win::draw(ofColor _collider){
    
    if (currentLevel == thisLevel) {
        
        // Placeholder: draw the current level number onscreen:
        //ofDrawBitmapString(ofToString(thisLevel), ofGetWidth()/2, ofGetHeight()/2);
        
        collider = _collider;
        
        ofSetColor(collider);
        
        // Draw goes here.
        
        ofSetColor(255);
    }
    
}