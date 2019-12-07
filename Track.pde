class Track {
  int[][] chunk_list = {
    {4, 0, 0, 5}, 
    {1, 4, 0, 2}, 
    {1, 3, 0, 5}, 
    {3, 0, 0, 2}
  };

  int track_rows;
  int track_cols;

  int chunk_size;
  Track() {
    
    track_rows = chunk_list.length;
    track_cols = chunk_list[0].length;
    
    chunk_size = height/chunk_list.length;
  }

  int get_chunk_type(PVector pos){
     //return the type of chunk at the given possition
     int x = (int) map(pos.x, 0,width, 0, track_cols);
     int y = (int) map(pos.y, 0,height, 0, track_rows);
     
     int chunk_mode;
     try{
     chunk_mode = chunk_list[y][x];
     }catch(ArrayIndexOutOfBoundsException e){
       chunk_mode = 10;
     }
     return chunk_mode;
  }

  void display() {
    for (int row=0; row < track_rows; row++) {
      for (int col=0; col < track_cols; col++) {
        int chunk_type = chunk_list[row][col];

        drawChunk(col * chunk_size,row * chunk_size, chunk_size, chunk_type);
      }
    }
  }
  
  
  void drawChunk(int x, int y,float size, int mode) {
  //Draw the given track type
  
  
  
  float track_width = size * 0.75;
  noFill();
  pushMatrix();
  translate(x,y);
  rect(0,0,size,size);
  if (mode == 0) {
    //Vertical lines
    line(0, size / 2 - track_width / 2, size, size / 2 - track_width / 2);
    line(0, size / 2 + track_width / 2, size, size / 2 + track_width / 2);
  } else if (mode == 1) {
    //Horisontal lines
    line(size / 2 - track_width / 2, 0, size / 2 - track_width / 2, size);
    line(size / 2 + track_width / 2, 0, size / 2 + track_width / 2, size );
  } else if (mode == 2) {
    //Arc top-left
    arc(0, 0, size + track_width, size + track_width, 0, TWO_PI * 0.25);
    arc(0, 0, size - track_width, size - track_width, 0, TWO_PI * 0.25);
  } else if (mode == 3) {
    //Arc top-right
    arc(size, 0, size + track_width, size + track_width, TWO_PI * 0.25, TWO_PI * 0.50);
    arc(size, 0, size - track_width, size - track_width, TWO_PI * 0.25, TWO_PI * 0.50);
  } else if (mode == 4) {
    //Arc bottom-left
    arc(size, size, size + track_width, size + track_width, TWO_PI * 0.50, TWO_PI * 0.75);
    arc(size, size, size - track_width, size - track_width, TWO_PI * 0.50, TWO_PI * 0.75);
  } else if (mode == 5) {
    //Arc bottom-right
    arc(0, size, size + track_width, size + track_width, TWO_PI * 0.75, TWO_PI);
    arc(0, size, size - track_width, size - track_width, TWO_PI * 0.75, TWO_PI);
  }
  popMatrix();
}
}
