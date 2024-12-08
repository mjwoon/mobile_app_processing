class BookWidget extends Widget{
    PImage bookImage; // 감자 이미지를 저장할 변수

    BookWidget(float x, float y, float width, float height, float radius,color bgColor) {
        super(x, y, width, height, radius, bgColor);

        bookImage = loadImage("book.png");

    }


    @Override
    void display() {
        fill(249,242,232);  // GamjaWidget만의 고유한 색상
        rect(x, y, width, height,radius);

        image(bookImage, x, y, width, height);

    }
}