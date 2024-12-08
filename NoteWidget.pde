class NoteWidget extends Widget {
  PImage noteImage; 
  NoteWidget(float x, float y, float width, float height, color bgColor) {
    super(x, y, width, height, bgColor);

    noteImage = loadImage("note.png");
  }

  @Override
  void display() {
    fill(#ffffff);  
    rect(x, y, width, height);
    noStroke(); 
    image(noteImage, x, y, width, height);
  }
}