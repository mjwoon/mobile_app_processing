
ArrayList<Widget> widgets = new ArrayList<Widget>();

int scrollY = 0; // 스크롤을 위한 변수
// boolean isDragging = false; // 드래그 중인지 여부 확인
float pos, npos;  // pos는 부드러운 스크롤을 위한 위치, npos는 목표 스크롤 위치
PImage statusImage;

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


void setup() {
  size(412, 888);
  background(255);
  
  statusWidget = new StatusWidget(22, 0, 372, 44, 20, color(255, 255, 255));
  bookWidget = new BookWidget(16, 40 + scrollY, 385, 227, 0, color(255,220,220)); 
  batteryWidget = new BatteryWidget(22, 286 + scrollY, 368, 90, 20, color(255));
  weatherWidget = new WeatherWidget(22, 398 + scrollY, 368, 138, 20, color(200, 200, 255));
  contestWidget = new ContestWidget(215, 558, 173, 258, 20, color(104,104,104));
  gamjaWidget = new GamjaWidget(22, 838+ scrollY, 368, 224, 20, color(200, 200, 255));
  musicWidget = new MusicWidget(214, 1084 + scrollY, 176, 104, 20, color(220,220,220)); 
  noteWidget = new NoteWidget(214, 1210 + scrollY, 174, 174, 20, color(200, 200, 255));
  assistWidget = new AssistWidget(22, 1084 + scrollY, 173, 305, 20, color(#ffffff));
  calenderWidget = new CalenderWidget(22, 548, 190, 296, 20, color(104,104,104));

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

void draw() {
  background(249,242,232);
  pushMatrix();
  translate(0, int(pos));
  
  drawScrollableContent();
  popMatrix();
  drawStatusBar();
}

// 상태바를 고정 그리기
void drawStatusBar() {
  statusWidget.display();
}

// 스크롤 가능한 내용 그리기
void drawScrollableContent() {
  // 각 위젯의 display() 호출
  for (Widget widget : widgets) {
    widget.display();
  }
}

// 마우스 클릭 
void mousePressed() {
  for (Widget widget : widgets) {
    if (widget instanceof GamjaWidget) {
      GamjaWidget gamjaWidget = (GamjaWidget) widget;
      if (gamjaWidget.isArrowClicked(mouseX, mouseY,scrollY)) {
        println("다음 화면 전환");
        gamjaWidget.nextScreen();  // 클릭 시 화면 전환
      }
    } else if (widget instanceof ContestWidget) {
      ContestWidget contestWidget = (ContestWidget) widget;
      if (contestWidget.isRightArrowClicked(mouseX,mouseY,scrollY)) {
        println("다음 공모전");
        contestWidget.nextScreen();
      } else if (contestWidget.isLeftArrowClicked(mouseX,mouseY,scrollY)) {
        print("이전 공모전");
        contestWidget.beforeScreen();
      } else if (contestWidget.isPluseClicked(mouseX,mouseY,scrollY) && 
      contestWidget.plusIndex == 1){
        contestWidget.moveLink();
      }
    }
  } 
}

// 휠스크롤 이벤트 처리
void mouseWheel(MouseEvent event) {
  println("마우스 휠");
  // 휠의 스크롤 방향에 따라 npos 값을 변경
  float e = event.getCount();
  npos -= e * 20;  // 20은 스크롤 속도 (조정 가능)
  
  // 스크롤 제한: 화면을 넘어가지 않도록
  npos = constrain(npos, -548, 0);  
  
  // 부드러운 스크롤 효과를 위한 보간 처리
  pos += (npos - pos) * 0.1;
  
  scrollY = int(pos);
  
  println("scrollY 업데이트 : " + scrollY);
  }