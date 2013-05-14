//
//  rm_time.cpp
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#include "ofMain.h"
#include "rm_time.h"

//--------------------------------------------------------------
void rm_time::setup(int _thisLevel, int _thickWall){
    
    thisLevel = _thisLevel;
    thickWall = _thickWall;
    
}

//--------------------------------------------------------------
void rm_time::update(int _currentLevel){
    
    currentLevel = _currentLevel;
    
    if (currentLevel == thisLevel) {
        
        // Update goes here.
        
    }
    
}

//--------------------------------------------------------------
void rm_time::draw(ofColor _collider){
    
    if (currentLevel == thisLevel) {
        
        // Placeholder: draw the current level number onscreen:
        //ofDrawBitmapString(ofToString(thisLevel), ofGetWidth()/2, ofGetHeight()/2);
        
        collider = _collider;
        
        ofSetColor(collider);
        
        // Draw the boundary walls:
        ofRect(0, 0, ofGetWidth(), thickWall); // Top
        ofRect(ofGetWidth()-thickWall, 0, thickWall, ofGetHeight()); // Right
        
        
        // Draw the room contents:
        
        ofNoFill();
        ofSetLineWidth(4);
        //ofSetColor(247,165,47);
        ofBeginShape();
        ofVertex(720,440);
        ofVertex(695,396);
        ofVertex(720,353);
        ofVertex(770,353);
        ofVertex(795,396);
        ofVertex(770,440);
        ofVertex(720,440);
        ofEndShape();
        
        ofFill();
        //ofSetColor(247,165,47);
        ofBeginShape();
        ofVertex(851,581);
        ofVertex(639,581);
        ofVertex(536,402);
        ofVertex(555,391);
        ofVertex(651,559);
        ofVertex(839,559);
        ofVertex(932,396);
        ofVertex(839,234);
        ofVertex(645,234);
        ofVertex(645,212);
        ofVertex(851,212);
        ofVertex(958,396);
        ofVertex(851,581);
        ofEndShape();
        
        ofFill();
        //ofSetColor(247,165,47);
        ofBeginShape();
        ofVertex(645,234);
        ofVertex(457,166);
        ofVertex(464,145);
        ofVertex(652,213);
        ofVertex(645,234);
        ofEndShape();
        
        ofFill();
        //ofSetColor(247,165,47);
        ofBeginShape();
        ofVertex(468,167);
        ofVertex(190,167);
        ofVertex(190,48);
        ofVertex(468,48);
        ofVertex(468,167);
        ofEndShape();
        
        ofFill();
        ofSetColor(98,195,255);
        ofBeginShape();
        ofVertex(457,84);
        ofVertex(202,84);
        ofVertex(202,63);
        ofVertex(457,63);
        ofVertex(457,84);
        ofEndShape();
        
        ofFill();
        ofSetColor(225,61,95);
        ofBeginShape();
        ofVertex(390,84);
        ofVertex(202,84);
        ofVertex(202,63);
        ofVertex(390,63);
        ofVertex(390,84);
        ofEndShape();
        
        ofNoFill();
        ofSetLineWidth(4);
        ofSetColor(0,0,0);
        ofBeginShape();
        ofVertex(411,145);
        ofVertex(411,121);
        ofEndShape();
        
        ofNoFill();
        ofSetLineWidth(4);
        ofSetColor(0,0,0);
        ofBeginShape();
        ofVertex(396,133);
        ofVertex(425,133);
        ofEndShape();
        
        ofNoFill();
        ofSetLineWidth(4);
        ofSetColor(0,0,0);
        ofBeginShape();
        ofVertex(234,133);
        ofVertex(255,133);
        ofEndShape();
        
        ofFill();
        ofSetColor(255);
    }
    
}