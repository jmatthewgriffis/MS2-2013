//
//  rm_conveyor.h
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#ifndef __MS2_Final_Project__rm_conveyor__
#define __MS2_Final_Project__rm_conveyor__

class rm_conveyor { // This room has conveyor belts and stockpiled triangles.
    
public:
    
    void setup(int _thisLevel, int _thickWall);
    void update(int _currentLevel);
    void draw(ofColor _collider);
    
    int thisLevel, thickWall, currentLevel;
    ofColor collider;
    bool ghostPoint;
    
};

#endif /* defined(__MS2_Final_Project__rm_conveyor__) */
