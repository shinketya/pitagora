import de.looksgood.ani.*;

void setup(){
  fullScreen();
  smooth();
  noStroke();
  fill(0);

  // Aniの記述
  Ani.init(this);
  
}

void draw(){
  era(400, 100, 0, 0);
  era(400, 200, 15, 0);
  era(400, 300, 30, 0);
  era(400, 400, 30, 15);
}