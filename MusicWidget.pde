import controlP5.*;


class MusicWidget extends Widget{
  PImage MusicImage; // 노래 이미지를 저장할 변수
  float scrollY;
  String MusicURL = "https://music.youtube.com/"; // 노래 링크
  
  MusicWidget(float x, float y, float width, float height, float radius,color bgColor) {
    super(x, y, width, height, radius, bgColor);
    MusicImage = loadImage("music.png");
  }
  
  
  @Override
  void display() {
    fill(249,242,232);  // MusicWidget만의 고유한 색상
    rect(x, y, width, height,radius);
    fill(0);
    
    image(MusicImage, x, y, width - 10, height - 10);
  }
  
  
  boolean isPluseClicked(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 12;
    float plusY = y + 12 + scrollY;
    float plusWidth = 80;
    float plusHeigh = 80;
    
    if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("음악버튼 클릭");
      return true;
    }
    return false;
    
  }
  
  void moveLink() {
    link(MusicURL);
  }
  
}
