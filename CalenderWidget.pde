
class CalenderWidget extends Widget{
    PImage calenderImage, calenderPlusImage;
    float scrollY;
    String CalenderURL = "https://calendar.google.com/calendar/u/0/r?pli=1";

    CalenderWidget(float x, float y, float width, float height,
     float radius, color bgColor){
        super(x, y, width, height, radius, bgColor);

        calenderImage = loadImage("calender.png");
        calenderPlusImage = loadImage("calenderPlus.png");
    }

    @Override
    void display(){
        fill(255);

        image(calenderImage, x, y, width, height);
        image(calenderPlusImage, x+114, y+26, 53,56);
    }

    boolean isPluseClicked(float mouseX, float mouseY, float scrollY){
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

    void moveLink(){
        link(CalenderURL);
    }
}