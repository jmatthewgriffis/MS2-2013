//
//  rm_assembly.cpp
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#include "ofMain.h"
#include "rm_assembly.h"

//--------------------------------------------------------------
void rm_assembly::setup(int _thisLevel, int _thickWall, int _gap){
    
    thisLevel = _thisLevel;
    thickWall = _thickWall;
    gap = _gap;
    
    xPos = yPos = 100;
    xVel = yVel = -2;
    
    moveHex = false;
    
}

//--------------------------------------------------------------
void rm_assembly::update(int _currentLevel, float _x, float _y){
    
    currentLevel = _currentLevel;
    xPosP = _x;
    yPosP = _y;
    
    if (currentLevel == thisLevel) {
        
        if (xPosP >= ofGetWidth()/2-100 && xPosP <= ofGetWidth()/2+100 && yPosP >= ofGetHeight()/2-100 && yPosP <= ofGetHeight()/2+100) moveHex = true;
        else moveHex = false;
        
        if (moveHex) {
            
            xPos += xVel;
            yPos += yVel;
            
            if (xPos >= 100 || xPos <= 0) xVel *= -1;
            if (yPos >= 100 || yPos <= 0) yVel *= -1;
            
        }
    }
    
}

//--------------------------------------------------------------
void rm_assembly::draw(ofColor _collider){
    
    if (currentLevel == thisLevel) {
        
        // Placeholder: draw the current level number onscreen:
        //ofDrawBitmapString(ofToString(thisLevel), ofGetWidth()/2, ofGetHeight()/2);
        
        collider = _collider;
        
        ofSetColor(collider);
        
        // Draw the boundary walls:
        ofRect(0, 0, ofGetWidth()/4, thickWall); // Top-left
        ofRect(ofGetWidth()/4+gap, 0, ofGetWidth()-(ofGetWidth()/4+gap), thickWall); // Top-right
        ofRect(0, 0, thickWall, ofGetHeight()); // Left
        ofRect(ofGetWidth()-thickWall, 0, thickWall, ofGetHeight()); // Right
        ofRect(0, ofGetHeight()-thickWall, ofGetWidth(), thickWall); // Bottom
        
        
        // Draw the room contents:
        
        
        
        // THE ARROWS:
        
        ofNoFill();
        ofSetLineWidth(1);
        ofSetColor(66,108,255);
        ofBeginShape();
        ofVertex(548,121);
        ofBezierVertex(548,139,549,157,548,174);
        ofBezierVertex(538,174,531,162,524,154);
        ofBezierVertex(533,165,552,177,563,163);
        ofEndShape();
        
        ofNoFill();
        ofSetLineWidth(1);
        ofSetColor(66,108,255);
        ofBeginShape();
        ofVertex(756,280);
        ofBezierVertex(737,282,722,287,704,291);
        ofBezierVertex(706,283,709,275,712,267);
        ofBezierVertex(712,276,703,290,714,294);
        ofEndShape();
        
        ofNoFill();
        ofSetLineWidth(1);
        ofSetColor(66,108,255);
        ofBeginShape();
        ofVertex(882,499);
        ofBezierVertex(864,499,840,485,825,475);
        ofBezierVertex(824,479,824,484,826,488);
        ofBezierVertex(829,469,834,467,854,462);
        ofEndShape();
        
        ofNoFill();
        ofSetLineWidth(1);
        ofSetColor(66,108,255);
        ofBeginShape();
        ofVertex(600,494);
        ofBezierVertex(600,480,600,464,595,452);
        ofBezierVertex(583,457,574,466,562,471);
        ofBezierVertex(579,449,594,433,620,448);
        ofEndShape();
        
        ofNoFill();
        ofSetLineWidth(1);
        ofSetColor(66,108,255);
        ofBeginShape();
        ofVertex(381,468);
        ofBezierVertex(399,468,421,450,436,440);
        ofBezierVertex(427,434,414,435,404,434);
        ofBezierVertex(430,436,429,443,429,466);
        ofEndShape();
        
        ofNoFill();
        ofSetLineWidth(1);
        ofSetColor(66,108,255);
        ofBeginShape();
        ofVertex(304,126);
        ofBezierVertex(322,133,340,140,358,147);
        ofBezierVertex(367,150,376,150,381,157);
        ofBezierVertex(372,159,362,159,352,159);
        ofBezierVertex(362,160,384,164,392,157);
        ofBezierVertex(389,150,384,145,378,139);
        ofEndShape();
        
        
        
        // THE HEXAGON:
        
        ofSetColor(collider);
        
        ofPushMatrix();
        ofTranslate(0, -25);
        
        // Top:
        ofPushMatrix();
        ofTranslate(0, -yPos);
        ofFill();
        //ofSetColor(247,165,47);
        ofBeginShape();
        ofVertex(658,186);
        ofVertex(458,186);
        ofVertex(458,164);
        ofVertex(658,164);
        ofVertex(658,186);
        ofEndShape();
        ofPopMatrix();
        
        // Top-left:
        ofPushMatrix();
        ofTranslate(-xPos, -yPos);
        ofFill();
        //ofSetColor(247,165,47);
        ofBeginShape();
        ofVertex(370,355);
        ofVertex(350,345);
        ofVertex(445,169);
        ofVertex(465,179);
        ofVertex(370,355);
        ofEndShape();
        ofPopMatrix();
        
        // Bottom-left:
        ofPushMatrix();
        ofTranslate(-xPos, yPos);
        ofFill();
        //ofSetColor(247,165,47);
        ofBeginShape();
        ofVertex(448,533);
        ofVertex(348,360);
        ofVertex(367,349);
        ofVertex(467,522);
        ofVertex(448,533);
        ofEndShape();
        ofPopMatrix();
        
        // Bottom:
        ofPushMatrix();
        ofTranslate(0, yPos);
        ofFill();
        //ofSetColor(247,165,47);
        ofBeginShape();
        ofVertex(661,533);
        ofVertex(461,533);
        ofVertex(461,511);
        ofVertex(661,511);
        ofVertex(661,533);
        ofEndShape();
        ofPopMatrix();
        
        // Bottom-right:
        ofPushMatrix();
        ofTranslate(xPos, yPos);
        ofFill();
        //ofSetColor(247,165,47);
        ofBeginShape();
        ofVertex(671,527);
        ofVertex(652,516);
        ofVertex(752,343);
        ofVertex(771,354);
        ofVertex(671,527);
        ofEndShape();
        ofPopMatrix();
        
        // Top-right:
        ofPushMatrix();
        ofTranslate(xPos, -yPos);
        ofFill();
        //ofSetColor(247,165,47);
        ofBeginShape();
        ofVertex(752,354);
        ofVertex(652,181);
        ofVertex(671,170);
        ofVertex(771,343);
        ofVertex(752,354);
        ofEndShape();
        ofPopMatrix();
        
        ofPopMatrix();
        
        ofFill();
        ofSetColor(255);
    }
    
}