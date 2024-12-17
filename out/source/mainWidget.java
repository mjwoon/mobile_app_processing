/* autogenerated by Processing revision 1293 on 2024-12-17 */
import processing.core.*;
import processing.data.*;
import processing.event.*;
import processing.opengl.*;

import controlP5.*;

import java.util.HashMap;
import java.util.ArrayList;
import java.io.File;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.IOException;

public class mainWidget extends PApplet {


ArrayList<Widget> widgets = new ArrayList<Widget>();

int scrollY = 0; // 스크롤을 위한 변수
// boolean isDragging = false; // 드래그 중인지 여부 확인
float pos, npos;  // pos는 부드러운 스크롤을 위한 위치, npos는 목표 스크롤 위치

GamjaWidget gamjaWidget;
MusicWidget musicWidget;
BookWidget bookWidget; 
BatteryWidget batteryWidget;
ContestWidget contestWidget;
WeatherWidget weatherWidget;
NoteWidget noteWidget;
StatusWidget statusWidget;
AssistWidget assistWidget;
CalenderWidget calenderWidget;


public void setup() {
  /* size commented out by preprocessor */;
  background(255);
  
  statusWidget = new StatusWidget(22, 0, 372, 44, 25, color(255, 255, 255));
  bookWidget = new BookWidget(16, 40 + scrollY, 385, 227, 0, color(255,220,220)); 
  batteryWidget = new BatteryWidget(22, 286 + scrollY, 368, 90, 20, color(255));
  weatherWidget = new WeatherWidget(22, 398 + scrollY, 368, 138, 20, color(200, 200, 255));
  contestWidget = new ContestWidget(215, 558, 173, 258, 20, color(104,104,104));
  gamjaWidget = new GamjaWidget(22, 838 + scrollY, 368, 224, 20, color(249, 242, 232));
  musicWidget = new MusicWidget(212, 1084 + scrollY, 188, 116, 20, color(220,220,220)); 
  noteWidget = new NoteWidget(214, 1210 + scrollY, 174, 174, 20, color(200, 200, 255));
  assistWidget = new AssistWidget(22, 1084 + scrollY, 173, 305, 20, color(0xFFFFFFFF));
  calenderWidget = new CalenderWidget(18, 544, 190, 296, 20, color(104,104,104));
 
  widgets.add(bookWidget);
  widgets.add(batteryWidget);
  widgets.add(weatherWidget);
  widgets.add(contestWidget);
  widgets.add(gamjaWidget);
  widgets.add(musicWidget);
  widgets.add(noteWidget); 
  widgets.add(assistWidget);
  widgets.add(calenderWidget);
}

public void draw() {
  background(249,242,232);
  pushMatrix();
  translate(0, PApplet.parseInt(pos));
  
  drawScrollableContent();
  popMatrix();
  drawStatusBar();
}

// 상태바를 고정 그리기
public void drawStatusBar() {
  statusWidget.display();
}

// 스크롤 가능한 내용 그리기
public void drawScrollableContent() {
  // 각 위젯의 display() 호출
  for (Widget widget : widgets) {
    widget.display();
  }
}  

// 마우스 클릭 
public void mousePressed() {
  
  for (Widget widget : widgets) {
    if (widget instanceof GamjaWidget) {
      GamjaWidget gamjaWidget = (GamjaWidget) widget;
      if (gamjaWidget.isGamjaClicked(mouseX,mouseY,scrollY)) {
        println("새로운 감자 표정과 글귀");
        gamjaWidget.changeImage();
      } else if (gamjaWidget.isLeftArrowClicked(mouseX,mouseY,scrollY)) {
        println("감자 화면");
        gamjaWidget.beforeScreen();
      } else if (gamjaWidget.isRightArrowClicked(mouseX,mouseY,scrollY)) {
        println("멘트화면");
        gamjaWidget.nextScreen();
      }
    } else if (widget instanceof ContestWidget) {
      ContestWidget contestWidget = (ContestWidget) widget;
      if (contestWidget.isRightArrowClicked(mouseX,mouseY,scrollY)) {
        println("다음 공모전");
        contestWidget.nextScreen();
      } else if (contestWidget.isLeftArrowClicked(mouseX,mouseY,scrollY)) {
        print("이전 공모전");
        contestWidget.beforeScreen();
      } else if (contestWidget.isPlusClicked(mouseX,mouseY,scrollY) && 
        contestWidget.plusIndex == 1) {
        println("공모전 사이트로 이동");
        contestWidget.moveLink();
      }
    } else if (widget instanceof CalenderWidget) {
      CalenderWidget calenderWidget = (CalenderWidget) widget;
      if (calenderWidget.isPluseClicked(mouseX, mouseY, scrollY)) {
        println("구글 캘린더로 이동");
        calenderWidget.moveLink();
      }
    } else if (widget instanceof MusicWidget) {
      MusicWidget musicWidget = (MusicWidget) widget;
      if (musicWidget.isPluseClicked(mouseX, mouseY, scrollY)) {
        println("음악 사이트로 이동");
        musicWidget.moveLink();
      }
    } else if (widget instanceof WeatherWidget) {
      WeatherWidget weatherWidget = (WeatherWidget) widget;
      if (weatherWidget.isPluseClicked(mouseX, mouseY, scrollY)) {
        println("날씨 사이트로 이동");
        weatherWidget.moveLink();
      }
    } else if (widget instanceof BookWidget) {
      BookWidget bookWidget = (BookWidget) widget;
      if (bookWidget.isPluseClicked(mouseX, mouseY, scrollY)) {
        bookWidget.moveLink();        
      } else if (bookWidget.isPluseClicked2(mouseX, mouseY, scrollY)) {
        bookWidget.moveLink2();
      } else if (bookWidget.isPluseClicked3(mouseX, mouseY, scrollY)) {
        bookWidget.moveLink3();
      } else if (bookWidget.isPluseClicked4(mouseX, mouseY, scrollY)) {
        bookWidget.moveLink4();
      } 
    } else if (widget instanceof NoteWidget) {
      NoteWidget noteWidget = (NoteWidget) widget;
      if (noteWidget.isPluseClicked(mouseX, mouseY, scrollY)) {
        println("메모로 이동");
        noteWidget.moveLink();
      }
    } else if (widget instanceof AssistWidget) {
      AssistWidget assistWidget = (AssistWidget) widget;
      if (assistWidget.isChecked(mouseX, mouseY, scrollY)) {
        println("체크리스트1 클릭");
      } else if (assistWidget.isChecked2(mouseX, mouseY, scrollY)) {
        println("체크리스트2 클릭");
      } else if (assistWidget.isChecked3(mouseX, mouseY, scrollY)) {
        println("체크리스트3 클릭");
      } else if (assistWidget.isChecked4(mouseX, mouseY, scrollY)) {
        println("체크리스트4 클릭");
      } else if (assistWidget.toApp(mouseX, mouseY, scrollY)) {
        println("AI 어시 클릭");
        assistWidget.moveLink();
      }
    }
  } 
}

public void mouseWheel(MouseEvent event) {
  
  float e = event.getCount();
  npos -= e * 40;  // 40은 스크롤 속도 (조정 가능)
  
  // 스크롤 제한: 화면을 넘어가지 않도록
  npos = constrain(npos, -548, 0);  
  
  // 부드러운 스크롤 효과를 위한 보간 처리
  pos += (npos - pos) * 0.1f;
  
  scrollY = PApplet.parseInt(pos);
}
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
  
