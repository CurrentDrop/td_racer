ArrayList<Character> input_keys = new ArrayList();

Racer racer;
Track track;

void setup() {
  size(600, 600);
  textAlign(LEFT, TOP);
  track = new Track();
  racer = new Racer(track.chunk_size * 1, track.chunk_size * 3 + track.chunk_size / 2,track);
}

void draw() {
  background(200);

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
