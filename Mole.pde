class Mole {//- sets up the clss of "mole" 
  //- 3,10 declration of varebles.
  float xPos;
  float yPos;
  Time gameTime;
  Time imageTime;
  PImage[] moles;
  int currentMole;
  int totalCurrentMoleTime;//- declares how long to stay in this current mole 
  int currentMoleTime; //- how long have we been in this current mole 

  Mole(float x, float y) { //- this is the constructor because it has the same name as the class 
    xPos = x;
    yPos = y;
    currentMole = 0;//- this declares that we start with no moles 
    moles = new PImage[9];//- can show 9 diffrent images of mo,e at diffrent places 
    moles[0]=loadImage("hole.png");;//- loads the image of the mole 
    for (int i = 1; i < moles.length; i++) {\\(
      moles[i] = loadImage("mole.png");
    }\\)
//-initlizes the timmer 
     gameTime = new Time(30);
     imageTime = new Time((int) random(1, 4));

    resetTime();
  }

  void resetTime()
  {
    totalCurrentMoleTime = int(random(10, 200));//-pick a randome amout of of time to stay in this current mole 
    currentMoleTime = 0;//-reset the current counter 
  }

  void update()
  { currentMoleTime++;//- increases the amout of time in a current mole 
    if (currentMoleTime >= totalCurrentMoleTime)// have we gone over the current mole time?
    {
      if (currentMole == 0) { 
        currentMole = (int) random(0, 9);//- it will show a mole form a reandome place from any 9 holes 
      }
      else { 
        currentMole = 0;
      }
      resetTime();
    }
  }


  void display() {
    image(moles[currentMole], xPos, yPos);//-display the mole 
  } 

//- this will check if we hit the mole or not and if we hit the mole the score will go up
  void checkIfHit() {
    if (dist(mouseX, mouseY, xPos, yPos) < 80) {
      if (currentMole > 0 ) {
        image(hit,xPos,yPos,250,250);
        delay(40);
        currentMole = 0;
        score++;
      } 
    }
  }


  void moleGameOver() {
    gameOver = true; 
  }
}
