class FullNote extends Widget {
  PImage fullNote;
  
  FullNote(float x, float y, float width, float height, float radius, color bgColor) {
    super(x, y, width, height, radius, bgColor);
    fullNote = loadImage("memopage.png");
  }
  
  @Override
  void display() {
    rect(x, y, width, height);
    noStroke(); 
    image(fullNote, x, y, width, height);
  }
}