#pragma once

#include "ofMain.h"
#include "player.h"
#include "maze.h"

class testApp : public ofBaseApp{
    
public:
    void setup();
    void update();
    void draw();
    
    void keyPressed  (int key);
    void keyReleased(int key);
    void mouseMoved(int x, int y );
    void mouseDragged(int x, int y, int button);
    void mousePressed(int x, int y, int button);
    void mouseReleased(int x, int y, int button);
    void windowResized(int w, int h);
    void dragEvent(ofDragInfo dragInfo);
    void gotMessage(ofMessage msg);
    
    // The player:
    float xPos;
    float yPos;
    float xVel;
    float yVel;
    float wide;
    float tall;
    bool moveUP;
    bool moveDOWN;
    bool moveLEFT;
    bool moveRIGHT;
    ofColor player;
    ofColor cUP;
    ofColor cDOWN;
    ofColor cLEFT;
    ofColor cRIGHT;
    
    // The world:
    ofColor collider;
    maze maze; // The maze screen.
    
    ofImage screenGrab; // We'll use this object to store color data from the screen.
    
};
