//
//  rm_blocked.h
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#ifndef __MS2_Final_Project__rm_blocked__
#define __MS2_Final_Project__rm_blocked__

class rm_blocked { // This room blocks further progress.
    
public:
    
    void setup(int _thisLevel);
    void update(int _currentLevel);
    void draw(ofColor _collider);
    
    int thisLevel, currentLevel;
    ofColor collider;
    
};

#endif /* defined(__MS2_Final_Project__rm_blocked__) */
