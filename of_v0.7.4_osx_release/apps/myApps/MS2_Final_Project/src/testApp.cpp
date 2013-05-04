#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    
    OF_RECTMODE_CENTER;
    ofSetVerticalSync(true);
    ofSetFrameRate(30);
    ofEnableAlphaBlending();
    
    background = (200,200,200);
    
    player.setup();
    
    collider = player.cPlayer;
    
}

//--------------------------------------------------------------
void testApp::update(){
    
    player.update(background);
    
    collider = player.cPlayer;
    
}

//--------------------------------------------------------------
void testApp::draw(){
    
    ofBackground(background); // Refresh the background each frame.
    
    maze.draw(collider);
    
    player.draw();
    
    // Housekeeping:
    ofSetColor(255);
    ofSetLineWidth(1);
    
}

//--------------------------------------------------------------
void testApp::keyPressed(int key){
    
    // Enable movement on keyPress:
    switch (key) {
        case 'w':
        case 'W':
        case OF_KEY_UP:
            player.moveUP = true;
            break;
            
        case 'a':
        case 'A':
        case OF_KEY_LEFT:
            player.moveLEFT = true;
            break;
            
        case 's':
        case 'S':
        case OF_KEY_DOWN:
            player.moveDOWN = true;
            break;
            
        case 'd':
        case 'D':
        case OF_KEY_RIGHT:
            player.moveRIGHT = true;
            break;
            
            // Debug. Comment this out later.
        case 'g':
        case 'G':
            player.ghost = true;
            break;
            
            // Debug. Comment this out later.
        case 'm':
            player.suddenFreedom = !player.suddenFreedom;
            break;
            
            // Debug? Consider commenting this out later.
        case 'r':
            setup();
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
            player.moveUP = false;
            break;
            
        case 'a':
        case 'A':
        case OF_KEY_LEFT:
            player.moveLEFT = false;
            break;
            
        case 's':
        case 'S':
        case OF_KEY_DOWN:
            player.moveDOWN = false;
            break;
            
        case 'd':
        case 'D':
        case OF_KEY_RIGHT:
            player.moveRIGHT = false;
            break;
            
        case 'g':
        case 'G':
            player.ghost = false;
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