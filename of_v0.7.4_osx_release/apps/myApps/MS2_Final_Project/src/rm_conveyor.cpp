//
//  rm_conveyor.cpp
//  MS2_Final_Project
//
//  Created by J. Matthew Griffis on 5/7/13.
//
//

#include "ofMain.h"
#include "rm_conveyor.h"

//--------------------------------------------------------------
void rm_conveyor::setup(int _thisLevel, int _thickWall){
    
    thisLevel = _thisLevel;
    thickWall = _thickWall;
    
}

//--------------------------------------------------------------
void rm_conveyor::update(int _currentLevel){
    
    currentLevel = _currentLevel;
    
    if (currentLevel == thisLevel) {
        
        // Update goes here.
        
    }
    
}

//--------------------------------------------------------------
void rm_conveyor::draw(ofColor _collider){
    
    if (currentLevel == thisLevel) {
        
        // Placeholder: draw the current level number onscreen:
        //ofDrawBitmapString(ofToString(thisLevel), ofGetWidth()/2, ofGetHeight()/2);
        
        collider = _collider;
        
        ofSetColor(collider);
        
        // Draw the boundary walls:
        ofRect(ofGetWidth()-thickWall, 0, thickWall, ofGetHeight()); // Right
        ofRect(0, ofGetHeight()-thickWall, ofGetWidth(), thickWall); // Bottom
        
        
        // Draw the room contents:
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(636,178);
        ofVertex(173,178);
        ofVertex(173,170);
        ofVertex(636,170);
        ofVertex(636,178);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(173,166);
        ofVertex(183,148);
        ofVertex(194,166);
        ofVertex(173,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(199,166);
        ofVertex(209,148);
        ofVertex(220,166);
        ofVertex(199,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(225,166);
        ofVertex(235,148);
        ofVertex(246,166);
        ofVertex(225,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(251,166);
        ofVertex(261,148);
        ofVertex(272,166);
        ofVertex(251,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(277,166);
        ofVertex(287,148);
        ofVertex(298,166);
        ofVertex(277,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(303,166);
        ofVertex(313,148);
        ofVertex(324,166);
        ofVertex(303,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(329,166);
        ofVertex(339,148);
        ofVertex(350,166);
        ofVertex(329,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(355,166);
        ofVertex(365,148);
        ofVertex(376,166);
        ofVertex(355,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(380,166);
        ofVertex(390,148);
        ofVertex(401,166);
        ofVertex(380,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(406,166);
        ofVertex(416,148);
        ofVertex(427,166);
        ofVertex(406,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(432,166);
        ofVertex(443,148);
        ofVertex(453,166);
        ofVertex(432,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(458,166);
        ofVertex(469,148);
        ofVertex(479,166);
        ofVertex(458,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(484,166);
        ofVertex(494,148);
        ofVertex(505,166);
        ofVertex(484,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(510,166);
        ofVertex(520,148);
        ofVertex(531,166);
        ofVertex(510,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(536,166);
        ofVertex(546,148);
        ofVertex(557,166);
        ofVertex(536,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(562,166);
        ofVertex(572,148);
        ofVertex(583,166);
        ofVertex(562,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(590,166);
        ofVertex(601,148);
        ofVertex(611,166);
        ofVertex(590,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(616,166);
        ofVertex(627,148);
        ofVertex(637,166);
        ofVertex(616,166);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(636,239);
        ofVertex(173,239);
        ofVertex(173,231);
        ofVertex(636,231);
        ofVertex(636,239);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(173,228);
        ofVertex(184,209);
        ofVertex(195,228);
        ofVertex(173,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(199,228);
        ofVertex(210,209);
        ofVertex(221,228);
        ofVertex(199,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(226,228);
        ofVertex(236,209);
        ofVertex(247,228);
        ofVertex(226,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(252,228);
        ofVertex(262,209);
        ofVertex(273,228);
        ofVertex(252,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(277,228);
        ofVertex(288,209);
        ofVertex(299,228);
        ofVertex(277,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(303,228);
        ofVertex(314,209);
        ofVertex(325,228);
        ofVertex(303,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(329,228);
        ofVertex(340,209);
        ofVertex(351,228);
        ofVertex(329,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(355,228);
        ofVertex(366,209);
        ofVertex(377,228);
        ofVertex(355,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(381,228);
        ofVertex(391,209);
        ofVertex(402,228);
        ofVertex(381,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(407,228);
        ofVertex(417,209);
        ofVertex(428,228);
        ofVertex(407,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(433,228);
        ofVertex(443,209);
        ofVertex(454,228);
        ofVertex(433,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(459,228);
        ofVertex(469,209);
        ofVertex(480,228);
        ofVertex(459,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(484,228);
        ofVertex(495,209);
        ofVertex(506,228);
        ofVertex(484,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(510,228);
        ofVertex(521,209);
        ofVertex(532,228);
        ofVertex(510,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(537,228);
        ofVertex(547,209);
        ofVertex(558,228);
        ofVertex(537,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(563,228);
        ofVertex(573,209);
        ofVertex(584,228);
        ofVertex(563,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(591,228);
        ofVertex(601,209);
        ofVertex(612,228);
        ofVertex(591,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(617,228);
        ofVertex(627,209);
        ofVertex(638,228);
        ofVertex(617,228);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(637,312);
        ofVertex(174,312);
        ofVertex(174,304);
        ofVertex(637,304);
        ofVertex(637,312);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(174,300);
        ofVertex(185,282);
        ofVertex(196,300);
        ofVertex(174,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(200,300);
        ofVertex(211,282);
        ofVertex(222,300);
        ofVertex(200,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(226,300);
        ofVertex(237,282);
        ofVertex(248,300);
        ofVertex(226,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(252,300);
        ofVertex(263,282);
        ofVertex(274,300);
        ofVertex(252,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(278,300);
        ofVertex(289,282);
        ofVertex(299,300);
        ofVertex(278,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(304,300);
        ofVertex(315,282);
        ofVertex(325,300);
        ofVertex(304,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(330,300);
        ofVertex(341,282);
        ofVertex(352,300);
        ofVertex(330,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(356,300);
        ofVertex(367,282);
        ofVertex(378,300);
        ofVertex(356,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(381,300);
        ofVertex(392,282);
        ofVertex(403,300);
        ofVertex(381,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(407,300);
        ofVertex(418,282);
        ofVertex(429,300);
        ofVertex(407,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(433,300);
        ofVertex(444,282);
        ofVertex(455,300);
        ofVertex(433,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(459,300);
        ofVertex(470,282);
        ofVertex(481,300);
        ofVertex(459,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(485,300);
        ofVertex(496,282);
        ofVertex(507,300);
        ofVertex(485,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(511,300);
        ofVertex(522,282);
        ofVertex(533,300);
        ofVertex(511,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(537,300);
        ofVertex(548,282);
        ofVertex(559,300);
        ofVertex(537,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(563,300);
        ofVertex(574,282);
        ofVertex(585,300);
        ofVertex(563,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(592,300);
        ofVertex(602,282);
        ofVertex(613,300);
        ofVertex(592,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(618,300);
        ofVertex(628,282);
        ofVertex(639,300);
        ofVertex(618,300);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(635,390);
        ofVertex(172,390);
        ofVertex(172,382);
        ofVertex(635,382);
        ofVertex(635,390);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(172,379);
        ofVertex(183,360);
        ofVertex(194,379);
        ofVertex(172,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(198,379);
        ofVertex(209,360);
        ofVertex(220,379);
        ofVertex(198,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(224,379);
        ofVertex(235,360);
        ofVertex(246,379);
        ofVertex(224,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(250,379);
        ofVertex(261,360);
        ofVertex(272,379);
        ofVertex(250,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(276,379);
        ofVertex(287,360);
        ofVertex(298,379);
        ofVertex(276,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(302,379);
        ofVertex(313,360);
        ofVertex(324,379);
        ofVertex(302,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(328,379);
        ofVertex(339,360);
        ofVertex(350,379);
        ofVertex(328,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(354,379);
        ofVertex(365,360);
        ofVertex(376,379);
        ofVertex(354,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(379,379);
        ofVertex(390,360);
        ofVertex(401,379);
        ofVertex(379,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(405,379);
        ofVertex(416,360);
        ofVertex(427,379);
        ofVertex(405,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(432,379);
        ofVertex(442,360);
        ofVertex(453,379);
        ofVertex(432,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(458,379);
        ofVertex(468,360);
        ofVertex(479,379);
        ofVertex(458,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(483,379);
        ofVertex(494,360);
        ofVertex(505,379);
        ofVertex(483,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(509,379);
        ofVertex(520,360);
        ofVertex(531,379);
        ofVertex(509,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(535,379);
        ofVertex(546,360);
        ofVertex(557,379);
        ofVertex(535,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(561,379);
        ofVertex(572,360);
        ofVertex(583,379);
        ofVertex(561,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(590,379);
        ofVertex(600,360);
        ofVertex(611,379);
        ofVertex(590,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(616,379);
        ofVertex(626,360);
        ofVertex(637,379);
        ofVertex(616,379);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(635,470);
        ofVertex(172,470);
        ofVertex(172,462);
        ofVertex(635,462);
        ofVertex(635,470);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(692,119);
        ofVertex(688,98);
        ofVertex(708,104);
        ofVertex(692,119);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(198,459);
        ofVertex(209,440);
        ofVertex(219,459);
        ofVertex(198,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(224,459);
        ofVertex(235,440);
        ofVertex(245,459);
        ofVertex(224,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(250,459);
        ofVertex(261,440);
        ofVertex(271,459);
        ofVertex(250,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(276,459);
        ofVertex(286,440);
        ofVertex(297,459);
        ofVertex(276,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(302,459);
        ofVertex(312,440);
        ofVertex(323,459);
        ofVertex(302,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(328,459);
        ofVertex(338,440);
        ofVertex(349,459);
        ofVertex(328,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(354,459);
        ofVertex(364,440);
        ofVertex(375,459);
        ofVertex(354,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(379,459);
        ofVertex(390,440);
        ofVertex(400,459);
        ofVertex(379,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(405,459);
        ofVertex(416,440);
        ofVertex(426,459);
        ofVertex(405,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(431,459);
        ofVertex(442,440);
        ofVertex(452,459);
        ofVertex(431,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(457,459);
        ofVertex(468,440);
        ofVertex(478,459);
        ofVertex(457,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(483,459);
        ofVertex(494,440);
        ofVertex(504,459);
        ofVertex(483,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(509,459);
        ofVertex(520,440);
        ofVertex(530,459);
        ofVertex(509,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(535,459);
        ofVertex(546,440);
        ofVertex(556,459);
        ofVertex(535,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(561,459);
        ofVertex(572,440);
        ofVertex(582,459);
        ofVertex(561,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(589,459);
        ofVertex(600,440);
        ofVertex(611,459);
        ofVertex(589,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(615,459);
        ofVertex(626,440);
        ofVertex(637,459);
        ofVertex(615,459);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(995,-114);
        ofVertex(636,178);
        ofVertex(631,172);
        ofVertex(990,-120);
        ofVertex(995,-114);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(174,468);
        ofVertex(-183,762);
        ofVertex(-188,755);
        ofVertex(169,462);
        ofVertex(174,468);
        ofEndShape();
        
        ofFill();
        //ofSetColor(246,164,46);
        ofBeginShape();
        ofVertex(121,495);
        ofVertex(117,474);
        ofVertex(137,480);
        ofVertex(121,495);
        ofEndShape();
        
        ofSetColor(255);
    }
    
}