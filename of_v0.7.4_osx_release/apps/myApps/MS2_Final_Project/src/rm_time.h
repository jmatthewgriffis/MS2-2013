//
//  rm_time.h
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#ifndef __MS2_Final_Project__rm_time__
#define __MS2_Final_Project__rm_time__

class rm_time { // This room lets the player adjust the pace of time.
    
public:
    
    void setup(int _thisLevel);
    void update(int _currentLevel);
    void draw(ofColor _collider);
    
    int thisLevel, currentLevel;
    ofColor collider;
    
};

#endif /* defined(__MS2_Final_Project__rm_time__) */
