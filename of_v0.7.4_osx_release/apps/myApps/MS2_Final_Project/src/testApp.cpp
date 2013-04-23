#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    
    OF_RECTMODE_CENTER;
    ofSetVerticalSync(true);
    
    xPos = ofGetWidth()/2;
    yPos = ofGetHeight()/2;
    xVel = 5;
    yVel = 5;
    wide = 10;
    tall = 10;
    
}

//--------------------------------------------------------------
void testApp::update(){
    
    for (int i = 0; i < ofGetWidth(); i++) {
        for (int j = 0; j < ofGetHeight(); j++) {
            int k = (j * ofGetWidth() + i);
            while( k < pix.size()) {
                char c = pix[k];
                k++;
            }
        }
    }
    
    //ofColor cUP = pix.getColor(xPos, yPos);
    //ofColor cUP = pix.getColor(ofGetWidth()/2, ofGetHeight()/2);
    
    //cout<<cUP<<endl;
    
    // Allow movement under certain conditions:
    if (moveUP == true) yPos += -yVel;
    if (moveDOWN == true) yPos += yVel;
    if (moveLEFT == true) xPos += -xVel;
    if (moveRIGHT == true) xPos += xVel;
    
}

//--------------------------------------------------------------
void testApp::draw(){
    
    ofBackground(0); // Refresh the background each frame.
    
    ofSetColor(255, 0, 0);
    ofRect(ofGetWidth()/2, ofGetHeight()/2 - 100, 100, 20); // A wall.
    ofSetColor(255);
    ofRect(xPos, yPos, wide, tall); // Draw the player character.
    
}

//--------------------------------------------------------------
void testApp::keyPressed(int key){
    
    // Enable movement on keyPress:
    switch (key) {
        case 'w':
        case 'W':
        case OF_KEY_UP:
            moveUP = true;
            break;
            
        case 'a':
        case 'A':
        case OF_KEY_LEFT:
            moveLEFT = true;
            break;
            
        case 's':
        case 'S':
        case OF_KEY_DOWN:
            moveDOWN = true;
            break;
            
        case 'd':
        case 'D':
        case OF_KEY_RIGHT:
            moveRIGHT = true;
            break;
    }
    
}

//--------------------------------------------------------------
void testApp::keyReleased(int key){
    
    // Disable movement on keyRelease:
    switch (key) {
        case 'w':
        case 'W':
        case OF_KEY_UP:
            moveUP = false;
            break;
            
        case 'a':
        case 'A':
        case OF_KEY_LEFT:
            moveLEFT = false;
            break;
            
        case 's':
        case 'S':
        case OF_KEY_DOWN:
            moveDOWN = false;
            break;
            
        case 'd':
        case 'D':
        case OF_KEY_RIGHT:
            moveRIGHT = false;
            break;
    }
    
}

//--------------------------------------------------------------
void testApp::mouseMoved(int x, int y ){
    
}

//--------------------------------------------------------------
void testApp::mouseDragged(int x, int y, int button){
    
}

//--------------------------------------------------------------
void testApp::mousePressed(int x, int y, int button){
    
}

//--------------------------------------------------------------
void testApp::mouseReleased(int x, int y, int button){
    
}

//--------------------------------------------------------------
void testApp::windowResized(int w, int h){
    
}

//--------------------------------------------------------------
void testApp::gotMessage(ofMessage msg){
    
}

//--------------------------------------------------------------
void testApp::dragEvent(ofDragInfo dragInfo){
    
}