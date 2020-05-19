 Mole[] moles = new Mole[4];
Mole myMole;
PFont f;
void setup() {
  size(1350, 600); 
  colorMode(RGB, 100); 
  background(5100);
  moles[0] = new Mole (color(80, 40, 30), 165, 270, 2);
  moles[1] = new Mole (color(80, 10, 20), 465, 270, 4);
  moles[2] = new Mole (color(60, 20, 50), 765, 270, 3);
  moles[3] = new Mole (color(70, 40, 50), 1065, 270, 5);
 
} 

void draw() {
  background(50, 100, 50);
  stroke(0); 
  fill(40); 
  rect(150, 150, 120, 120); //jole 1
  stroke(0);
  fill(40); 
  rect(450, 150, 120, 120); //hole 2
  stroke(0); 
  fill(40); 
  rect(750, 150, 120, 120); //hole 3
  stroke(0); 
  fill(40); 
  rect(1050, 150, 120, 120); //hole 4
  
  moles[0].display();
 
  moles[1].display();
 
  moles[2].display();
 
  moles[3].display();
}
  void display() {

    stroke(0); 
    fill(c); 
    rect(xpos, ypos, 90, 140); //mole
  }
 
