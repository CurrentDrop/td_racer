class Racer extends GameObject {
  GameBoard gb;
  Racer(GameBoard gb, Handler handler) {
    super(gb, handler);
    this.c = #FF0000;
  }

  void update() {
    super.update();
    this.getControlls();
  }

  void getControlls() {
    if (input_keys.contains('w')) {
      this.accelerate();
    } else {
      this.decelerate(0.99);
    }
    if (input_keys.contains('s')) {
      this.decelerate(0.95);
    }
    if (input_keys.contains('a')) {
      this.heading -= 0.05;
    }
    if (input_keys.contains('d')) {
      this.heading += 0.05;
    }
  }
}
