class AssistWidget extends Widget{
  PImage aiImage;
  ArrayList<ChecklistItem> checklist = new ArrayList<ChecklistItem>();
  
  AssistWidget(float x, float y, float width, float height, float radius, color bgColor) {
    super(x, y, width, height, radius, bgColor);
    
    aiImage = loadImage("AI.png");  
    
    //체크리스트 항목 추가
    float checklistStartY = y + 60; // 체크리스트가 시작하는 Y 위치
    checklist.add(new ChecklistItem("Item 1", x + 20, checklistStartY));
    checklist.add(new ChecklistItem("Item 2", x + 20, checklistStartY + 40));
    checklist.add(new ChecklistItem("Item 3", x + 20, checklistStartY + 80));
    checklist.add(new ChecklistItem("Item 4", x + 20, checklistStartY + 120));
  }
  
  
  @Override
  void display() {
    rect(x, y, width, height,radius);
    
    image(aiImage, x + 18, y + 16, 25, 25);
    for (ChecklistItem item : checklist) {
      item.display();
    }
  }  
  
  void handleMousePressed(float mx, float my) {
    // 클릭 이벤트를 체크리스트에 전달
    for (ChecklistItem item : checklist) {
      if (item.isClicked(mx, my)) {
        item.toggle(); // 선택 상태 변경
      }
    }
  }
} 

// ChecklistItem 클래스
class ChecklistItem {
  String text;
  float x, y;
  boolean isChecked = false; // 체크 여부
  
  ChecklistItem(String text, float x, float y) {
    this.text = text;
    this.x = x;
    this.y = y;
  }
  
  void display() {
    // 체크박스 그리기
    stroke(0);
    ellipse(x, y, 20, 20); // 체크박스 테두리
    
    if (isChecked) {
      // 체크된 상태면 내부에 체크 표시
      line(x + 4, y + 10, x + 10, y + 16);
      line(x + 10, y + 16, x + 16, y + 4);
    }
    
    // 텍스트 표시
    fill(0);
    noStroke();
    textAlign(LEFT, CENTER);
    text(text, x + 30, y + 10);
  }
  
  void toggle() {
    isChecked = !isChecked; // 선택 상태 변경
  }
  
  boolean isClicked(float mx, float my) {
    // 클릭 영역 확인 (체크박스 내부만)
    return mx > x && mx < x + 20 && my > y && my < y + 20;
  }
}