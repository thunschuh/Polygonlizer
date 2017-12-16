import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;


Minim minim;
AudioPlayer player;
BeatDetect beat;
FFT fft;
Version1 v1;
Version2 v2;
Position pos;
Vertex vertex;

ArrayList form;
float eRadius;
String Version = "Version1";
int position;
float frequent;
float wave;
float volume;
int music=1;


void setup() {
  size(displayWidth, displayHeight);
  // size(700, 500);
  smooth();
  noFill();
  background(50);
  form = new ArrayList();
  minim =new Minim(this);
  player = minim.loadFile("data/1-02 1절만 하시죠.mp3");
  beat = new BeatDetect();
  v1 = new Version1();
  v2 = new Version2();
  pos = new Position();
  fft = new FFT (player.bufferSize (), player.sampleRate ());
  ellipseMode(CENTER);
  // player.play();
}

void draw() {
  
  position = player.position();


  //get the fft band
  fft.forward( player.mix );
  for (int i = 0; i < fft.specSize (); i++)
  {
    frequent = fft.getBand(i)*8;
  }

//geht the left audio chanenel
  for (int i = 0; i < player.bufferSize () - 1; i++)
  {
    wave = 75 + player.left.get(i)*50;
  }
  ///////
  //Load the different Version of the music visualizations
  /////////
  //Version 1
  if (Version == "Version1") {
    pos.drawPos();
    v1.drawShape();
    //Version 2
  } else if (Version == "Version2") {
    v2.drawShape();

    //Version 3
    //Adds the object in a arraylist
  } else if (Version == "Version3") {
    pos.drawPos();
    translate(width/2, height/2);
    player.play();
    form.add(new Vertex());
    pushMatrix();

    //Call Arraylist
    for (int i = 0; i < form.size (); i++ ) { 
      Vertex v = (Vertex) form.get(i);
      v.drawShape();
    }
    popMatrix();
    //Remove items from the arraylist backwards
    if (form.size() > 30) {
      for (int i = form.size () - 1; i >= 0; i--) {
        Vertex v = (Vertex) form.get(i);
        form.remove(i);
        noStroke();
        fill(50, 20 );
        rect(-(width/2), height/2-40, width, -(height-60));
      }
    }
  }//ende if


  ///////
  //BEATDETECT
  /////////
  beat.detect(player.mix);

  // Trigger of the BeatDetection
  if ( beat.isOnset() ) eRadius = 3;
  if ( eRadius < 0.1 ) eRadius = 0.1;

  // Draws the circle
  for (float i=1; i<10; i+=0.3) {
    //color change of the version
    if (Version == "Version1") {
      fill (165, 18, 18, 10/i*i);
    } else if (Version == "Version2") {
      fill (23, 85, 84, 10/i*i);
    } else if (Version == "Version3") {
      fill (55, 4, 93, 10/i*i);
    }
    ellipse(0, 0, eRadius*i*i, eRadius*i*i);
  }
  eRadius *= 0.95;

  //musicliste
  if (music > 6) {
    music = 1;
  } else if (music < 0) {
    music = 5;
  }
}

//Switch Versions
void keyPressed() {
  switch(keyCode) {
  case '1':
    Version = "Version1";
    break;
  case '2':
    Version = "Version2";
    break;
  case '3':
    Version = "Version3";
    background(50, 60);
    break;
  }


//Switching songs
  if (keyCode == RIGHT ) {
    music++;
    switch(music) {
    case 1:
      background(50, 60);
      player.close();
      player = minim.loadFile("1-02 1절만 하시죠.mp3");
      break;
    case 2:
      background(50, 60);
      player.close();
      player = minim.loadFile("data/Make It Stop (September's Children).mp3");
      break;
    case 3:
      background(50, 60);
      player.close();
      player = minim.loadFile("data/02 COME BACK HOME.mp3");
      break;
    case 4:
      background(50, 60);
      player.close();
      player = minim.loadFile("data/02 Sugar Free.mp3");
      break;
    case 5:
      background(50, 60);
      player.close();
      player = minim.loadFile("data/1-02 헤픈엔딩 (Feat. 조원선 of 롤러코스터).mp3");
      break;
    }
  } else if (keyCode == RIGHT && music == 5) {
    music = 1;
  }
  if (keyCode == LEFT) {
    music--;
    switch(music) {
    case 1:
      background(50, 60);
      player.close();
      player = minim.loadFile("02 Sugar Free.mp3");
      break;
    case 2:
      background(50, 60);
      player.close();
      player = minim.loadFile("data/Make It Stop (September's Children).mp3");
      break;
    case 3:
      background(50, 60);
      player.close();
      player = minim.loadFile("data/02 COME BACK HOME.mp3");
      break;
    case 4:
      background(50, 60);
      player.close();
      player = minim.loadFile("data/1-02 1절만 하시죠.mp3");
      break;
    case 5:
      background(50, 60);
      player.close();
      player = minim.loadFile("data/1-02 헤픈엔딩 (Feat. 조원선 of 롤러코스터).mp3");
      break;
    }
  }
}


//Fullscreen Window
boolean sketchFullScreen() {
  return true;
}
