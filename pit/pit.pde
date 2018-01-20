import de.looksgood.ani.*;
import processing.serial.*;

Serial serialPort; // Arduinoにデータを送るシリアルポート
boolean firstContact = false;  //Arduinoからのはじめの送信を確認する

byte[] inByte = new byte[3]; // 受信データ用バッファ

int oval1; //<>//
int oval2; //<>//


float x = 100;
float y = 1.0;
float z = 1.0;
float c = 75;
float r = 0;
float x1 = 700;
float y1 = 200;
float t = 0;

void setup(){
  fullScreen();
  smooth();
  noStroke();
  background(100);

  //アルディーノけい
  printArray(Serial.list()); // 使用可能なシリアルポート一覧の出力。デバッグ用
  String portName = Serial.list()[0]; // 使用するシリアルポート名
  serialPort = new Serial(this, portName, 9600);
  serialPort.buffer(inByte.length); // 読み込むバッファの長さをの指定

  oval1 = 70; //<>//
  oval2 = 70; //<>//

  // Aniの記述
  Ani.init(this);
  AniSequence seq = new AniSequence(this);
  seq.beginSequence();
  seq.beginStep();
  seq.add( Ani.to( this, 6.0, "t", 10, Ani.LINEAR));
  seq.endStep();
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
  if(x < x1 && y > 98) {
      fill(220);
      ellipse(x1, y1, 35, 50);
  }
  era(x, y, r, r);
  if(x1 == 200 ){
    fill(255);
    ellipse(200, 400, 200, 200);
  }
  fill(0);
  ellipse(200, 400, z, z);
  if(z == 0){
    oval1 = 15; //<>//
    sendServo(1, oval1);
    oval2 = 15; //<>//
    sendServo(2, oval2);
  }
}


// シリアルポートにデータが受信されると呼び出されるメソッド
void serialEvent(Serial port) {
  inByte = port.readBytes();

  if (firstContact == false) {
    if (inByte[0] == 'C') { // Arduinoとの接続確認
      port.clear();
      firstContact = true;
      sendServo(1, 70);
      sendServo(2, 70);
    }
  }
}

// シリアルポートにサーボの値を送るメソッド
void sendServo(int id, int value)
{
  if (!firstContact) return;
  int v = value;
  if (v < 15) v = 15; // サーボの最小値。個体差による。
  if (v > 125) v = 125; // サーボの最大値。個体差による。
  serialPort.write((byte)'S');
  serialPort.write((byte)id);
  serialPort.write((byte)v);
}