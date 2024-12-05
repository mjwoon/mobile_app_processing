class BatteryWidget extends Widget{
    PImage batteryImage; // 감자 이미지를 저장할 변수

    BatteryWidget(float x, float y, float width, float height, color bgColor) {
        super(x, y, width, height, bgColor);

        batteryImage = loadImage("battery.png");

    }


    @Override
    void display() {
        fill(255, 204, 0);  // GamjaWidget만의 고유한 색상
        rect(x, y, width, height);

        image(batteryImage, x, y, width, height);

    }
}