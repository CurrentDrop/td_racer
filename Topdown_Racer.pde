ArrayList<Character> input_keys = new ArrayList();
color backgroundColor = #000000;
color gameBoardColor = #000000;
color trackColor = #000000;
color strokeColor = #00BC14;

int gamePosX = 0;
int gamePosY = 0;
int gameWidth = 800;
int gameHeight = 800;
int gameSize;
GameBoard gameBoard;
Handler handler;
Racer racer;
GUI gui;

void setup() {
  size(1000, 800);
  if (gameWidth < gameHeight) {
    gameSize = gameWidth;
  } else {
    gameSize = gameHeight;
  }
  gameBoard = new GameBoard(gamePosX, gamePosY, gameSize, gameSize);
  handler = new Handler();

  gui = new GUI(800, 0, 200, 800);
}

void draw() {
  background(backgroundColor);
  if (handler.handler.size() < 1) {
    handler.add(new Racer(gameBoard, handler));
  }
  gameBoard.display();
  handler.update();
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
