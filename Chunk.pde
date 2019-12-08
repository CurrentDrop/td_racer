class Chunk {
  float x, y, size;
  int mode, ID;
  Chunk(float x, float y, int size, int mode, int ID) {
    this.x = x * size;
    this.y = y * size;
    this.size = size;
    this.mode = mode;
    this.ID = ID;
  }

  void display() {
    //Draw the given track type
    float track_width = size * 0.75;
    
    pushMatrix();
    translate(x, y);
    strokeWeight(5);
    //fill(0);
    //text(this.ID, 0,0);
    noFill();
    //rect(0, 0, size, size);
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
