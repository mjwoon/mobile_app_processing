class WeatherWidget extends Widget {
  PImage weatherImage;
  float scrollY;
  String WeatherURL = "https://www.weather.go.kr/w/index.do"; 
  
  WeatherWidget(float x, float y, float width, float height, float radius, color bgColor) {
    super(x, y, width, height, radius, bgColor);
    
    weatherImage = loadImage("weather.png");
  }
  
  @Override
  void display() {
    fill(249,242,232);  // GamjaWidget만의 고유한 색상
    rect(x, y, width, height);
    noStroke(); 
    image(weatherImage, x, y, width, height);
    
  }
  
  boolean isPluseClicked(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 16;
    float plusY = y + 16 + scrollY;    
    float plusWidth = 360;
    float plusHeigh = 130;
    
    if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("날씨 클릭");
      return true;
    }
    return false;
    
  }
  
  void moveLink() {
    link(WeatherURL);
  }
} 