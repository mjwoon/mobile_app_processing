class BookWidget extends Widget{
    PImage bookImage; // 감자 이미지를 저장할 변수

    BookWidget(float x, float y, float width, float height, color bgColor) {
        super(x, y, width, height, bgColor);

        bookImage = loadImage("book.png");

    }


    @Override
    void display() {
        fill(255, 204, 0);  // GamjaWidget만의 고유한 색상
        rect(x, y, width, height);

        image(bookImage, x, y, width, height);

    }
}