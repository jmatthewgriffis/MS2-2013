#pragma once

#include "ofMain.h"
#include "player.h"
#include "rm_maze.h"
#include "rm_assembly.h"
#include "rm_blocked.h"
#include "rm_conveyor.h"
#include "rm_discarded.h"
#include "rm_generator.h"
#include "rm_hallway.h"
#include "rm_blocked.h"
#include "rm_music.h"
#include "rm_time.h"
#include "rm_win.h"

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
    
    ofSoundPlayer mainMusic, hexMusic, wonderful, gameOver;
    
    ofColor background;
    ofColor collider; // Prevents player movement.
    int currentLevel; // Use this to control the game screen.
    int numLevels; // How many game screens?
    int thickWall; // Thickness of border walls.
    int gap; // Width of gap in certain walls.
    float circleRad; // Control the size of the void on the first screen.
    float pause, pause2;
    bool inColor; // Switch between color and black-and-white modes.
    
    // Call some classes:
    player player;
    rm_assembly assembly;
    rm_blocked blocked;
    rm_conveyor conveyor;
    rm_discarded discarded;
    rm_generator generator;
    rm_hallway hallway;
    rm_maze maze;
    rm_music music;
    rm_time time;
    rm_win win;
    
};
