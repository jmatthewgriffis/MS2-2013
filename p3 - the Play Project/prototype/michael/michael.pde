int stageID;
titleScreen titlescreen;

void setup(){
   size(1024,768);
   stageID = 0;
   titlescreen = new titleScreen();
}

void draw(){
   switch(stageID){
     case 0:
         //draw title screen
         titlescreen.update();
         break;
     case 1:
        //draw gameplay
        background(0);
        break;
     case 2:
        //draw game over screen
        break;
   }
}
