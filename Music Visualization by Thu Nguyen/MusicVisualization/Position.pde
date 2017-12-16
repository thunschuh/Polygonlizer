class Position {

  void drawPos() {
    int totalSeconds =(int) (player.length()/1000)  % 60;
    int totalMinutes = (int)(player.length()/60000) % 60;
    int actSeconds = (int)(player.position()/1000) % 60;
    int actMinutes = (int)(player.position()/(60000)) % 60;
    
    
    float playPos = player.position();
    float playLen = player.length();
    float xpos = (playPos / playLen) * width;
    strokeWeight(10);
    stroke(10);
    line (0, height, width, height);
    stroke(255);
    line (0, height, xpos, height);


    println(actMinutes+":"+actSeconds+"/"+totalMinutes+":"+totalSeconds);


    //Interprt and titel of the song
    String titel = player.getMetaData ().title();
    String interpret = player.getMetaData ().author ();

    text(interpret+"\n"+titel, 20, height-30);
  }
}
