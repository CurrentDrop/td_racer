ArrayList<Character> input_keys = new ArrayList();
color backgroundColor = color(200);
color gameBoardColor = #000000;
color trackColor = #000000;
color strokeColor = #FFFFFF;

int gamePosX = 0;
int gamePosY = 0;
int gameWidth = 800;
int gameHeight = 800;
int gameSize;
GameBoard gameBoard;
Racer racer;

void setup() {
  size(800, 800);
  if(gameWidth < gameHeight){
    gameSize = gameWidth;
  }else{
    gameSize = gameHeight;
  }
  gameBoard = new GameBoard(gamePosX, gamePosY, gameSize, gameSize);
  racer = new Racer(gameBoard);
  println(gameBoard.getStartingPos());
}

void draw() {
  //println(frameRate);
  background(backgroundColor);
  
  gameBoard.display();
  racer.display();
  racer.update();
}




void keyHandler() {
  if (input_keys.contains('w')) ;
  if (input_keys.contains('a')) ;
  if (input_keys.contains('d')) ;
  if (input_keys.contains('s')) ;
}

void keyPressed() {
  if (!input_keys.contains(key)) {
    input_keys.add(key);
  }
}

void keyReleased() {
  if (input_keys.contains(key)) {
    input_keys.remove((Character) key);
  }
}
