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
    
    void setup();
    void update();
    void draw(ofColor _collider);
    
    ofColor collider;
    
};

#endif /* defined(__MS2_Final_Project__rm_generator__) */
