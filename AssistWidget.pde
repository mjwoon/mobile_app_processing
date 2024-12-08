class AssistWidget extends Widget{
  int selectedIndex = -1; // 선택된 옵션의 인덱스 (-1은 선택 없음)

  AssistWidget(float x, float y, float width, float height, float radius, color bgColor) {
    super(x, y, width, height, radius, bgColor);
    
  }
  

  @Override
  void display() {
    fill(#ffffff);  // GamjaWidget만의 고유한 색상
    rect(x, y, width, height,radius);

  }  
} 