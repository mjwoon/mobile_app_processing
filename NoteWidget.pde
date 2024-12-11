class NoteWidget extends Widget {
  PImage noteImage; 
  float scrollY;
  String MusicURL = "https://music.youtube.com/"; // 노래 링크 
  
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
  
  boolean isPluseClicked(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 12;
    float plusY = y + 12 + scrollY;
    float plusWidth = 160;
    float plusHeigh = 160;
    
    if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("메모 클릭");
      return true;
    }
    return false;
    
  }
}