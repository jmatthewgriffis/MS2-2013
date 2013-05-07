//
//  rm_maze.cpp
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/1/13.
//
//

#include "ofMain.h"
#include "rm_maze.h"

//--------------------------------------------------------------
void rm_maze::setup(){
    
}

//--------------------------------------------------------------
void rm_maze::update(){
    
}

//--------------------------------------------------------------
void rm_maze::draw(ofColor _collider){
    
    collider = _collider;
    
    ofSetColor(collider);
    
    // start maze:
    
    ofNoFill();
    ofSetLineWidth(4);
    //ofSetColor(collider);
    ofBeginShape();
    ofVertex(541,361);
    ofVertex(518,321);
    ofVertex(541,280);
    ofVertex(588,280);
    ofVertex(612,321);
    ofVertex(588,361);
    ofVertex(541,361);
    ofEndShape();
    
    ofNoFill();
    ofSetLineWidth(22);
    //ofSetColor(collider);
    ofBeginShape();
    ofVertex(1051,325);
    ofEndShape();
    
    ofFill();
    //ofSetColor(collider);
    ofBeginShape();
    ofVertex(671,505);
    ofVertex(465,505);
    ofVertex(465,483);
    ofVertex(658,483);
    ofVertex(752,321);
    ofVertex(658,158);
    ofVertex(471,158);
    ofVertex(374,326);
    ofVertex(355,315);
    ofVertex(458,136);
    ofVertex(671,136);
    ofVertex(778,321);
    ofVertex(671,505);
    ofEndShape();
    
    ofFill();
    //ofSetColor(collider);
    ofBeginShape();
    ofVertex(359,672);
    ofVertex(159,326);
    ofVertex(178,315);
    ofVertex(378,661);
    ofVertex(359,672);
    ofEndShape();
    
    ofFill();
    //ofSetColor(collider);
    ofBeginShape();
    ofVertex(959,326);
    ofVertex(759,-19);
    ofVertex(778,-30);
    ofVertex(978,315);
    ofVertex(959,326);
    ofEndShape();
    
    ofNoFill();
    ofSetLineWidth(22);
    //ofSetColor(collider);
    ofBeginShape();
    ofVertex(369,-25);
    ofEndShape();
    
    ofFill();
    //ofSetColor(collider);
    ofBeginShape();
    ofVertex(903,889);
    ofVertex(884,878);
    ofVertex(1206,321);
    ofVertex(884,-236);
    ofVertex(903,-247);
    ofVertex(1231,321);
    ofVertex(903,889);
    ofEndShape();
    
    ofFill();
    //ofSetColor(collider);
    ofBeginShape();
    ofVertex(234,889);
    ofVertex(-93,321);
    ofVertex(234,-247);
    ofVertex(253,-236);
    ofVertex(-68,321);
    ofVertex(253,878);
    ofVertex(234,889);
    ofEndShape();
    
    // end maze
    
    ofSetColor(255);
    ofSetLineWidth(1);
    
}