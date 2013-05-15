//
//  rm_generator.h
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#ifndef __MS2_Final_Project__rm_generator__
#define __MS2_Final_Project__rm_generator__

class rm_generator { // This room contains a wall generator and stockpile.
    
public:
    
    void setup(int _thisLevel, int _thickWall);
    void update(int _currentLevel, float _x, float _y, bool _action);
    void draw(ofColor _collider);
    
    float xPosP, yPosP;
    int thisLevel, thickWall, currentLevel, degrees;
    ofColor collider;
    bool pressedButton, action;
    
};

#endif /* defined(__MS2_Final_Project__rm_generator__) */
