//
//  rm_generator.cpp
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#include "ofMain.h"
#include "rm_generator.h"

//--------------------------------------------------------------
void rm_generator::setup(int _thisLevel, int _thickWall){
    
    thisLevel = _thisLevel;
    thickWall = _thickWall;
    
}

//--------------------------------------------------------------
void rm_generator::update(int _currentLevel){
    
    currentLevel = _currentLevel;
    
    if (currentLevel == thisLevel) {
        
        // Update goes here.
        
    }
    
}

//--------------------------------------------------------------
void rm_generator::draw(ofColor _collider){
    
    if (currentLevel == thisLevel) {
        
        // Placeholder: draw the current level number onscreen:
        //ofDrawBitmapString(ofToString(thisLevel), ofGetWidth()/2, ofGetHeight()/2);
        
        collider = _collider;
        
        ofSetColor(collider);
        
        // Draw the boundary walls:
        ofRect(ofGetWidth()-thickWall, 0, thickWall, ofGetHeight()); // Right
        
        
        // Draw the room contents:
        
        ofFill();
        //ofSetColor(84,254,0);
        ofBeginShape();
        ofVertex(807,591);
        ofVertex(785,591);
        ofVertex(785,49);
        ofVertex(807,49);
        ofVertex(807,591);
        ofEndShape();
        
        ofFill();
        //ofSetColor(84,254,0);
        ofBeginShape();
        ofVertex(862,470);
        ofVertex(718,470);
        ofVertex(718,448);
        ofVertex(849,448);
        ofVertex(911,341);
        ofVertex(849,233);
        ofVertex(725,233);
        ofVertex(659,346);
        ofVertex(640,335);
        ofVertex(712,211);
        ofVertex(862,211);
        ofVertex(936,341);
        ofVertex(862,470);
        ofEndShape();
        
        ofFill();
        //ofSetColor(84,254,0);
        ofBeginShape();
        ofVertex(855,375);
        ofVertex(718,375);
        ofVertex(718,353);
        ofVertex(849,353);
        ofVertex(911,246);
        ofVertex(849,138);
        ofVertex(725,138);
        ofVertex(659,251);
        ofVertex(640,240);
        ofVertex(712,116);
        ofVertex(862,116);
        ofVertex(936,246);
        ofVertex(862,375);
        ofVertex(855,375);
        ofEndShape();
        
        ofFill();
        //ofSetColor(84,254,0);
        ofBeginShape();
        ofVertex(862,423);
        ofVertex(718,423);
        ofVertex(718,401);
        ofVertex(849,401);
        ofVertex(911,294);
        ofVertex(849,186);
        ofVertex(725,186);
        ofVertex(659,299);
        ofVertex(640,288);
        ofVertex(712,164);
        ofVertex(862,164);
        ofVertex(936,294);
        ofVertex(862,423);
        ofEndShape();
        
        ofFill();
        //ofSetColor(84,254,0);
        ofBeginShape();
        ofVertex(862,519);
        ofVertex(718,519);
        ofVertex(718,497);
        ofVertex(849,497);
        ofVertex(911,390);
        ofVertex(849,282);
        ofVertex(725,282);
        ofVertex(659,395);
        ofVertex(640,384);
        ofVertex(712,260);
        ofVertex(862,260);
        ofVertex(936,390);
        ofVertex(862,519);
        ofEndShape();
        
        ofFill();
        //ofSetColor(84,254,0);
        ofBeginShape();
        ofVertex(520,466);
        ofVertex(376,466);
        ofVertex(376,444);
        ofVertex(507,444);
        ofVertex(569,337);
        ofVertex(507,229);
        ofVertex(383,229);
        ofVertex(317,342);
        ofVertex(298,331);
        ofVertex(370,207);
        ofVertex(520,207);
        ofVertex(594,337);
        ofVertex(520,466);
        ofEndShape();
        
        ofFill();
        //ofSetColor(84,254,0);
        ofBeginShape();
        ofVertex(377,420);
        ofVertex(202,420);
        ofVertex(202,308);
        ofVertex(377,308);
        ofVertex(377,420);
        ofEndShape();
        
        ofFill();
        //ofSetColor(84,254,0);
        ofBeginShape();
        ofVertex(360,332);
        ofVertex(295,332);
        ofVertex(295,294);
        ofVertex(360,294);
        ofVertex(360,332);
        ofEndShape();
        
        // This one is the red button:
        ofFill();
        ofSetColor(253,37,0);
        ofBeginShape();
        ofVertex(242,403);
        ofVertex(221,403);
        ofVertex(221,390);
        ofVertex(242,390);
        ofVertex(242,403);
        ofEndShape();

        ofSetColor(255);
    }
    
}