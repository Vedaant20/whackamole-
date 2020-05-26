class Mole {
  float xPos;
  float yPos;

  PImage[] moles;
  int currentMole;

  Timer gameTimer;
  Timer imageTimer;

  //boolean timerStarted = false;

  // how long to stay in this currentMole
  int totalCurrentMoleTime;

  // how long have we been in this currentMole?
  int currentMoleTime;

  //constructor

  Mole(float x, float y) {
    xPos = x;
    yPos = y;

    //start it empty
    currentMole = 0;

    //load the images
    moles = new PImage[9];
    moles[0]=loadImage("hole.png");;
    for (int i = 1; i < moles.length; i++) {
      moles[i] = loadImage("mole.png");
    }

    //initialize the timers
     gameTimer = new Timer(30);
     imageTimer = new Timer((int) random(1, 4));

    resetTimers();
  }

  void moleGameOver() {
    gameOver = true;
  }
}
