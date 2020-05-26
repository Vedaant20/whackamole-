//initializing variables
Mole topRight;
Mole topCenter;
Mole topLeft;

Mole midRight;
Mole midCenter;
Mole midLeft;

Mole bottomRight;
Mole bottomCenter;
Mole bottomLeft;

Timer timer;
boolean gameOver;

int score;
int timeLeft;

PFont f;
PImage[] hammer;
PImage hit;
void setup() {
  size(850, 850);
  imageMode(CENTER);
  textAlign(CENTER);
  score = 0;

  f = loadFont("DialogInput.italic-48.vlw");
  fill(255);

  timer = new Timer(30);
  timer.startTimer();

  hammer = new PImage[2];
  hammer[0] = loadImage("hammer.png");
  hammer[1] = loadImage("hammerdown.png");

  topRight = new Mole(225, 400);
  topCenter = new Mole(435, 400);
  topLeft = new Mole(650, 400);

  midRight = new Mole(225, 560);
  midCenter = new Mole(435, 560);
  midLeft = new Mole(650, 560);

  bottomRight = new Mole(225, 720);
  bottomCenter = new Mole(435, 720);
  bottomLeft = new Mole(650, 720);
  hit=loadImage("hit.png");

}

void draw() {
  if (gameOver == false) {
    background(loadImage("background.jpg"));
    noCursor();

    //timeLeft = (30 - (millis()/1000));

    timeLeft = (int) (30 - timer.passedTime);

    topRight.display();
    topCenter.display();
    topLeft.display();

    midRight.display();
    midCenter.display();
    midLeft.display();

    bottomRight.display();
    bottomCenter.display();
    bottomLeft.display(); 

    topRight.update();
    topCenter.update();
    topLeft.update();

    midRight.update();
    midCenter.update();
    midLeft.update();

    bottomRight.update();
    bottomCenter.update();
    bottomLeft.update();

    displayTimeScore();

    if (mousePressed) {
      image(hammer[1], mouseX, mouseY);
      delay(10);
    }
    else {
      image(hammer[0], mouseX, mouseY);
    }
    if (timer.isFinished()) {
      midRight.moleGameOver();
    }
  } 
  else {
    //gameOver is true
    background(0);
    cursor();
    textFont(f, 48);
    text("Game Over\nScore = " + score, width/2, height/2 - 50);

    //draw replay button
    rectMode(CENTER);
    fill(255);
    rect(width/2, height-150, 150, 50);
    fill(0);
    textFont(f, 30);
    text("replay", width/2, height-140);

    fill(255);

    //if click on replay
    if (mouseX > (width/2 - 75) &&  mouseX < (width/2 + 75) && mouseY < height-150 + 25 && mouseY > height-150 - 25) {
      fill(0);
      rect(width/2, height-150, 150, 50);
      fill(255);
      textFont(f, 30);
      text("replay", width/2, height-140);
      if (mousePressed) {
        reset();
      }
    }
    //reset
  }
}

void mousePressed() {
  topRight.checkHit();
  topCenter.checkHit();
  topLeft.checkHit();

  midRight.checkHit();
  midCenter.checkHit();
  midLeft.checkHit();

  bottomRight.checkHit();
  bottomCenter.checkHit();
  bottomLeft.checkHit();
}
