//
//  rm_music.cpp
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#include "ofMain.h"
#include "rm_music.h"

//--------------------------------------------------------------
void rm_music::setup(int _thisLevel, int _thickWall){
    
    thisLevel = _thisLevel;
    thickWall = _thickWall;
    pressedButton = ghostPoint = false;
    
}

//--------------------------------------------------------------
void rm_music::update(int _currentLevel, float _x, float _y, bool _action){
    
    currentLevel = _currentLevel;
    action = _action;
    xPosP = _x;
    yPosP = _y;
    
    if (currentLevel == thisLevel) {
        
        // Toggle the switch if close enough and pressing the action button:
        if (xPosP >= 50 && xPosP <= 125 && yPosP >= 460 && yPosP <= 480 && action) {
            pressedButton = true;
            ghostPoint = true;
        }
    }
    else pressedButton = false;

}

//--------------------------------------------------------------
void rm_music::draw(ofColor _collider){
    
    if (currentLevel == thisLevel) {
        
        // Placeholder: draw the current level number onscreen:
        //ofDrawBitmapString(ofToString(thisLevel), ofGetWidth()/2, ofGetHeight()/2);
        
        collider = _collider;
        
        ofSetColor(collider);
        
        // Draw the boundary walls:
        ofRect(0, 0, ofGetWidth(), thickWall); // Top
        ofRect(0, 0, thickWall, ofGetHeight()); // Left
        
        
        // Draw the room contents:
        
        ofPushMatrix();
        
        ofTranslate(0, 10);
        
        // Bottom of gramophone:
        ofFill();
        //ofSetColor(255,255,255);
        ofBeginShape();
        ofVertex(449,449);
        ofVertex(50,449);
        ofVertex(50,388);
        ofVertex(449,388);
        ofVertex(449,449);
        ofEndShape();
        
        // Top of gramophone:
        ofFill();
        //ofSetColor(255,255,255);
        ofBeginShape();
        ofVertex(634,286);
        ofBezierVertex(617,299,560,256,507,189);
        ofBezierVertex(454,122,425,56,442,43);
        ofBezierVertex(459,29,516,72,569,140);
        ofBezierVertex(622,207,652,272,634,286);
        ofEndShape();
        
        // Left side:
        // The line generated from the original image is not sufficient to prevent movement. So we draw a rectangle and rotate it to fill in for the line:
        //ofNoFill();
        //ofSetLineWidth(5);
        //ofSetColor(0,0,0);
        /*ofBeginShape();
         ofVertex(442,43);
         ofVertex(232,354);
         ofEndShape();*/
        ofPushMatrix();
        ofTranslate(232, 354);
        ofRotate(-56);
        ofRect(0,0, ofDist(232, 354, 442, 43), 15);
        ofPopMatrix();
        
        // Right side:
        // The line generated from the original image is not sufficient to prevent movement. So we draw a rectangle and rotate it to fill in for the line:
        //ofNoFill();
        //ofSetLineWidth(5);
        //ofSetColor(0,0,0);
        /*ofBeginShape();
         ofVertex(620,288);
         ofVertex(345,363);
         ofEndShape();*/
        ofPushMatrix();
        ofTranslate(345, 363);
        ofRotate(-18);
        ofRect(0,0, ofDist(345, 363, 620, 288), 15);
        ofPopMatrix();
        
        //ofNoFill();
        ofSetLineWidth(1);
        //ofSetColor(0,0,0);
        ofBeginShape();
        ofVertex(232,354);
        ofBezierVertex(232,354,213,372,204,376);
        ofBezierVertex(195,380,158,388,158,388);
        ofEndShape();
        
        //ofNoFill();
        ofSetLineWidth(1);
        //ofSetColor(0,0,0);
        ofBeginShape();
        ofVertex(345,363);
        ofBezierVertex(345,363,333,372,346,377);
        ofBezierVertex(358,381,402,388,402,388);
        ofEndShape();
        
        ofColor buttonStatus;
        if (pressedButton) {
            buttonStatus.r = 0;
            buttonStatus.g = 0;
            buttonStatus.b = 255;
        }
        else {
            buttonStatus.r = 255;
            buttonStatus.g = 1;
            buttonStatus.b = 0;
        }
        ofFill();
        ofSetColor(buttonStatus);
        ofBeginShape();
        ofVertex(99,423);
        ofVertex(78,423);
        ofVertex(78,414);
        ofVertex(99,414);
        ofVertex(99,423);
        ofEndShape();
        
        ofPopMatrix();
        
        ofSetColor(255);
    }
    
}