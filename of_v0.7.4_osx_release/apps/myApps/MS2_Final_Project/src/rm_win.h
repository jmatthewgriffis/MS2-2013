//
//  rm_win.h
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#ifndef __MS2_Final_Project__rm_win__
#define __MS2_Final_Project__rm_win__

class rm_win { // This room is the win screen.
    
public:
    
    void setup(int _thisLevel);
    void update(int _currentLevel);
    void draw(ofColor _collider);
    
    int thisLevel, currentLevel;
    ofColor collider;
    
};

#endif /* defined(__MS2_Final_Project__rm_win__) */
