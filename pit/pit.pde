import de.looksgood.ani.*;


float x = 800;
float y = 1.0;
float z = 0;
float c = 75;
float r = 0;
float x1 = 700;
float y1 = 200;

void setup(){
  fullScreen();
  smooth();
  noStroke();
  background(100);

  // Aniの記述
  Ani.init(this);
  AniSequence seq = new AniSequence(this);
  seq.beginSequence();
  seq.beginStep();
  seq.add( Ani.to( this, 1.5, "x", 900, Ani.LINEAR));
  seq.add( Ani.to( this, 1.5, "y", 500, Ani.CUBIC_IN));
  seq.endStep();
  seq.beginStep();
  seq.add( Ani.to( this, 2.0, "x", 1300, Ani.LINEAR));
  seq.add( Ani.to( this, 2.0, "y", 100, Ani.BACK_IN));
  seq.endStep();
  for(int i = 0; i < 10; i++){
    seq.beginStep();
    seq.add( Ani.to( this, 1.0, "x", x - 60, Ani.LINEAR));
    seq.add( Ani.to( this, 1.0, "y", y + 600, Ani.CUBIC_IN));
    seq.endStep();
    seq.beginStep();
    seq.add( Ani.to( this, 1.0, "x", x - 60, Ani.LINEAR));
    seq.add( Ani.to( this, 1.0, "y", y - 600, Ani.CUBIC_IN));
    seq.add( Ani.to( this, 1.0, "c", c + 20, Ani.LINEAR));
    seq.add( Ani.to( this, 1.0, "r", r + 10, Ani.LINEAR));
    seq.endStep();
  }
  seq.beginStep();
  seq.add( Ani.to( this, 2.0, "z", z + 200, Ani.LINEAR));
  seq.endStep();
  seq.beginStep();
  seq.add( Ani.to( this, 1.0, "x", 200, Ani.CUBIC_IN));
  seq.add( Ani.to( this, 1.0, "y", 400, Ani.CUBIC_IN));
  seq.endStep();
  seq.beginStep();
  seq.add( Ani.to( this, 1.0, "x1", 200, Ani.CUBIC_IN));
  seq.add( Ani.to( this, 1.0, "y1", 400, Ani.CUBIC_IN));
  seq.endStep();
  seq.beginStep();
  seq.add( Ani.to( this, 2.0, "z", 0, Ani.LINEAR));
  seq.endStep();
  seq.endSequence();

  seq.start();

  
}
void draw(){
  background(c);
  if(x < width / 2) {
      fill(220);
      ellipse(x1, y1, 35, 50);
  }
  era(x, y, r, r);
  if(x1 == 200){
    fill(255);
    ellipse(200, 400, 200, 200);
  }
  fill(0);
  ellipse(200, 400, z, z);
}
