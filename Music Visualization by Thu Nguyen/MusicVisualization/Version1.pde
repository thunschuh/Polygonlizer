class Version1 {

  Version1() {
  }

  void drawShape() {

    background(50);
    player.play();
    fill(255);
    pos.drawPos();

    translate(width/2, height/2);
    beginShape();
    strokeWeight(2);
    stroke(-1, 50);
    for (int i = 0; i < player.bufferSize (); i+=30)
    {
      noFill();
      float x2 = (player.left.get(i)*150)*cos(i);
      float y2 = (player.right.get(i)*150)*sin(i);
      vertex(x2, y2);
      pushStyle();
      stroke(-1);
      strokeWeight(2);
      line(x2, y2, x2, y2);
      popStyle();
    }
    endShape();
    
    //Draws shapes
    pushMatrix();
    
    //eckpunkte
    int circleResolution = (int)map(position/100*frequent, 0, height, 2, 10);
    //gro
    float radius = (wave)-height/2 + 0.5;
    float angle = TWO_PI/circleResolution;

    strokeWeight(2);
    stroke(255, 25);

    beginShape();
    rotate(radians(frameCount)); 
    for (int i=0; i<=circleResolution; i++) {
      float x = 0 + cos(angle*i) * radius;
      float y = 0 + sin(angle*i) * radius;
      vertex(x, y);
    }
    endShape();
    popMatrix();
    
  }
}
