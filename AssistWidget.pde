class AssistWidget extends Widget{
  PImage aiImage;
  int selectedIndex = -1; // 선택된 옵션의 인덱스 (-1은 선택 없음)

  AssistWidget(float x, float y, float width, float height, float radius, color bgColor) {
    super(x, y, width, height, radius, bgColor);
    
    aiImage = loadImage("AI.png");  
  }
  

  @Override
  void display() {
    fill(#F1EDEA);  // GamjaWidget만의 고유한 색상
    rect(x, y, width, height,radius);

    image(aiImage, x + 18, y+ 16, 25, 25);
  }  
} 