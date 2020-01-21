class Handler {
  ArrayList<GameObject> handler = new ArrayList();

  void update() {
    //for(GameObject gameObject: this.handler){
    for (int i = 0; i < handler.size(); i++) {
      GameObject gameObject = handler.get(i);
      gameObject.update();
      gameObject.display();
    }
  }

  void add(GameObject gameObject) {
    handler.add(gameObject);
  }

  void remove(GameObject gameObject) {
    handler.remove(gameObject);
  }
}
