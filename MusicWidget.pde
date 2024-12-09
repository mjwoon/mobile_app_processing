import controlP5.*;


class MusicWidget extends Widget{

  PImage MusicImage; // 노래 이미지를 저장할 변수

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

  
}