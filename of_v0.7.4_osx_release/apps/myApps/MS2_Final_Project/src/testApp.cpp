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
    
    // Print the color data:
    //cout<<"UP = "<<cUP<<"; DOWN = "<<cDOWN<<"; LEFT = "<<cLEFT<<"; RIGHT = "<<cRIGHT<<endl;
    
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
    
    
    
    //-------------------
    // start Level 1:
    
    ofSetColor(collider);
    
    ofNoFill();
    ofSetLineWidth(4);
    //ofSetColor(collider);
    ofBeginShape();
    ofVertex(541,361);
    ofVertex(518,321);
    ofVertex(541,280);
    ofVertex(588,280);
    ofVertex(612,321);
    ofVertex(588,361);
    ofVertex(541,361);
    ofEndShape();
    
    ofNoFill();
    ofSetLineWidth(22);
    //ofSetColor(collider);
    ofBeginShape();
    ofVertex(1051,325);
    ofEndShape();
    
    ofFill();
    //ofSetColor(collider);
    ofBeginShape();
    ofVertex(671,505);
    ofVertex(465,505);
    ofVertex(465,483);
    ofVertex(658,483);
    ofVertex(752,321);
    ofVertex(658,158);
    ofVertex(471,158);
    ofVertex(374,326);
    ofVertex(355,315);
    ofVertex(458,136);
    ofVertex(671,136);
    ofVertex(778,321);
    ofVertex(671,505);
    ofEndShape();
    
    ofFill();
    //ofSetColor(collider);
    ofBeginShape();
    ofVertex(359,672);
    ofVertex(159,326);
    ofVertex(178,315);
    ofVertex(378,661);
    ofVertex(359,672);
    ofEndShape();
    
    ofFill();
    //ofSetColor(collider);
    ofBeginShape();
    ofVertex(959,326);
    ofVertex(759,-19);
    ofVertex(778,-30);
    ofVertex(978,315);
    ofVertex(959,326);
    ofEndShape();
    
    ofNoFill();
    ofSetLineWidth(22);
    //ofSetColor(collider);
    ofBeginShape();
    ofVertex(369,-25);
    ofEndShape();
    
    ofFill();
    //ofSetColor(collider);
    ofBeginShape();
    ofVertex(903,889);
    ofVertex(884,878);
    ofVertex(1206,321);
    ofVertex(884,-236);
    ofVertex(903,-247);
    ofVertex(1231,321);
    ofVertex(903,889);
    ofEndShape();
    
    ofFill();
    //ofSetColor(collider);
    ofBeginShape();
    ofVertex(234,889);
    ofVertex(-93,321);
    ofVertex(234,-247);
    ofVertex(253,-236);
    ofVertex(-68,321);
    ofVertex(253,878);
    ofVertex(234,889);
    ofEndShape();
    
    // end Level 1
    //-------------------
    // start Level 2:
    
    

    //------------------------------------//
    
    // The player:
    
    ofSetColor(player);
    ofTriangle(xPos, yPos+tall, xPos+wide, yPos+tall, xPos+wide/2, yPos);
    ofSetColor(255);
    
    //------------------------------------//
    
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