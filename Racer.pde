class Racer {
  GameBoard gb;
  PVector pos;
  PVector vel;
  PVector acc;
  float heading;
  float size;
  int currentChunkID;
  Racer(GameBoard gb) {
    this.gb = gb;
    this.pos = gb.getStartingPos();
    this.vel = new PVector();
    this.acc = new PVector();
    this.heading = gb.getStartingHeading();
    this.size = 10;
  }

  void update() {
    PVector newVel = PVector.fromAngle(heading);
    newVel.setMag(this.vel.mag());
    newVel.add(this.acc);
    newVel.mult(0.99);
    this.vel = newVel.copy();
    this.pos.add(this.vel);
    this.acc.mult(0);
    getControlls();
    currentChunkID = gb.getCurrentChunkID(this.pos.x, this.pos.y);
  }
  void getControlls() {
    if (input_keys.contains('w')) {
      this.accelerate();
    }
    if (input_keys.contains('s')) {
      this.decelerate();
    }
    if (input_keys.contains('a')) {
      this.heading -= 0.05;
    }
    if (input_keys.contains('d')) {
      this.heading += 0.05;
    }
  }
  void display() {
    noFill();
    strokeWeight(1);
    pushMatrix();
    translate(this.pos.x + gb.gamePosX, this.pos.y + gb.gamePosY);
    fill(255, 0, 0);
    Chunk currentChunk = gb.getCurrentChunk(currentChunkID);
    text((int)this.pos.x + ", " + (int)this.pos.y + "\n"+ 
    (int)(this.pos.x - currentChunk.posX) + ", " + (int)(this.pos.y - currentChunk.posY)+ "\n"+
      currentChunkID, 15, 0);
    if (currentChunk.onTrack(this.pos.x, this.pos.y)) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }
    rotate(this.heading);
    triangle(size, 0, -size, size / 2, -size, -size / 2);
    popMatrix();
  }
  void accelerate() {
    PVector force = PVector.fromAngle(this.heading);
    force.setMag(0.1);
    addForce(force);
  }
  void decelerate() {
    PVector force = PVector.fromAngle(this.heading + PI);
    force.setMag(0.1);
    addForce(force);
  }
  void addForce(PVector force) {
    this.acc.add(force);
  }
}
