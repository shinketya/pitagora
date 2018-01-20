// 消しゴムを表示する関数
void era(float x, float y, float r, float f){
  fill(128);
  ellipse(x - 70 + r, y, 80, 80);
  fill(220);
  ellipse(x - 70 + r, y, 79, 79);
  fill(0);
  beginShape();
  vertex(x - 70 + f, y + 40);
  vertex(x + 70, y + 40);
  vertex(x + 70, y + 20);
  vertex(x - 70 + f, y + 20);
  endShape(CLOSE);
  fill(220);
  beginShape();
  vertex(x - 70 + f, y + 20);
  vertex(x + 70, y + 20);
  vertex(x + 70, y + -20);
  vertex(x - 70 + f, y + -20);
  endShape(CLOSE);
  fill(#051EF5);
  beginShape();
  vertex(x - 70 + f, y + -20);
  vertex(x + 70, y + -20);
  vertex(x + 70, y + -40);
  vertex(x - 70 + f, y + -40);
  endShape(CLOSE);
}