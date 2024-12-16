boolean flag =  false;
boolean flag2 =  false;
boolean flag3 =  false;
boolean flag4 =  false;

class AssistWidget extends Widget{
  PImage aiImage;
  PImage notChecked, checked; 
  String name = "AI 어시";
  ArrayList<ChecklistItem> checklist = new ArrayList<ChecklistItem>();
  String CheckListUrl = "https://keep.google.com/u/0/";
  
  PFont koreanFont;
  
  AssistWidget(float x, float y, float width, float height, float radius, color bgColor) {
    super(x, y, width, height, radius, bgColor);
    
    aiImage = loadImage("AI.png");  
    notChecked = loadImage("notChecked.png");
    checked = loadImage("checked.png");   
    
    koreanFont = createFont("MaruBuri-Bold.ttf",16);
    //체크리스트 항목 추가
    float checklistStartY = y + 60;
    checklist.add(new ChecklistItem(1, "Item 1", x + 20, checklistStartY));
    checklist.add(new ChecklistItem(2, "Item 2", x + 20, checklistStartY + 40));
    checklist.add(new ChecklistItem(3, "Item 3", x + 20, checklistStartY + 80));
    checklist.add(new ChecklistItem(4, "Item 4", x + 20, checklistStartY + 120));
  }
  
  
  @Override
  void display() {
    fill(#E5E5E5);
    rect(x, y, width, height,radius);
    
    textFont(koreanFont);
    fill(#000000);
    
    image(aiImage, x + 18, y + 16, 25, 25);
    
    text(name, x + 60, y + 34);
    
    for (ChecklistItem item : checklist) {
      if (item.index == 1) {
        if (flag) {
          image(checked, x + 20, y + 62, 14, 14);
        } else {
          image(notChecked, x + 20, y + 62, 14, 14);
        }
      } else if (item.index == 2) {
        if (flag2) {
          image(checked, x + 20, y + 102, 14, 14);
        } else {
          image(notChecked, x + 20, y + 102, 14, 14);
        }
      } else if (item.index == 3) {
        if (flag3) {
          image(checked, x + 20, y + 142, 14, 14);
        } else {
          image(notChecked, x + 20, y + 142, 14, 14);
        }
      }else if (item.index == 4) {
        if (flag4) {
          image(checked, x + 20, y + 182, 14, 14);
        } else {
          image(notChecked, x + 20, y + 182, 14, 14);
        }
      }
      
      item.display();
    }
    
  } 
  
  boolean isChecked(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 12;
    float plusY = y + 50 + scrollY;
    float plusWidth = 20;
    float plusHeigh = 20;
    
    if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("체크리스트1 클릭");
      flag = true;
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
      flag2 = true;
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
      flag3 = true;
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
      flag4 = true;
      return true;
    }
    flag4 = false;
    return false;
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
    fill(#000000);
    text(text, x + 30, y + 15);
  }
}