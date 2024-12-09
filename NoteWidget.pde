class NoteWidget extends Widget {
  PImage noteImage; 
  NoteWidget(float x, float y, float width, float height, float radius, color bgColor) {
    super(x, y, width, height, radius, bgColor);

    noteImage = loadImage("note.png");
  }

  @Override
  void display() {
    fill(249,242,232);  
    rect(x, y, width, height);
    noStroke(); 
    image(noteImage, x, y, width, height);
  }
}