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
    
    ofColor background;
    ofColor collider; // Prevents player movement.
    
    // Call some classes:
    player player; // The...player.
    rm_maze maze; // The maze screen.
    
};
