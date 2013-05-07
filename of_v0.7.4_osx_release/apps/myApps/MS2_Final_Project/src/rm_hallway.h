//
//  rm_hallway.h
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#ifndef __MS2_Final_Project__rm_hallway__
#define __MS2_Final_Project__rm_hallway__

class rm_hallway { // This room is an empty hallway with a gap in one wall.
    
public:
    
    void setup();
    void update();
    void draw(ofColor _collider);
    
    ofColor collider;
    
};

#endif /* defined(__MS2_Final_Project__rm_hallway__) */
