
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
    float radius, color bgColor){
        super(x,y, width, height, radius, bgColor);

        contestImg[0] = loadImage("contest1.png");
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

        koreanFont = createFont("malgunbd.ttf",32);

    }

    @Override
    void display(){
        fill(154,159,166);
        rect(215,558,173,258,25);

        textFont(koreanFont);
        fill(255);

         // 텍스트 크기를 1포인트 키우고, 굵은 글씨로 설정
    textSize(17);  // 기존 15에서 16으로 증가

        if (currentIndex == 0) {
            textSize(15);
            text(contestTitle[currentIndex], x + 9, y + 38);  // 0번 인덱스일 때
            image(normalPoint, x+71, y+240);  // 하단 포인트 추가
            image(selectPoint, x+80, y+240);
            image(selectPoint, x+89, y+240);

        } else if (currentIndex == 1) {
            textSize(15);
            text(contestTitle[currentIndex], x + 21, y + 38);  // 1번 인덱스일 때 (위치 변경 가능)
            image(selectPoint, x+71, y+240);  // 하단 포인트 추가
            image(normalPoint, x+80, y+240);
            image(selectPoint, x+89, y+240);
        }

        image(contestImg[currentIndex], x + 33, y + 55, 110, 156);

        // 화살표 이미지 크기를 줄임
    if (currentIndex == 0) {
        // 0번 인덱스에서는 오른쪽 화살표만
        image(rightArrow, x + 155, y + 120, 8, 12);  // 크기 10x15에서 8x12로 축소
    } else if (currentIndex == 1) {
        // 1번 인덱스에서는 좌우 화살표 모두
        image(leftArrow, x + 10, y + 120, 8, 12);   // 크기 10x15에서 8x12로 축소
        image(rightArrow, x + 155, y + 120, 8, 12);
    }


        textSize(15);
        fill(255);
        text(contestDate[currentIndex], x + 14, y + 230);

        // 화면 변경 여부 확인 후 Plus 이미지 표시
        if (plusIndex == 1) {
            fill(154,159,166);
            rect(215,558,173,258,25);

            image(plusImage, x + 45, y + 80, 82, 82);
            image(leftArrow, x + 10, y + 120, 8, 12);

            image(selectPoint, x+71, y+240);  // 하단 포인트 추가
            image(selectPoint, x+80, y+240);
            image(normalPoint, x+89, y+240);

            fill(255);
            textSize(16);
            text("추가", x + 70, y + 192);
        }
        
    }

    void nextScreen(){
        if (currentIndex < contestImg.length - 1) {
            currentIndex += 1;  // 다음 공모전으로
        } else {
            // 마지막 공모전일 경우 Plus 이미지 표시
            plusIndex = 1;
        }
    }

    void beforeScreen(){
        if (plusIndex == 1){
            currentIndex = contestImg.length - 1;
            plusIndex = 0;
        } else if ( currentIndex > 0){
            currentIndex -= 1;
        }
    }
    void moveLink(){
        link(ContestUrl);
    }


    boolean isRightArrowClicked(float mouseX, float mouseY, float scrollY){
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

    boolean isLeftArrowClicked(float mouseX, float mouseY, float scrollY){
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

    boolean isPlusClicked(float mouseX,float mouseY, float scrollY){
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