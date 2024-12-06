import controlP5.*;


class GamjaWidget extends Widget{
  PImage gamjaImage; // 감자 이미지를 저장할 변수

  GamjaWidget(float x, float y, float width, float height,float radius, color bgColor) {
    super(x, y, width, height, radius, bgColor);

    gamjaImage = loadImage("gamja.png");

  }

  
  @Override
  void display() {
    fill(255, 204, 0);  // GamjaWidget만의 고유한 색상
    rect(x, y, width, height,radius);

    image(gamjaImage,x+100,y+30, 166, 154);

  }
}