  AssistWidget(float x, float y, float width, float height, float radius, int bgColor) {
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
  
  
  @Override public 
  void display() {
    stroke(0xFFE0D9D0);
    fill(0xFFE5E5E5);
    rect(x, y, width, height,radius);
    
    textFont(koreanFont);
    fill(0xFF000000);
    
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
      } else if (item.index == 4) {
        if (flag4) {
          image(checked, x + 20, y + 182, 14, 14);
        } else {
          image(notChecked, x + 20, y + 182, 14, 14);
        }
      }
      item.display();
    }
    
  } 
  
  public boolean toApp(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 12;
    float plusY = y + 20 + scrollY;
    float plusWidth = 140;
    float plusHeigh = 20;
    
    if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("AI 어시 클릭");
      return true;
    }
    return false;   
  }
  
  public boolean isChecked(float mouseX, float mouseY, float scrollY) {
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
  public boolean isChecked2(float mouseX, float mouseY, float scrollY) {
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
  
  public boolean isChecked3(float mouseX, float mouseY, float scrollY) {
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
  
  public boolean isChecked4(float mouseX, float mouseY, float scrollY) {
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
  
  public void moveLink() {
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
  
  public void display() {
    fill(0xFF000000);
    text(text, x + 30, y + 15);
  }
}
class BatteryWidget extends Widget{
    PImage batteryImage; // 감자 이미지를 저장할 변수

    BatteryWidget(float x, float y, float width, float height,float radius, int bgColor) {
        super(x, y, width, height, radius, bgColor);

        batteryImage = loadImage("battery.png");

    }


    @Override public 
    void display() {
        fill(249,242,232);  // GamjaWidget만의 고유한 색상
        rect(x, y, width, height, radius);

        image(batteryImage, x, y, width, height);

    }
}
class BookWidget extends Widget{
  PImage bookImage; 
  float scrollY;
  String TodayURL =  "https://www.millie.co.kr/";
  String FeedURL = "https://www.millie.co.kr/v3/feed";
  String SearchURL = "https://www.millie.co.kr/v3/search";
  String MyPageURL = "https://www.millie.co.kr/v3/myshelf";
  
  BookWidget(float x, float y, float width, float height, float radius,int bgColor) {
    super(x, y, width, height, radius, bgColor);
    
    bookImage = loadImage("book.png");
    
  }
  
  
  @Override public 
  void display() {
    fill(249,242,232);  // GamjaWidget만의 고유한 색상
    rect(x, y, width, height,radius);
    
    image(bookImage, x, y, width, height);
    
  }
  
  public boolean isPluseClicked(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 16;
    float plusY = y + 180 + scrollY;    
    float plusWidth = 80;
    float plusHeigh = 40;
    float plusX2 = plusX + 95; 
    
    if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("밀리의서재 투데이 클릭");
      return true;
    }
    return false;
    
  }
  
  public boolean isPluseClicked2(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 16;
    float plusY = y + 180 + scrollY;    
    float plusWidth = 80;
    float plusHeigh = 40;
    float plusX2 = plusX + 95; 
    
    if (mouseX > plusX2 && mouseX < plusX2 + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("밀리의서재 피드 클릭");
      return true;
    }
    return false;
    
  }
  
  public boolean isPluseClicked3(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 16;
    float plusY = y + 180 + scrollY;    
    float plusWidth = 80;
    float plusHeigh = 40;
    float plusX2 = plusX + 95; 
    float plusX3 = plusX2 + 95;
    
    if (mouseX > plusX3 && mouseX < plusX3 + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("밀리의서재 검색 클릭");
      return true;
    }
    return false;
    
  }
  
  public boolean isPluseClicked4(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 16;
    float plusY = y + 180 + scrollY;    
    float plusWidth = 80;
    float plusHeigh = 40;
    float plusX2 = plusX + 95; 
    float plusX3 = plusX2 + 95;
    float plusX4 = plusX3 + 95;
    
    if (mouseX > plusX4 && mouseX < plusX4 + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("밀리의서재 마이페이지 클릭");
      return true;
    }
    return false;
    
  }
  
  public void moveLink() {
    link(TodayURL);
  }
  public void moveLink2() {
    link(FeedURL);
  }
  
  public void moveLink3() {
    link(SearchURL);
  }
  
  public void moveLink4() {
    link(MyPageURL);
  }
}

class CalenderWidget extends Widget{
    PImage calenderImage, calenderPlusImage;
    float scrollY;
    String CalenderURL = "https://calendar.google.com/calendar/u/0/r?pli=1";

    CalenderWidget(float x, float y, float width, float height,
     float radius, int bgColor){
        super(x, y, width, height, radius, bgColor);

        calenderImage = loadImage("calender.png");
        calenderPlusImage = loadImage("calenderPlus.png");
    }

    @Override public 
    void display(){
        fill(255);

        image(calenderImage, x, y, width, height);
        image(calenderPlusImage, x+114, y+26, 53,56);
    }

    public boolean isPluseClicked(float mouseX, float mouseY, float scrollY){
        float plusX = x + 114;
        float plusY = y + 26 + scrollY;
        float plusWidth = 53;
        float plusHeigh = 56;

        if(mouseX > plusX && mouseX < plusX + plusWidth &&
        mouseY > plusY && mouseY < plusY + plusHeigh){
            println("플러스 버튼 클릭");
            return true;
        }
        return false;
    }

    public void moveLink(){
        link(CalenderURL);
    }
}

class ContestWidget extends Widget{

    PImage[] contestImg = new PImage[2];
    PImage plusImage,rightArrow,leftArrow;
    PImage selectPoint, normalPoint;

    String[] contestTitle = new String[2];
    String[] contestDate = new String[2];
    boolean screenChanged = false;  
    float scrollY;
    int currentIndex = 0; 
    int plusIndex = 0; // 1일 때는 plus 이미지 나옴
    String ContestUrl = "https://linkareer.com/list/contest?filterBy_categoryIDs=38&filterType=CATEGORY&orderBy_direction=DESC&orderBy_field=CREATED_AT&page=1";
    String Contest1Url = "https://www.wevity.com/index_university.php?c=find&s=_university&sp=name&sw=%EC%9E%91%EA%B0%80+%EA%B3%B5%EB%AA%A8%EC%A0%84&gbn=viewok&gp=1&ix=90811";
    PFont koreanFont;

    ContestWidget(float x, float y, float width, float height,
    float radius, int bgColor){
        super(x,y, width, height, radius, bgColor);

        contestImg[0] = loadImage("contestImage1.jpg");
        contestImg[1] = loadImage("contest2.png");
        
        contestTitle[0] = "2024 신예 작가 공모전";
        contestTitle[1] = "계간 포지션 공모전";

        contestDate[0] = "24.08.15 ~ 24.12.25";
        contestDate[1] = "24.12.06 ~ 25.01.15";

        plusImage = loadImage("Plus.png");

        rightArrow = loadImage("CrightArrow.png");
        leftArrow = loadImage("CleftArrow.png");

        selectPoint = loadImage("CSelectPoint.png");
        normalPoint = loadImage("CnormalPoint.png");

        koreanFont = createFont("MaruBuri-Bold.ttf",32);

    }

    @Override public 
    void display(){
        fill(154,159,166);
        rect(215,558,173,258,25);

        textFont(koreanFont);
        fill(255);

        if (currentIndex == 0) {
            textSize(15);
            text(contestTitle[currentIndex], x + 15, y + 30);  // 0번 인덱스일 때
            image(normalPoint, x+71, y+240);  // 하단 포인트 추가
            image(selectPoint, x+80, y+240);
            image(selectPoint, x+89, y+240);

        } else if (currentIndex == 1) {
            textSize(15);
            text(contestTitle[currentIndex], x + 25, y + 30);  // 1번 인덱스일 때 (위치 변경 가능)
            image(selectPoint, x+71, y+240);  // 하단 포인트 추가
            image(normalPoint, x+80, y+240);
            image(selectPoint, x+89, y+240);
        }

        image(contestImg[currentIndex], x + 33, y + 55, 110, 156);

        // 화살표 처리
        if (currentIndex == 0) {
            // 0번 인덱스에서는 오른쪽 화살표만
            image(rightArrow, x + 155, y + 120, 10, 15);
        } else if (currentIndex == 1) {
            // 1번 인덱스에서는 좌우 화살표 모두
            image(leftArrow, x + 10, y + 120, 10, 15);
            image(rightArrow, x + 155, y + 120, 10, 15);
        }

        textSize(16);
        fill(255);
        text(contestDate[currentIndex], x + 19, y + 225);

        // 화면 변경 여부 확인 후 Plus 이미지 표시
        if (plusIndex == 1) {
            fill(154,159,166);
            rect(215,558,173,258,25);

            image(plusImage, x + 45, y + 80, 82, 82);
            image(leftArrow, x + 10, y + 120, 10, 15);

            image(selectPoint, x+71, y+240);  // 하단 포인트 추가
            image(selectPoint, x+80, y+240);
            image(normalPoint, x+89, y+240);

            fill(255);
            textSize(18);
            text("추가", x + 70, y + 210);
        }
        
    }

    public void nextScreen(){
        if (currentIndex < contestImg.length - 1) {
            currentIndex += 1;  // 다음 공모전으로
        } else {
            // 마지막 공모전일 경우 Plus 이미지 표시
            plusIndex = 1;
        }
    }

    public void beforeScreen(){
        if (plusIndex == 1){
            currentIndex = contestImg.length - 1;
            plusIndex = 0;
        } else if ( currentIndex > 0){
            currentIndex -= 1;
        }
    }
    public void moveLink(){
        link(ContestUrl);
    }


    public boolean isRightArrowClicked(float mouseX, float mouseY, float scrollY){
        float rArrowX = x + 150;
        float rArrowY = y + 120 + scrollY;
        float rArrowWidth = 20;
        float rArrowHeight  = 25;

        if(mouseX > rArrowX && mouseX < rArrowX + rArrowWidth &&
        mouseY > rArrowY && mouseY < rArrowY + rArrowHeight){
            println("오른쪽 화살표 클릭");
            return true;
        }
        return false;
    }

    public boolean isLeftArrowClicked(float mouseX, float mouseY, float scrollY){
        float lArrowX = x + 10;
        float lArrowY = y + 120 + scrollY;
        float lArrowWidth = 20;
        float lArrowHeight = 25;
       if(mouseX > lArrowX && mouseX < lArrowX + lArrowWidth &&
        mouseY > lArrowY && mouseY < lArrowY + lArrowHeight){
            println("왼쪽 화살표 클릭");
            return true;
        }
        return false;
    }

    public boolean isPlusClicked(float mouseX,float mouseY, float scrollY){
        float plusX = x + 45;
        float plusY = y + 80 + scrollY;
        float plusWidth = 82;
        float plusHeigh = 82;

        if(mouseX > plusX && mouseX < plusX + plusWidth &&
        mouseY > plusY && mouseY < plusY + plusHeigh){
            println("플러스 버튼 클릭");
            return true;
        }
        return false;
    }
}


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

  // 감자 클릭 후 멘트를 표시하기 위한 추가 변수
  boolean showMent = false;  // 멘트 표시 여부
  int mentStartTime = 0;     // 멘트 표시 시작 시간


  GamjaWidget(float x, float y, float width, float height
  ,float radius, int bgColor) {
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

  @Override public 
  void display() {
    stroke(0xFFE0D9D0);
    fill(0xFFF4E4CE);  // GamjaWidget만의 고유한 색상
    rect(x, y, width, height, radius);

    image(gmajaLabelImage, x+324, y+ 191, 20,12);

    if(!screenChanged){
      image(gamjaImages[currentIndex],x + 101,y + 42,166,154); // 감자 사진
      // image(gamjaMents[currentIndex],x + 210, y+ 38,139,14);  // 감자의 멘트
      
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

  public boolean isRightArrowClicked(float mouseX, float mouseY, float scrollY){
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

  public boolean isLeftArrowClicked(float mouseX, float mouseY, float scrollY){
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

  public boolean isGamjaClicked(float mouseX, float mouseY, float scrollY){
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

  public void changeImage(){
    if (currentIndex < gamjaImages.length - 1) {
      currentIndex += 1;  // 다음 화면으로
    } else{
      currentIndex = 0;
    }
  }

  public void nextScreen(){
    screenChanged = true;
  }
  public void beforeScreen(){
    screenChanged = false;
  }
}




class MusicWidget extends Widget{
  PImage MusicImage; // 노래 이미지를 저장할 변수
  float scrollY;
  String MusicURL = "https://music.youtube.com/"; // 노래 링크
  
  MusicWidget(float x, float y, float width, float height, float radius,int bgColor) {
    super(x, y, width, height, radius, bgColor);
    MusicImage = loadImage("music.png");
  }
  
  
  @Override public 
  void display() { 
    noStroke();
    fill(249,242,232);  // MusicWidget만의 고유한 색상
    rect(x, y, width, height,radius);
    
    
    image(MusicImage, x, y, width - 10, height - 10);
  }
  
  
  public boolean isPluseClicked(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 12;
    float plusY = y + 12 + scrollY;
    float plusWidth = 80;
    float plusHeigh = 80;
    
    if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("음악버튼 클릭");
      return true;
    }
    return false;
    
  }
  
  public void moveLink() {
    link(MusicURL);
  }
  
}
class NoteWidget extends Widget {
  PImage noteImage; 
  float scrollY;
  String NoteUrl = "https://www.icloud.com/notes/"; // 노래 링크 
  
  NoteWidget(float x, float y, float width, float height, float radius, int bgColor) {
    super(x, y, width, height, radius, bgColor);
    
    noteImage = loadImage("note.png");
  }
  
  @Override public 
  void display() {
    noStroke(); 
    fill(249,242,232);  
    rect(x, y, width, height);
    image(noteImage, x, y, width, height);
  }
  
  public boolean isPluseClicked(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 12;
    float plusY = y + 12 + scrollY;
    float plusWidth = 160;
    float plusHeigh = 160;
    
    if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("메모 클릭");
      return true;
    }
    return false;
    
  }

  public void moveLink() {
    link(NoteUrl);
  }
}
class StatusWidget extends Widget {
  PImage statusImage; 
  
  StatusWidget(float x, float y, float width, float height, float radius, int bgColor) {
    super(x, y, width, height, radius, bgColor);
    
    statusImage = loadImage("statusbar.png");
  }
  
  @Override public 
  void display() {
    noStroke();
    fill(249,242,232);
    rect(x, y, width, height);
    
    image(statusImage, x, y, width, height);
  }
  
}
class WeatherWidget extends Widget {
  PImage weatherImage;
  float scrollY;
  String WeatherURL = "https://www.weather.go.kr/w/index.do"; 
  
  WeatherWidget(float x, float y, float width, float height, float radius, int bgColor) {
    super(x, y, width, height, radius, bgColor);
    
    weatherImage = loadImage("weather.png");
  }
  
  @Override public 
  void display() {
    fill(249,242,232);  // GamjaWidget만의 고유한 색상
    rect(x, y, width, height);
    noStroke(); 
    image(weatherImage, x, y, width, height);
    
  }
  
  public boolean isPluseClicked(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 16;
    float plusY = y + 16 + scrollY;    
    float plusWidth = 360;
    float plusHeigh = 130;
    
    if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("날씨 클릭");
      return true;
    }
    return false;
    
  }
  
  public void moveLink() {
    link(WeatherURL);
  }
} 
class Widget {
  float x, y, width, height,radius;
  int bgColor;


  Widget(float x, float y, float width, float height,float radius, int bgColor) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.bgColor = bgColor; 
    this.radius = radius;
  }


  public void display() {
    fill(bgColor);
    rect(x, y, width, height,radius);
    fill(0);
  }
}


  public void settings() { size(412, 888); }

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "mainWidget" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
