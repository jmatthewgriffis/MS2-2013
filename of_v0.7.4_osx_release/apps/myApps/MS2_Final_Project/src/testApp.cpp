#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){
    
    // Housekeeping:
    OF_RECTMODE_CENTER;
    ofSetVerticalSync(true);
    ofSetFrameRate(30);
    ofSetCircleResolution(60);
    ofEnableAlphaBlending();
    ofHideCursor();
    
    // Load music and enable streaming:
    mainMusic.loadSound("main.mp3", true);
    mainMusic.setVolume(1.0f);
    hexMusic.loadSound("hexagon.mp3", true);
    hexMusic.setVolume(0.03f);
    
    currentLevel = 6;
    numLevels = 11;
    thickWall = 22;
    gap = thickWall;
    inColor = true;
    
    //background = 200;
    background = 0;
    player.setup(thickWall);
    collider = player.cPlayer;
    
    /* We number each room on setup. Change this to revise room placement. The numbers are placed like this:
     
     1-2-3
     4-5-6
     7-8-9
     
     Note that the passageways between rooms may not match up to each other in all configurations so it may be necessary to revise the code for moving between rooms when changing their numbering (see the update function below). */
    assembly.setup(7, thickWall, gap);
    blocked.setup(1, thickWall);
    conveyor.setup(9, thickWall);
    discarded.setup(8, thickWall); //need to do
    generator.setup(6, thickWall);
    hallway.setup(4, thickWall, gap);
    maze.setup(5, thickWall);
    music.setup(2, thickWall); //need to do
    time.setup(3, thickWall);
    win.setup(10, thickWall); //need to do
    
}

//--------------------------------------------------------------
void testApp::update(){
    
    // Control the background music:
    if (!mainMusic.getIsPlaying()) mainMusic.play();
    if (music.pressedButton) {
        mainMusic.setVolume(0.0);
        if (!hexMusic.getIsPlaying()) hexMusic.play();
    }
    else {
        if (hexMusic.getIsPlaying()) hexMusic.stop();
        mainMusic.setVolume(1);
    }
    
    // Make the background change in relation to the player:
    //player.cPlayer.setSaturation(255);
    //player.cPlayer.setBrightness(255);
    /*int blah = player.cPlayer.getHue();
     int blahblah = (blah+255/3) % 255;
     background.setHsb(blahblah, 180, 220);*/
    //player.cPlayer.setHsb(blah, 255, 255);
    
    //cout<<blah<<" "<<blahblah<<endl;
    
    player.update(background, inColor, currentLevel);
    
    /* We check if the player moves offscreen and if so cue a level change where appropriate, using the numbering system described above. Including closed paths, the map looks like this:
     
     1  2--3
     |  |  |
     4--5--6
     |  |  |
     7  8--9
     
     */
    
    if (player.screenUP && currentLevel > 3) currentLevel -= 3;
    if (player.screenDOWN && currentLevel < 7) currentLevel += 3;
    if (player.screenLEFT && currentLevel != 1 && currentLevel != 2 && currentLevel != 4 && currentLevel != 7 && currentLevel != 8) currentLevel--;
    if (player.screenRIGHT && currentLevel != 1 && currentLevel != 3 && currentLevel != 6 && currentLevel != 7 && currentLevel != 9) currentLevel++;
    
    collider = player.cPlayer;
    assembly.update(currentLevel, player.xPos, player.yPos);
    blocked.update(currentLevel);
    conveyor.update(currentLevel);
    discarded.update(currentLevel);
    generator.update(currentLevel, player.xPos, player.yPos, player.action);
    hallway.update(currentLevel);
    maze.update(currentLevel);
    music.update(currentLevel, player.xPos, player.yPos, player.action);
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
            
        case ' ':
            player.action = true;
            break;
            
            // Restart the game:
        case 'r':
            mainMusic.stop();
            hexMusic.stop();
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
            
            // Debug. Comment this out later:
        case 'm':
            inColor = !inColor;
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
            
        case ' ':
            player.action = false;
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