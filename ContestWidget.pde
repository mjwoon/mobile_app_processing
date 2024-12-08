
class ContestWidget extends Widget{

    PImage[] contestImg = new PImage[2];
    PImage plusImage,rightArrow,leftArrow;

    String[] contestTitle = new String[2];
    String[] contestDate = new String[2];
    boolean screenChanged = false;  
    float scrollY;
    int currentIndex = 0; 
    int plusIndex = 0; // 1일 때는 plus 이미지 나옴
    String ContestUrl = "https://linkareer.com/list/contest?filterBy_categoryIDs=38&filterType=CATEGORY&orderBy_direction=DESC&orderBy_field=CREATED_AT&page=1";


    ContestWidget(float x, float y, float width, float height,
    float radius, color bgColor){
        super(x,y, width, height, radius, bgColor);

        contestImg[0] = loadImage("contest1.png");
        contestImg[1] = loadImage("contest2.png");
        plusImage = loadImage("Plus.png");
        rightArrow = loadImage("CrightArrow.png");
        leftArrow = loadImage("CleftArrow.png");

        contestTitle[0] = "Title1";
        contestTitle[1] = "Title2";

        contestDate[0] = "24.9.1 ~ 24.10.15";
        contestDate[1] = "24.10.10 ~ 24.10.31";
    }

    @Override
    void display(){
        fill(104,104,104);
        rect(215,558,173,258,20);

        textSize(32);
        fill(255);

        if (currentIndex == 0) {
            text(contestTitle[currentIndex], x + 47, y + 40);  // 0번 인덱스일 때
        } else if (currentIndex == 1) {
            text(contestTitle[currentIndex], x + 47, y + 40);  // 1번 인덱스일 때 (위치 변경 가능)
        }

        image(contestImg[currentIndex], x + 33, y + 55, 110, 156);

        // 화살표 처리
        if (currentIndex == 0) {
            // 0번 인덱스에서는 오른쪽 화살표만
            image(rightArrow, x + 155, y + 130, 10, 15);
        } else if (currentIndex == 1) {
            // 1번 인덱스에서는 좌우 화살표 모두
            image(leftArrow, x + 10, y + 130, 10, 15);
            image(rightArrow, x + 155, y + 130, 10, 15);
        }

        textSize(16);
        fill(255);
        text(contestDate[currentIndex], x + 33, y + 233);

        // 화면 변경 여부 확인 후 Plus 이미지 표시
        if (plusIndex == 1) {
            fill(104,104,104);
            rect(215,558,173,258,20);

            image(plusImage, x + 45, y + 90, 82, 82);
            image(leftArrow, x + 10, y + 130, 10, 15);

            fill(255);
            textSize(18);
            text("Add", x + 70, y + 210);
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

    void moveLink(){
        link(ContestUrl);
    }

    void beforeScreen(){
        if (currentIndex > 0) {
            currentIndex -= 1;  // 이전 공모전으로
            plusIndex = 0;
        }
    }

    boolean isRightArrowClicked(float mouseX, float mouseY, float scrollY){
        float rArrowX = x+160;
        float rArrowY = y+130+scrollY;
        float rArrowWidth = 10;
        float rArrowHeight  = 15;

        if(mouseX > rArrowX && mouseX < rArrowX + rArrowWidth &&
        mouseY > rArrowY && mouseY < rArrowY + rArrowHeight){
            println("오른쪽 화살표 클릭");
            return true;
        }
        return false;
    }

    boolean isLeftArrowClicked(float mouseX, float mouseY, float scrollY){
        float lArrowX = x+10;
        float lArrowY = y+130+scrollY;
        float lArrowWidth = 10;
        float lArrowHeight  = 15;
       if(mouseX > lArrowX && mouseX < lArrowX + lArrowWidth &&
        mouseY > lArrowY && mouseY < lArrowY + lArrowHeight){
            println("왼쪽 화살표 클릭");
            return true;
        }
        return false;
    }

    boolean isPluseClicked(float mouseX,float mouseY, float scrollY){
        float plusX = x + 45;
        float plusY = y + 90;
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