//
//  rm_discarded.h
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#ifndef __MS2_Final_Project__rm_discarded__
#define __MS2_Final_Project__rm_discarded__

class rm_discarded { // This room contains discarded triangles.
    
public:
    
    void setup(int _thisLevel, int _thickWall);
    void update(int _currentLevel);
    void draw(ofColor _collider);
    
    int thisLevel, thickWall, currentLevel;
    ofColor collider;
    
};

#endif /* defined(__MS2_Final_Project__rm_discarded__) */
