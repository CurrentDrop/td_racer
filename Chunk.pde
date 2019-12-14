class Chunk {
  float x, y, size;
  float track_width;
  int mode, ID;
  Chunk(float x, float y, int size, int mode, int ID) {
    this.x = x * size;
    this.y = y * size;
    this.size = size;
    this.mode = mode;
    this.ID = ID;

    track_width = size * 0.75;
  }


  boolean onTrack(float racer_x, float racer_y) {
    float delta_x = racer_x - this.x;
    float delta_y = racer_y - this.y;

    if (this.mode == 0) {
      //Horisontal lines
      if (delta_y > size / 2 - track_width / 2) {
        if (delta_y < size / 2 + track_width / 2) {
          return true;
        }
      }
    } else if (this.mode == 1) {
      //Vertical lines
      if (delta_x > size / 2 - track_width / 2) {
        if (delta_x < size / 2 + track_width / 2) {
          return true;
        }
      }
    } else if (mode == 2) {
      //Arc top-left
      if (dist(0, 0, delta_x, delta_y) *2 > size - track_width) {
        if (dist(0, 0, delta_x, delta_y) *2 < size + track_width) {
          return true;
        }
      }
    } else if (mode == 3) {
      //Arc top-right
      if (dist(size, 0, delta_x, delta_y) *2 > size - track_width) {
        if (dist(size, 0, delta_x, delta_y) *2 < size + track_width) {
          return true;
        }
      }
    } else if (mode == 4) {
      //Arc bottom-left
      if (dist(size, size, delta_x, delta_y) *2 > size - track_width) {
        if (dist(size, size, delta_x, delta_y) *2 < size + track_width) {
          return true;
        }
      }
    } else if (mode == 5) {
      //Arc bottom-right
      if (dist(0, size, delta_x, delta_y) *2 > size - track_width) {
        if (dist(0, size, delta_x, delta_y) *2 < size + track_width) {
          return true;
        }
      }
    }  
    return false;
  }


  void display() {
    drawChunk(x,y,size,mode);
  }
  
void drawChunk(float x, float y,float size, int mode) {
  //Draw the given track type
  float track_width = size * 0.75;
  color c = color(#676767);
  color stroke_color = 0;
  strokeWeight(4);
  pushMatrix();
  translate(x,y);
   
  if (mode == 0) {
    //Vertical lines
    noStroke();
    fill(c);
    rect(0, size / 2 - track_width / 2, size, track_width);
    stroke(stroke_color);
    line(0, size / 2 - track_width / 2, size, size / 2 - track_width / 2);
    line(0, size / 2 + track_width / 2, size, size / 2 + track_width / 2);
  } else if (mode == 1) {
    //Horisontal lines
    noStroke();
    fill(c);
    rect(size / 2 - track_width / 2, 0,track_width, size);
    stroke(stroke_color);
    line(size / 2 - track_width / 2, 0, size / 2 - track_width / 2, size);
    line(size / 2 + track_width / 2, 0, size / 2 + track_width / 2, size );
  } else if (mode == 2) {
    //Arc top-left
    fill(c);
    arc(0, 0, size + track_width, size + track_width, 0, TWO_PI * 0.25);
    fill(bgColor);
    arc(0, 0, size - track_width, size - track_width, 0, TWO_PI * 0.25);
  } else if (mode == 3) {
    //Arc top-right
    fill(c);
    arc(size, 0, size + track_width, size + track_width, TWO_PI * 0.25, TWO_PI * 0.50);
    fill(bgColor);
    arc(size, 0, size - track_width, size - track_width, TWO_PI * 0.25, TWO_PI * 0.50);
  } else if (mode == 4) {
    //Arc bottom-left
    fill(c);
    arc(size, size, size + track_width, size + track_width, TWO_PI * 0.50, TWO_PI * 0.75);
    fill(bgColor);
    arc(size, size, size - track_width, size - track_width, TWO_PI * 0.50, TWO_PI * 0.75);
  } else if (mode == 5) {
    //Arc bottom-right
    fill(c);
    arc(0, size, size + track_width, size + track_width, TWO_PI * 0.75, TWO_PI);
    fill(bgColor);
    arc(0, size, size - track_width, size - track_width, TWO_PI * 0.75, TWO_PI);
  }
  popMatrix();
}
}
