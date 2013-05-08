//
//  rm_assembly.h
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#ifndef __MS2_Final_Project__rm_assembly__
#define __MS2_Final_Project__rm_assembly__

class rm_assembly { // This room assembles and disassembles itself.
    
public:
    
    void setup(int _thisLevel);
    void update(int _currentLevel);
    void draw(ofColor _collider);
    
    int thisLevel, currentLevel;
    ofColor collider;
    
};

#endif /* defined(__MS2_Final_Project__rm_assembly__) */
