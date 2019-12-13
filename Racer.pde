class Racer {

  float start_x;
  float start_y;

  PVector pos;
  PVector acc;
  PVector vel;
  float heading;
  float scalar = 10;
  int score;

  int previus_chunk;

  Track track;
  boolean onTrack = true;

  Racer(float start_x, float start_y, Track track) {
    this.start_x = start_x;
    this.start_y = start_y;

    pos = new PVector(start_x, start_y);
    acc = new PVector();
    vel = new PVector();
    heading = 0;
    score = 0;
    this.track = track;

    previus_chunk = track.get_chunk(this.pos.x, this.pos.y).ID;

  }


  void update() {
    Chunk chunk = track.get_chunk(this.pos.x, this.pos.y);
    this.onTrack = chunk.onTrack(this.pos.x, this.pos.y);
    if (!this.onTrack) {
      reset();
    } else {

      int current_chunk = this.track.get_chunk(this.pos.x, this.pos.y).ID;
      if (current_chunk != previus_chunk) {
        score++;
        println(score);
      }
      previus_chunk = current_chunk;
    }

    PVector new_vel = PVector.fromAngle(heading);
    new_vel.setMag(vel.mag());
    new_vel.add(acc);
    new_vel.mult(0.99);
    if (new_vel.mag() < 0.05) new_vel.setMag(0);

    vel = new_vel.copy();
    pos.add(vel);
    acc.mult(0);
  }


  void display() {
    strokeWeight(2);
    pushMatrix();
    translate(this.pos.x, this.pos.y);
    rotate(heading);
    if (onTrack) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    triangle(1 * scalar, 0, -1 * scalar, 0.5 * scalar, -1 * scalar, -0.5 * scalar);
    popMatrix();
  }


  void accelerate() {
    PVector force = PVector.fromAngle(heading);
    force.setMag(0.1);
    addForce(force);
  }


  void retard() {
    this.vel.mult(0.95);
  }


  void stear(float angle) {
    this.heading += angle;
  }


  void addForce(PVector force) {
    this.acc.add(force);
  }


  void reset() {
    this.pos.set(start_x, start_y);
    this.vel.mult(0);
    this.heading = 0;
    this.score = 0;
    previus_chunk = this.track.get_chunk(this.pos.x, this.pos.y).ID;
  }
}
