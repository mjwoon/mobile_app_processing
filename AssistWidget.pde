int flag = 0;
int flag2 = 0;
int flag3 = 0;
int flag4 = 0;

class AssistWidget extends Widget {
  PImage aiImage;
  PImage notChecked, checked, lineImage;  // lineImage 추가
  String name = "AI 어시";
  ArrayList<ChecklistItem> checklist = new ArrayList<ChecklistItem>();
  String CheckListUrl = "https://keep.google.com/u/0/";
  
  PFont koreanFont;
  
  AssistWidget(float x, float y, float width, float height, float radius, color bgColor) {
    super(x, y, width, height, radius, bgColor);
    
    aiImage = loadImage("AI.png");  
    notChecked = loadImage("notChecked.png");
    checked = loadImage("checked.png");   
    lineImage = loadImage("Line.png");  // line.png 이미지 로드
    
    koreanFont = createFont("malgunbd.ttf", 16);
    
    // 체크리스트 항목 추가
    float checklistStartY = y + 60;
    checklist.add(new ChecklistItem(1, "ch4: 122페이지...", x + 10, checklistStartY));
    checklist.add(new ChecklistItem(2, "ch3: ch1과 설정...", x + 10, checklistStartY + 40));
    checklist.add(new ChecklistItem(3, "ch6: 마무리", x + 10, checklistStartY + 80));
    checklist.add(new ChecklistItem(4, "ch1: 재검토", x + 10, checklistStartY + 120));
  }
  
  @Override
  void display() {
    stroke(#EBE5DB);
    fill(#F1EDEA);
    rect(x, y, width, height, radius);
    
    textFont(koreanFont);
    fill(#212527);
    
    image(aiImage, x + 18, y + 16, 25, 25);
    text(name, x + 60, y + 34);
    
    for (int i = 0; i < checklist.size(); i++) {
      ChecklistItem item = checklist.get(i);
      
      // 체크리스트 항목을 표시
      item.display();
      
      // 구분선 추가 (항목 사이에 line.png 추가)
      if (i < checklist.size() - 1) {  // 마지막 항목 뒤에는 구분선 안 보이게
        float lineY = item.y + 30;  // 각 항목의 아래 위치에 라인 표시
        image(lineImage, x + 38, lineY, (width - 20) * 2 / 3, 1.5);  // 라인 이미지 길이 줄이기
      }
      
      // 체크박스 이미지 표시
      if (item.index == 1) {
        if (flag % 2 == 1) {
<<<<<<< HEAD
          image(checked, x + 16, y + 62, 15, 15);
        } else {
          image(notChecked, x + 16, y + 62, 15, 15);
        }
      } else if (item.index == 2) {
        if (flag2 % 2 == 1) {
          image(checked, x + 16, y + 102, 15, 15);
        } else {
          image(notChecked, x + 16, y + 102, 15, 15);
        }
      } else if (item.index == 3) {
        if (flag3  % 2 == 1) {
          image(checked, x + 16, y + 142, 15, 15);
        } else {
          image(notChecked, x + 16, y + 142, 15, 15);
        }
      } else if (item.index == 4) {
        if (flag4 % 2 == 1) {
          image(checked, x + 16, y + 182, 15, 15);
        } else {
          image(notChecked, x + 16, y + 182, 15, 15);
=======
          image(checked, x + 16, y + 62, 16, 16);
        } else {
          image(notChecked, x + 16, y + 62, 16, 16);
        }
      } else if (item.index == 2) {
        if (flag2 % 2 == 1) {
          image(checked, x + 16, y + 102, 16, 16);
        } else {
          image(notChecked, x + 16, y + 102, 16, 16);
        }
      } else if (item.index == 3) {
        if (flag3  % 2 == 1) {
          image(checked, x + 16, y + 142, 16, 16);
        } else {
          image(notChecked, x + 16, y + 142, 16, 16);
        }
      } else if (item.index == 4) {
        if (flag4 % 2 == 1) {
          image(checked, x + 16, y + 182, 16, 16);
        } else {
          image(notChecked, x + 16, y + 182, 16, 16);
>>>>>>> 31606ca22b32ecbdadf8151734eb91c69f7d3c99
        }
      }
    }
  } 
  
  boolean toApp(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 12;
    float plusY = y + 20 + scrollY;
    float plusWidth = 140;
    float plusHeigh = 20;
    
    if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("AI 어시 이동");
      return true;
    }
    return false;   
  }
  
  boolean isChecked(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 12;
    float plusY = y + 50 + scrollY;
    float plusWidth = 20;
    float plusHeigh = 20;
    
    if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh && flag % 2 == 0) {
      println("체크리스트1 on");
      flag += 1;
      return true;
    } else if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh && flag % 2 == 1) {
      println("체크리스트1 off");
      flag += 1;
      return true;
    }
    return false;
  }
  boolean isChecked2(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 12;
    float plusY = y + 94 + scrollY;
    float plusWidth = 20;
    float plusHeigh = 20;
    
    if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("체크리스트2 클릭");
      flag2 += 1;
      return true;
    } else if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh && flag2 % 2 == 1) {
      println("체크리스트2 off");
      flag2 += 1;
      return true;
    }
    return false;
  }
  
  boolean isChecked3(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 12;
    float plusY = y + 134 + scrollY;
    float plusWidth = 20;
    float plusHeigh = 20;
    
    if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("체크리스트3 클릭");
      flag3 += 1;
      return true;
    } else if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh && flag3 % 2 == 1) {
      println("체크리스트3 off");
      flag3 += 1;
      return true;
    }
    return false;
  }
  
  boolean isChecked4(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 12;
    float plusY = y + 174 + scrollY;
    float plusWidth = 20;
    float plusHeigh = 20;
    
    if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("체크리스트4 클릭");
      flag4 += 1;
      return true;
    } else if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh && flag4 % 2 == 1) {
      println("체크리스트2 off");
      flag4 += 1;
      return true;
    }
    return false;
  }
  
  void moveLink() {
    link(CheckListUrl);
  }
  
} 

// ChecklistItem 클래스
class ChecklistItem {
  String text;
  float x, y;
  int index;
  
  ChecklistItem(int index, String text, float x, float y) {
    this.index = index;
    this.text = text;
    this.x = x;
    this.y = y;
  }
  
  void display() {
<<<<<<< HEAD
    textSize(13);
    fill(#424242);
=======
    textSize(14);
    fill(#212527);
>>>>>>> 31606ca22b32ecbdadf8151734eb91c69f7d3c99
    text(text, x + 30, y + 15);
  }
}
