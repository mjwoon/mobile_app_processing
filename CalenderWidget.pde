
class CalenderWidget extends Widget{
    PImage calenderImage, calenderPlusImage;

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

}