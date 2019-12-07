//Reminder...
//Chunk generation are done
//next step, draw Chunks on the track.


class Track {
  private int[][] track = {
    {4, 0, 0, 5}, 
    {1, 4, 0, 2}, 
    {1, 3, 0, 5}, 
    {3, 0, 0, 2}
  };
  Chunk[] track_chunks;

  int track_rows;
  int track_cols;

  int chunk_size;

  Track() {
    chunk_size = height/track.length;
    
    track_chunks = new Chunk[track.length * track[0].length];
    int chunk_id = 0;
    for (int row = 0; row < track.length; row++) {
      for (int col = 0; col < track.length; col++) {
        track_chunks[chunk_id] = new Chunk(col,row, chunk_size, track[col][row], chunk_id);
        chunk_id++;
      }
    }

    track_rows = track.length;
    track_cols = track[0].length;

    
  }
  int get_chunk_type(PVector pos) {
    //return the type of chunk at the given possition
    int x = (int) map(pos.x, 0, width, 0, track_cols);
    int y = (int) map(pos.y, 0, height, 0, track_rows);

    int chunk_mode;
    try {
      chunk_mode = track[y][x];
    }
    catch(ArrayIndexOutOfBoundsException e) {
      chunk_mode = 10;
    }
    return chunk_mode;
  }

  void display() {
    //draw the chunks here!!
  }
}
