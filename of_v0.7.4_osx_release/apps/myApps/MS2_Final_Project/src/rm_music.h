//
//  rm_music.h
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#ifndef __MS2_Final_Project__rm_music__
#define __MS2_Final_Project__rm_music__

class rm_music { // This room contains a music player.
    
public:
    
    void setup(int _thisLevel, int _thickWall);
    void update(int _currentLevel, float _x, float _y, bool _action);
    void draw(ofColor _collider);
    
    int thisLevel, thickWall, currentLevel;
    float xPosP, yPosP;
    ofColor collider;
    bool pressedButton, action, ghostPoint;
    
};

#endif /* defined(__MS2_Final_Project__rm_music__) */
