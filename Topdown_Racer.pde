
color backgroundColor = color(200);
color gameBoardColor = #03F9FF;
color trackColor = #000000;
color strokeColor = #FFFFFF;

int gamePosX = 10;
int gamePosY = 10;
int gameWidth = 600;
int gameHeight = 600;
GameBoard gameBoard;

void setup() {
  size(800, 800);

  gameBoard = new GameBoard(gamePosX, gamePosY, gameWidth, gameHeight);
}

void draw() {
  background(backgroundColor);
  
  gameBoard.display();
}



ArrayList<Character> input_keys = new ArrayList();
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
