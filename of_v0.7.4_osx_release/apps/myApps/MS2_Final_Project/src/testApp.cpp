#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    
    //------------------------------------//
    
    
    // Housekeeping:
    
    OF_RECTMODE_CENTER;
    ofSetVerticalSync(true);
    ofSetFrameRate(30);
    
    
    //------------------------------------//
    
    
    // The player:
    
    wide = 20;
    tall = 20;
    xPos = ofGetWidth()/2-(wide/2)-3;
    yPos = ofGetHeight()/2-70;
    xVel = 5;
    yVel = 5;
    player.r = 255;
    player.g = 255;
    player.b = 255;
    
    
    //------------------------------------//
    
    
    // The walls:
    
    collider = player; // Wall color equals player color.
    
    
    //------------------------------------//
        
}

//--------------------------------------------------------------
void testApp::update(){
    
    //------------------------------------//
    
    
    // Housekeeping:
    
    // Take the data from the screen and convert it into an image. We'll use the pixel data for gameplay:
    screenGrab.grabScreen(0, 0, ofGetWidth(), ofGetHeight());
    
    
    //------------------------------------//
    
    
    // The player:
    
    // Allow player movement under certain conditions:
    if (moveUP == true && cUP != collider) yPos += -yVel;
    if (moveDOWN == true && cDOWN != collider) yPos += yVel;
    if (moveLEFT == true && cLEFT != collider) xPos += -xVel;
    if (moveRIGHT == true && cRIGHT != collider) xPos += xVel;
    
    
    //------------------------------------//
    
}

//--------------------------------------------------------------
void testApp::draw(){
    
    //------------------------------------//
    
    
    // Housekeeping:
    
    ofBackground(0); // Refresh the background each frame.
    
    unsigned char * pixels = screenGrab.getPixels();
    
    // Prep for collision detection with color analysis: [
    
    // Store the color above the player:
    cUP.r = pixels[ (int(yPos-tall/2) * screenGrab.width + int(xPos)) * 3];
    cUP.g = pixels[ (int(yPos-tall/2) * screenGrab.width + int(xPos)) * 3 + 1];
    cUP.b = pixels[ (int(yPos-tall/2) * screenGrab.width + int(xPos)) * 3 + 2];
    
    // Store the color below the player:
    cDOWN.r = pixels[ (int(yPos+tall) * screenGrab.width + int(xPos)) * 3];
    cDOWN.g = pixels[ (int(yPos+tall) * screenGrab.width + int(xPos)) * 3 + 1];
    cDOWN.b = pixels[ (int(yPos+tall) * screenGrab.width + int(xPos)) * 3 + 2];
    
    // Store the color left of the player:
    cLEFT.r = pixels[ (int(yPos) * screenGrab.width + int(xPos-wide/2)) * 3];
    cLEFT.g = pixels[ (int(yPos) * screenGrab.width + int(xPos-wide/2)) * 3 + 1];
    cLEFT.b = pixels[ (int(yPos) * screenGrab.width + int(xPos-wide/2)) * 3 + 2];
    
    // Store the color right of the player:
    cRIGHT.r = pixels[ (int(yPos) * screenGrab.width + int(xPos+wide)) * 3];
    cRIGHT.g = pixels[ (int(yPos) * screenGrab.width + int(xPos+wide)) * 3 + 1];
    cRIGHT.b = pixels[ (int(yPos) * screenGrab.width + int(xPos+wide)) * 3 + 2];
    
    // ] end color analysis.
    
    
    //------------------------------------//
    
    
    // The walls:
    
    maze.draw(collider);
    
    
    //------------------------------------//
    
    
    // The player:
    
    ofSetColor(player);
    ofTriangle(xPos, yPos+tall, xPos+wide, yPos+tall, xPos+wide/2, yPos);
    ofSetColor(255);
    
    
    //------------------------------------//
    
    
    // Print the color data:
    //cout<<"UP = "<<cUP<<"; DOWN = "<<cDOWN<<"; LEFT = "<<cLEFT<<"; RIGHT = "<<cRIGHT<<endl;
    
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