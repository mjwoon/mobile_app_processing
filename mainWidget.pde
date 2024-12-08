
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


void setup() {
  size(436, 888);
  background(255);

  gamjaWidget = new GamjaWidget(22, 822 + scrollY, 368, 224, 20,color(200, 200, 255));
  musicWidget = new MusicWidget(214,1064 + scrollY, 176, 104, 20,color(220,220,220));
  bookWidget = new BookWidget(26, 16 + scrollY, 380, 224, 20,color(255,220,220));
  batteryWidget = new BatteryWidget(22, 281 + scrollY, 368,90, 20,color(255));
  contestWidget = new ContestWidget(215,558,173,258,20,color(104,104,104));
  
  weatherWidget = new WeatherWidget(26, 522 + scrollY, 368, 138, color(200, 200, 255));
  noteWidget = new NoteWidget(26, 722 + scrollY, 174, 174, color(200, 200, 255));

  widgets.add(gamjaWidget);
  widgets.add(musicWidget);
  widgets.add(bookWidget);
  widgets.add(batteryWidget);
  widgets.add(contestWidget);
  widgets.add(weatherWidget);
  widgets.add(noteWidget); 

  cp5.addButton("ArrowBtn")
     .setPosition(376,934 + scrollY)
     .setImage(ArrowImage)
     .setSize(7,12)
     .setId(1)
     .updateSize();
}

void draw(){
    background(249,242,232);

    pushMatrix();
    translate(0, int(pos));

    // 각 위젯의 display() 호출
    for (Widget widget : widgets) {
        widget.display();
    }
    popMatrix();
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
    } else if (widget instanceof ContestWidget){
      ContestWidget contestWidget = (ContestWidget) widget;
      if (contestWidget.isRightArrowClicked(mouseX,mouseY,scrollY)){
        println("다음 공모전");
        contestWidget.nextScreen();
      } else if(contestWidget.isLeftArrowClicked(mouseX,mouseY,scrollY)){
        print("이전 공모전");
        contestWidget.beforeScreen();
      }
    }
  }

}

// 휠 스크롤 이벤트 처리
void mouseWheel(MouseEvent event) {
  println("마우스 휠");
  // 휠의 스크롤 방향에 따라 npos 값을 변경
  float e = event.getCount();
  npos -= e * 20;  // 20은 스크롤 속도 (조정 가능)

  // 스크롤 제한: 화면을 넘어가지 않도록
  npos = constrain(npos, -1415, 0);  // 최대 스크롤 위치 -1415로 설정 (예시)
  
  // 부드러운 스크롤 효과를 위한 보간 처리
  pos += (npos - pos) * 0.1;

  scrollY = int(pos);

  println("scrollY 업데이트 : " + scrollY);
}