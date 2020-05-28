class Time { // class for "Time"
  //- varible declaration
  int totalTime; 
  int passedTime;
  int savedTime; 

  Time(int time) {
    totalTime = time;
  }

  void startTime() {//-convert to seconds 
    savedTime = millis()/1000;
  }

  boolean isFinished() {//- check for the time (how much is left)
    passedTime = (millis()/1000)-savedTime;
    if (passedTime > totalTime) {
      return true;
    } 
    else {
      return false;
    }
  }
}
