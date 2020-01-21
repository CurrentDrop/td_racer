class GameObject {
  GameBoard gb;
  Handler handler;

  PVector pos;
  PVector vel;
  PVector acc;
  float heading;

  color c = #00FF00;
  int size = 10;

  Chunk currentChunk;

  GameObject(GameBoard gb, Handler handler) {
    this.gb = gb;
    this.handler = handler;

    pos = gb.getStartingPos();
    vel = new PVector();
    acc = new PVector();
    this.heading = gb.getStartingHeading();
  }

  void update() {
    PVector new_vel = PVector.fromAngle(this.heading);
    new_vel.setMag(this.vel.mag());
    new_vel.add(this.acc);
    this.acc.mult(0);
    this.vel = new_vel;
    this.pos.add(vel);

    this.currentChunk = gb.getCurrentChunk(gb.getCurrentChunkID(this.pos.x, this.pos.y));
    if (!this.currentChunk.onTrack(this.pos.x, this.pos.y)) {
      this.handler.remove(this);
    }
  }


  void accelerate() {
    PVector force = PVector.fromAngle(this.heading);
    force.setMag(0.1);
    addForce(force);
  }


  void decelerate(float rate) {
    this.vel.mult(rate);
  }


  void addForce(PVector force) {
    this.acc.add(force);
  }


  void display() {
    noFill();
    strokeWeight(1);
    stroke(this.c);
    pushMatrix();
    translate(this.pos.x + gb.gamePosX, this.pos.y + gb.gamePosY);
    rotate(this.heading);
    triangle(size, 0, -size, size / 2, -size, -size / 2);
    popMatrix();
  }
}
