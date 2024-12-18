

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
  String GlgamURL = "https://www.glgam.com/";

  // 감자 클릭 후 멘트를 표시하기 위한 추가 변수
  boolean showMent = false;  // 멘트 표시 여부
  int mentStartTime = 0;     // 멘트 표시 시작 시간


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
    stroke(#E0D9D0);
    fill(#F4E4CE);  // GamjaWidget만의 고유한 색상
    rect(x, y, width, height, radius);

    image(gmajaLabelImage, x+324, y+ 191, 20,12);

    if(!screenChanged){
      image(gamjaImages[currentIndex],x + 101,y + 42,166,154); // 감자 사진
      
      // 감자 멘트를 클릭한 후 2초 동안만 표시
      if (showMent) {
        image(gamjaMents[currentIndex], x + 210, y + 38, 139, 14);
        // 1초가 지나면 멘트를 숨김
        if (millis() - mentStartTime > 1000) {
          showMent = false;
        }
      }

      image(rightArrowImage, x + 330, y+106,12,12);
      image(pointImage1, x + 168, y+195);
      image(pointImage2, x + 183, y+195);
    } else {
      image(novelMent, x + 55, y + 100, 270, 20);   // 글귀
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

  boolean isGamjaLabelClicked(float mouseX, float mouseY, float scrollY){
    float gamjaLabelX = x + 324;
    float gamjaLabelY = y + 191 + scrollY;
    float gamjaLabelWidth = 25;
    float gamjaLabelHeight = 15;
    if(mouseX > gamjaLabelX && mouseX < gamjaLabelX + gamjaLabelWidth &&
    mouseY > gamjaLabelY && mouseY < gamjaLabelY + gamjaLabelHeight){
        println("감자로고 클릭");   
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
        showMent = true;
        mentStartTime = millis();     
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

    void moveLink(){
        link(GlgamURL);
    }

  void nextScreen(){
    screenChanged = true;
  }
  void beforeScreen(){
    screenChanged = false;
  }
}

