
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


void setup() {
  size(412, 888);
  background(255);
  
  statusWidget = new StatusWidget(22, 0, 372, 44, 25, color(255, 255, 255));
  bookWidget = new BookWidget(16, 40 + scrollY, 385, 227, 0, color(255,220,220)); 
<<<<<<< HEAD
  batteryWidget = new BatteryWidget(22, 286 + scrollY, 368, 90, 20, color(255));
  weatherWidget = new WeatherWidget(22, 398 + scrollY, 368, 138, 20, color(200, 200, 255));
  contestWidget = new ContestWidget(215, 558, 173, 258, 20, color(104,104,104));
  gamjaWidget = new GamjaWidget(22, 838 + scrollY, 368, 224, 20, color(249, 242, 232));
  musicWidget = new MusicWidget(212, 1084 + scrollY, 188, 116, 20, color(220,220,220)); 
  noteWidget = new NoteWidget(214, 1210 + scrollY, 174, 174, 20, color(200, 200, 255));
  assistWidget = new AssistWidget(22, 1084 + scrollY, 173, 305, 20, color(#ffffff));
  calenderWidget = new CalenderWidget(18, 544, 190, 296, 20, color(104,104,104));
 
=======
  batteryWidget = new BatteryWidget(22, 286 + scrollY, 368, 90, 25, color(255));
  weatherWidget = new WeatherWidget(22, 398 + scrollY, 368, 138, 25, color(200, 200, 255));
  contestWidget = new ContestWidget(215, 558, 173, 258, 25, color(104,104,104));
  gamjaWidget = new GamjaWidget(22, 838 + scrollY, 368, 224, 25, color(249, 242, 232));
  musicWidget = new MusicWidget(212, 1084 + scrollY, 188, 116, 25, color(220,220,220)); 
  noteWidget = new NoteWidget(214, 1210 + scrollY, 174, 174, 25, color(200, 200, 255));
  assistWidget = new AssistWidget(22, 1084 + scrollY, 173, 305, 25, color(#ffffff));
  calenderWidget = new CalenderWidget(18, 544, 190, 296, 25, color(104,104,104));
  fullNote = new FullNote(0, 40, 480, 800, 0, color(249,242,232));

>>>>>>> main
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

void mouseWheel(MouseEvent event) {
  
  float e = event.getCount();
  npos -= e * 40;  // 40은 스크롤 속도 (조정 가능)
  
  // 스크롤 제한: 화면을 넘어가지 않도록
  npos = constrain(npos, -548, 0);  
  
  // 부드러운 스크롤 효과를 위한 보간 처리
  pos += (npos - pos) * 0.1;
  
  scrollY = int(pos);
}