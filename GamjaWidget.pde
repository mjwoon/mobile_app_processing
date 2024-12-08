

class GamjaWidget extends Widget{
  PImage leftArrowImage, rightArrowImage;
  PImage gmajaLabelImage;
  PImage[] gamjaImages = new PImage[3];
  PImage[] gamjaMents = new PImage[3];
  PImage novelMent, novelWriter;
  PImage pointImage1, pointImage2;

  int currentIndex = 0; 
  boolean screenChanged = false;  // 화면 전환 여부 확인
  float scrollY; // 스크롤 위치를 저장할 변수

  GamjaWidget(float x, float y, float width, float height
  ,float radius, color bgColor) {
    super(x, y, width, height, radius, bgColor);

    gamjaImages[0] = loadImage("gamja1.png");
    gamjaImages[1] = loadImage("gamja2.png");
    gamjaImages[2] = loadImage("gamja3.png");

    gamjaMents[0] = loadImage("gamjaMent1.png");
    gamjaMents[1] = loadImage("gamjaMent2.png");
    gamjaMents[2] = loadImage("gamjaMent3.png");

    novelMent = loadImage("novelMent1.png");
    novelWriter = loadImage("novelWriter.png");

    leftArrowImage = loadImage("GleftArrow.png");
    rightArrowImage = loadImage("GrightArrow.png");

    gmajaLabelImage = loadImage("gamjaLabel.png");

    pointImage1 = loadImage("selectPoint.png");
    pointImage2 = loadImage("normalPoint.png");
  }

  @Override
  void display() {
    fill(255, 255, 255);  // GamjaWidget만의 고유한 색상
    rect(x, y, width, height, radius);

    image(gmajaLabelImage, x+324, y+ 191, 20,12);

    if(!screenChanged){
      image(gamjaImages[currentIndex],x + 101,y + 42,166,154); // 감자 사진
      image(gamjaMents[currentIndex],x + 210, y+ 38,139,14);  // 감자의 멘트
      image(rightArrowImage, x + 330, y+106,12,12);
      image(pointImage1, x + 168, y+195);
      image(pointImage2, x + 183, y+195);
    } else {
      image(novelMent, x + 40, y + 100, 285, 16);   // 글귀
      image(novelWriter,x + 250, y + 20,80,13);   // 글귀 작가
      image(leftArrowImage, x + 12, y+106,12,12);
      image(pointImage1, x + 183, y+195);
      image(pointImage2, x + 168, y+195);
    }
  }

  boolean isRightArrowClicked(float mouseX, float mouseY, float scrollY){
    float rArrowX = x+330;
    float rArrowY = y+106+scrollY;
    float rArrowWidth = 12;
    float rArrowHeight = 12;

    if(mouseX > rArrowX && mouseX < rArrowX + rArrowWidth &&
    mouseY > rArrowY && mouseY < rArrowY + rArrowHeight){
        println("오른쪽 화살표 클릭");
        return true;
    }
    return false;
  }

  boolean isLeftArrowClicked(float mouseX, float mouseY, float scrollY){
      float lArrowX = x+12;
      float lArrowY = y+106+scrollY;
      float lArrowWidth = 12;
      float lArrowHeight = 12;
      if(mouseX > lArrowX && mouseX < lArrowX + lArrowWidth &&
      mouseY > lArrowY && mouseY < lArrowY + lArrowHeight){
          println("왼쪽 화살표 클릭");
          return true;
      }
      return false;
  }

  boolean isGamjaClicked(float mouseX, float mouseY, float scrollY){
    float gamjaX = x + 101;
    float gamjaY = y + 42 + scrollY;
    float gamjaWidth = 166;
    float gamjaHeight = 154;
    if(mouseX > gamjaX && mouseX < gamjaX + gamjaWidth &&
    mouseY > gamjaY && mouseY < gamjaY + gamjaHeight){
        println("감자 클릭");
        return true;
    }
    return false;
  }

  void changeImage(){
    if (currentIndex < gamjaImages.length - 1) {
      currentIndex += 1;  // 다음 화면으로
    } else{
      currentIndex = 0;
    }
  }

  void nextScreen(){
    screenChanged = true;
  }
  void beforeScreen(){
    screenChanged = false;
  }
}

