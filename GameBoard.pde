class GameBoard {
  private int[][] track = {
    {5, 1, 1, 6}, 
    {2, 5, 1, 3}, 
    {2, 4, 1, 6}, 
    {4, 1, 1, 3}, 
  };
  Chunk[] chunks;

  int nCol;
  int nRow;
  int gamePosX;
  int gamePosY;

  float chunkSize;

  GameBoard(int gamePosX, int gamePosY, int gameWidth, int gameHeight) {
    this.gamePosX = gamePosX;
    this.gamePosY = gamePosY;

    nCol = track[0].length;
    nRow = track.length;

    println(nCol, nRow);
    println(gameWidth / nCol, gameHeight / nRow);
    if (gameWidth / nCol > gameHeight / nRow) {
      chunkSize = gameHeight / nCol;
    } else {
      chunkSize = gameWidth / nRow;
    }

    chunks = loadChunks(track);
  }

  void display() {
    stroke(0);
    pushMatrix();
    translate(this.gamePosX, this.gamePosY);
    fill(gameBoardColor);
    rect(0,0, gameWidth, gameHeight);
    for (Chunk chunk : chunks) {
      chunk.display();
    }
    popMatrix();
  }

  Chunk[] loadChunks(int[][] track) {
    int nRow = track.length;
    int nCol = track[0].length;
    int id = 0;

    Chunk[] chunks = new Chunk[nRow * nCol];
    for (int i = 0; i < nRow; i++) {
      for (int j = 0; j < nCol; j++) {
        int type = track[i][j];
        float posX = chunkSize * j;
        float posY = chunkSize * i;
        chunks[id] = new Chunk(posX, posY, chunkSize, type, id);
        id++;
      }
    }
    return chunks;
  }
}
