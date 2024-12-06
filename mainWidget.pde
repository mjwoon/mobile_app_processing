

ArrayList<Widget> widgets = new ArrayList<Widget>();

int scrollY = 0; // 스크롤을 위한 변수
boolean isDragging = false; // 드래그 중인지 여부 확인
float pos, npos;  // pos는 부드러운 스크롤을 위한 위치, npos는 목표 스크롤 위치


GamjaWidget gamjaWidget;
MusicWidget musicWidget;
BookWidget bookWidget; 
BatteryWidget batteryWidget;


void setup() {
    size(436, 888);
    background(255);


    gamjaWidget = new GamjaWidget(22, 822 + scrollY, 368, 224, 20,color(200, 200, 255));
    musicWidget = new MusicWidget(214,1064 + scrollY, 176, 104, 20,color(220,220,220));
    bookWidget = new BookWidget(26, 16 + scrollY, 380, 224, 20,color(255,220,220));
    batteryWidget = new BatteryWidget(22, 281 + scrollY, 368,90, 20,color(255));

    widgets.add(gamjaWidget);
    widgets.add(musicWidget);
    widgets.add(bookWidget);
    widgets.add(batteryWidget);

}

void draw(){
    background(255);

    npos = constrain(npos, -1415, 0);  // 스크롤 제한: 화면을 넘어가지 않도록
    pos += (npos - pos) * 0.1;  // 부드러운 스크롤 효과

    pushMatrix();
    translate(0, int(pos));

    // 각 위젯의 display() 호출
    for (Widget widget : widgets) {
        widget.display();
    }
    popMatrix();

}


// 마우스 클릭 시 드래그 시작
void mousePressed() {
  isDragging = true;  // 마우스를 클릭하면 드래그 시작
}

// 마우스 드래그 시 스크롤 이동
void mouseDragged(MouseEvent event) {
  if (isDragging) {
    npos += (mouseY - pmouseY) * 1.5;  // 드래그한 만큼 스크롤 위치 변경
  }
}

// 마우스 클릭 해제 시 드래그 종료
void mouseReleased() {
  isDragging = false;  // 드래그 종료
}