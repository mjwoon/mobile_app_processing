class WeatherWidget extends Widget {
  PImage weatherImage; // 감자 이미지를 저장할 변수

  WeatherWidget(float x, float y, float width, float height, color bgColor) {
    super(x, y, width, height, bgColor);

    weatherImage = loadImage("weather.png");
  }

   @Override
  void display() {
    fill(#F5F5F5);  // GamjaWidget만의 고유한 색상
    rect(x, y, width, height);
    noStroke(); 
    image(weatherImage, x, y, width, height);
    
  }
}