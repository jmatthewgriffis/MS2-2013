#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    
    OF_RECTMODE_CENTER;
    ofSetVerticalSync(true);
    ofSetFrameRate(30);
    ofSetCircleResolution(60);
    ofEnableAlphaBlending();
    
    currentLevel = 0;
    numLevels = 11;
    
    background = (200,200,200);
    player.setup();
    collider = player.cPlayer;
    
    /* We number each room on setup. Change this to revise room placement. The numbers are placed like this:
     
     1-2-3
     4-5-6
     7-8-9
     
     Note that the passageways between rooms may not match up to each other in all configurations so it may be necessary to revise the code for moving between rooms when changing their numbering (see the player.update function). */
    assembly.setup(7);
    blocked.setup(1);
    conveyor.setup(9);
    discarded.setup(8);
    generator.setup(6);
    hallway.setup(4);
    maze.setup(5);
    music.setup(2);
    time.setup(3);
    win.setup(10);
    
}

//--------------------------------------------------------------
void testApp::update(){
    
    player.update(background);
    collider = player.cPlayer;
    assembly.update(currentLevel);
    blocked.update(currentLevel);
    conveyor.update(currentLevel);
    discarded.update(currentLevel);
    generator.update(currentLevel);
    hallway.update(currentLevel);
    maze.update(currentLevel);
    music.update(currentLevel);
    time.update(currentLevel);
    win.update(currentLevel);
    
}

//--------------------------------------------------------------
void testApp::draw(){
    
    ofBackground(background); // Refresh the background each frame.
    
    assembly.draw(collider);
    blocked.draw(collider);
    conveyor.draw(collider);
    discarded.draw(collider);
    generator.draw(collider);
    hallway.draw(collider);
    maze.draw(collider);
    music.draw(collider);
    time.draw(collider);
    win.draw(collider);
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
            
            // Restart the game:
        case 'r':
            setup();
            break;
            
            // Debug. Comment this out later.
        case 'g':
        case 'G':
            player.ghost = true;
            break;
            
            // Debug. Comment this out later.
        case '-':
            if (currentLevel > 0) currentLevel--;
            break;
            
            // Debug. Comment this out later.
        case '=':
            if (currentLevel < numLevels-1) currentLevel++;
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