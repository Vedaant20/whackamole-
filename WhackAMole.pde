Time time;
boolean gameOver; //-ths is the verible declaration of game over 

int score;//-integer type of varible declaration (declares the score shown)
int timeLeft; //- integer type of varible declaration (declares the time left)

PFont f; //-declaration of the font 
PImage[] hammer;//- image of the hammer declared as a varible 
PImage hit; //- hit varible 

//{12-20} inescalising varible for mole 
Mole rightFirst;
Mole centerFirst;
Mole leftFirst;
Mole rightSecond;
Mole centerSecond;
Mole leftSecond;
Mole rightThird;
Mole centerThird;
Mole leftThird;

void setup() { 
  size(850, 850); //- sets up the screen size to 850,850
  imageMode(CENTER);//- sets the image to center 
  textAlign(CENTER);//text will centered 
  score = 0;//- inecall score is zero 

  f = loadFont("DialogInput.italic-48.vlw");//- the font that is used in the game 
  fill(255);//- sets the colour of the font 

  time = new Time(30);//-declaration of time, time will stop at 30 
  time.startTime(); //- declaration of time, it will call a start time method  

  hammer = new PImage[2];//- loads the image of the hammer 
  hammer[0] = loadImage("hammer1.png");
  hammer[1] = loadImage("hammer2.png");
  
//38-47- loads the moles at the correct position 
  rightFirst = new Mole(225, 400);
  centerFirst = new Mole(435, 400);
  leftFirst = new Mole(650, 400);
  rightSecond = new Mole(225, 560);
  centerSecond = new Mole(435, 560);
  leftSecond = new Mole(650, 560);
  rightThird = new Mole(225, 720);
  centerThird = new Mole(435, 720);
  leftThird = new Mole(650, 720);
  hit=loadImage("hit.png");

}

void draw() {
  if (gameOver == false) { //- if game over == false the background image will be loaded and there willl be no curser 
    background(loadImage("background.jpg"));
    noCursor();
    
    timeLeft = (int) (30 - time.passedTime);

    rightFirst.display();
    centerFirst.display();
    leftFirst.display();
    rightSecond.display();
    centerSecond.display();
    leftSecond.display();
    rightThird.display();
    centerThird.display();
    leftThird.display(); 

    rightFirst.update();
    centerFirst.update();
    leftFirst.update();
    rightSecond.update();
    centerSecond.update();
    leftSecond.update();
    rightThird.update();
    centerThird.update();
    leftThird.update();
//^^^ display the moles 
    displayTimeAndScore();//- This will display the time and score 

    if (mousePressed) {
      image(hammer[1], mouseX, mouseY); //- if the mouse is pressed then the second image of the hammer will be used 
      delay(10);
    }
    else {
      image(hammer[0], mouseX, mouseY);//- the first image of hammer is used here 
    }
    if (time.isFinished()) {
      rightFirst.moleGameOver();// if the timer reachers 30 seconds the game will be over 
    }
  } 
  else {
    background(loadImage("background.jpg"));//loads the background image 
    cursor();//-the curser will come up 
    textFont(f, 48);
    text("Game Over\nYour Score = " + score, width/2, height/2 - 50);
    //- the above text will be shown in the middle of teh screen 
    textFont(f, 40);
    text("Press Any Key To Replay", width/2, height-140);//-it will show this tect on this tect on the screen 
    if (keyPressed == true)//- if key pressed is true it will restet the game 
    {
     reset();
    } 
  }
}

void mousePressed() { //-if void mousepressed is true it will check if it hit the mole or not 
  rightFirst.checkIfHit();
  centerFirst.checkIfHit();
  leftFirst.checkIfHit();
  rightSecond.checkIfHit();
  centerSecond.checkIfHit();
  leftSecond.checkIfHit();
  rightThird.checkIfHit();
  centerThird.checkIfHit();
  leftThird.checkIfHit();
}

void displayTimeAndScore() {//- this will display the entire time and score for the game 
  textFont(f, 40);
  fill(000);
  text("Time: " + timeLeft + " Score: " + score, width/2, 60);//- This will reset all the  time 
}

void reset() { //-this will reset the score 
  score = 0;
  time.totalTime = 30;
  time.startTime();
  //-the current mole positions are set to zero 
  rightFirst.currentMole = 0;
  centerFirst.currentMole = 0;
  leftFirst.currentMole = 0;
  rightSecond.currentMole = 0;
  centerSecond.currentMole = 0;
  leftSecond.currentMole = 0;
  rightThird.currentMole = 0;
  centerThird.currentMole = 0;
  leftThird.currentMole = 0;

  gameOver = false;
}
