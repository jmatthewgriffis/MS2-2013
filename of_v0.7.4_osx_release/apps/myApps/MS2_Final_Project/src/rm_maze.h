//
//  rm_maze.h
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/1/13.
//
//

#ifndef __MS2_Final_Project__maze__
#define __MS2_Final_Project__maze__

class rm_maze { // This is a series of walls creating a maze for the player.
    
public:
    
    void setup();
    void update();
    void draw(ofColor _collider);
    
    ofColor collider;
    
};

#endif /* defined(__MS2_Final_Project__rm_maze__) */
