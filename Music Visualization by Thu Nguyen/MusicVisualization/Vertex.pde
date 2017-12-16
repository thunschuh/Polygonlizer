class Vertex {
  Vertex() {
        //pos.drawPos();
  }
  
  void drawShape() {

    int circleResolution = (int)map(position/100*frequent, 0, height, 2, 10);
    float radius = (wave/10)-height/2.5 + 0.5;
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
  }
}
