class Chunk {
  float posX; //X Possition of the cunk
  float posY; //Y Possition of the cunk
  float size; //width and height of the chunk
  float trackWidth; // Track width
  int type; //with type of chunk it is
  int id;   //the id of the cunk

  Chunk(float posX, float posY, float size, int type, int id) {
    this.posX = posX;
    this.posY = posY;
    this.size = size;
    this.type = type;
    this.id = id;

    this.trackWidth = size * 0.75;
  }

  void display() {
    textAlign(LEFT, TOP);
    fill(255, 0, 0);
    pushMatrix();
    translate(this.posX, this.posY);
    //rect(0, 0, size, size);
    if (this.type == 0) {
      //Blank chunk
      rect(0, 0, this.size, this.size);
    } else if (this.type == 1) {
      //Strait horisontal chunk
      straitChunk(0);
    } else if (this.type == 2) {
      //Strait vertical chunk
      straitChunk(1);
    } else if (this.type == 3) {
      //top left curved chunk
      curvedChunk(0);
    } else if (this.type == 4) {
      //top right curved chunk
      curvedChunk(1);
    } else if (this.type == 5) {
      //bottom right curved chunk
      curvedChunk(2);
    } else if (this.type == 6) {
      //bottom left curved chunk
      curvedChunk(3);
    }
    popMatrix();
  }
  private void curvedChunk(int dir) {
    stroke(strokeColor);
    pushMatrix();
    if (dir == 1) {
      rotate(HALF_PI);
      translate(0, -size);
    }
    else if (dir == 2) {
      rotate(PI);
      translate(-size, -size);
    }
    else if (dir == 3) {
      rotate(PI + HALF_PI);
      translate(-size, 0);
    }

    float r1 = size + trackWidth;
    float r2 = size - trackWidth;
    fill(trackColor);
    arc(0,0,r1,r1,0,HALF_PI);
    fill(gameBoardColor);
    arc(0,0,r2,r2,0,HALF_PI);
    popMatrix();
  }

  private void straitChunk(int dir) {
    pushMatrix();
    if (dir == 1) {
      rotate(PI / 2);
      translate(0, -size);
    }
    float l1 = size/2 + trackWidth/2; 
    float l2 = size/2 - trackWidth/2;
    noStroke();
    fill(trackColor);
    rect(0,l2,size,trackWidth);
    stroke(strokeColor);
    line(0, l1, size, l1);
    line(0, l2, size, l2);
    popMatrix();
  }
}
