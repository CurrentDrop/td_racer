ArrayList<Character> input_keys = new ArrayList();

Racer racer;
Track track;

int game_width = 600;
int game_height = 600;
color background_color = color(200);
color game_color = color(#0CAA1D);
color track_color = color(#676767);
void setup() {
  size(800, 800);
  textAlign(LEFT, TOP);
  track = new Track(0,0, game_width, game_height);
  racer = new Racer(track.chunk_size * 1, track.chunk_size * 3 + track.chunk_size / 2,track);
}

void draw() {
  background(background_color);

  keyHandler();


  track.display();
  
  racer.display();
  racer.update();
}


void keyHandler() {
  if (input_keys.contains('w')) racer.accelerate();
  if (input_keys.contains('a')) racer.stear(-0.05);
  if (input_keys.contains('d')) racer.stear(0.05);
  if (input_keys.contains('s')) racer.retard();
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
