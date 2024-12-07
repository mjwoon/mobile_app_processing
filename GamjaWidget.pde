

class GamjaWidget extends Widget{
  PImage gamjaImage; // 감자 이미지를 저장할 변수
  PImage arrawImage;
  PImage gamjaImage2;
  boolean screenChanged = false;  // 화면 전환 여부 확인
  float scrollY; // 스크롤 위치를 저장할 변수

  GamjaWidget(float x, float y, float width, float height
  ,float radius, color bgColor) {
    super(x, y, width, height, radius, bgColor);

    gamjaImage = loadImage("GeGam.png");
    arrawImage = loadImage("Arrow.png");
    gamjaImage2 = loadImage("GeGamMent.png");
  }

  // Arrow 이미지 클릭 여부 확인
  boolean isArrowClicked(float mouseX, float mouseY, float scrollY) {
    println("클릭하였습니다.");
    println("mouseX : " + mouseX + ", x : "+x);
    println("mouseY : " + mouseY + " , y:"+y);
    float gamjaX = x;  // 감자 이미지의 x 좌표
    float gamjaY = y + scrollY;  // 감자 이미지의 y 좌표
    float gamjaWidth = width;  // 감자 이미지의 너비
    float gamjaHeight = height;  // 감자 이미지의 높이
    if (mouseX > gamjaX && mouseX < gamjaX + gamjaWidth &&
        mouseY > gamjaY && mouseY < gamjaY + gamjaHeight) {
      println("True");
      return true;
    }
    println("False");
    return false;
  }

  // 화면 전환 로직
  void nextScreen() {
    screenChanged = true;  // 화면을 변경했음을 표시
  }

  @Override
  void display() {
    fill(255, 204, 0);  // GamjaWidget만의 고유한 색상
    // rect(x, y, width, height, radius);

    image(gamjaImage, x, y,width,height);
    image(arrawImage,x+350, y+100, 22,22);

    if (screenChanged) {
        // 다른 화면을 보여주는 코드 추가
        // 예: 새 화면을 그리거나 화면을 전환하는 로직
      fill(255,255,255);
      rect(x, y, width, height, radius);
      
      image(gamjaImage2,x,y);
    // 예시로 "Next Screen" 표시
      }
    }
}

