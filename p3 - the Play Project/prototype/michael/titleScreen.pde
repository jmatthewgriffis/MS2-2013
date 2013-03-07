class titleScreen {
  PImage screen;
  titleScreen() {
    screen = loadImage("titleScreen.png");
  }
  void update() {
    //display title screen image
    image(screen, 0, 0);
    //check to see if mouse is clicking the start button
    //the start button on the template is at x = 460, y = 520
    //the size of the button: width = 230 height = 75
    if (mousePressed) {
      if (mouseX>589 && mouseX<589+297 && mouseY>675 && mouseY<675+80) {
        //start button is pressed
        //change stage to the next one
        //reset any timer variable if necessary
        stageID = 1;
      }
    }
  }
}

