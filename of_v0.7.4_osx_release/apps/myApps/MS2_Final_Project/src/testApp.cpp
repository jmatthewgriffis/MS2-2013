#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    
    OF_RECTMODE_CENTER;
    ofSetVerticalSync(true);
    ofSetFrameRate(30);
    
    xPos = ofGetWidth()/2;
    yPos = ofGetHeight()/2;
    xVel = 5;
    yVel = 5;
    wide = 10;
    tall = 10;
    
}

//--------------------------------------------------------------
void testApp::update(){
    
    screenGrab.grabScreen(0, 0, ofGetWidth(), ofGetHeight()); // This takes the data from the screen and converts it into an image. We'll use the pixel data for gameplay.
    
    // Allow movement under certain conditions:
    if (moveUP == true) yPos += -yVel;
    if (moveDOWN == true) yPos += yVel;
    if (moveLEFT == true) xPos += -xVel;
    if (moveRIGHT == true) xPos += xVel;
    
}

//--------------------------------------------------------------
void testApp::draw(){
    
    cout<<yay<<endl;
    
    ofBackground(0); // Refresh the background each frame.
    
    unsigned char * pixels = screenGrab.getPixels();
	
    /* // This is the loadImage example from "week7":
	for (int x = 0; x < screenGrab.width; x++){
		for (int y = 0; y < screenGrab.height; y++){
			
             int red = pixels[ (y * screenGrab.width + x) * 3];
             int green = pixels[ (y * screenGrab.width + x) * 3 + 1];
             int blue = pixels[ (y * screenGrab.width + x) * 3 + 2];
            
             xPos = 175 + x;
             yPos = 135 + y;
             
             ofSetColor(red,green,blue);
             ofEllipse(xPos, yPos, 10, 10);
            
        }
    }
     */
    
    
    yay.r = pixels[ (0 * screenGrab.width + 0) * 3];
    yay.g = pixels[ (0 * screenGrab.width + 0) * 3 + 1];
    yay.b = pixels[ (0 * screenGrab.width + 0) * 3 + 2];
    
    ofSetColor(255, 0, 0);
    ofRect(ofGetWidth()/2, ofGetHeight()/2 - 100, 100, 20); // A wall.
    ofSetColor(yay);
    ofCircle(ofGetWidth()/2+20, ofGetHeight()/2-90, 10);
    ofSetColor(185,200,0);
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