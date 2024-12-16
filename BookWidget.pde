class BookWidget extends Widget{
  PImage bookImage; 
  float scrollY;
  String TodayURL =  "https://www.millie.co.kr/";
  String FeedURL = "https://www.millie.co.kr/v3/feed";
  String SearchURL = "https://www.millie.co.kr/v3/search";
  String MyPageURL = "https://www.millie.co.kr/v3/myshelf";
  
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
  
  boolean isPluseClicked(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 16;
    float plusY = y + 180 + scrollY;    
    float plusWidth = 80;
    float plusHeigh = 40;
    float plusX2 = plusX + 95; 
    
    if (mouseX > plusX && mouseX < plusX + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("밀리의서재 투데이 클릭");
      return true;
    }
    return false;
    
  }
  
  boolean isPluseClicked2(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 16;
    float plusY = y + 180 + scrollY;    
    float plusWidth = 80;
    float plusHeigh = 40;
    float plusX2 = plusX + 95; 
    
    if (mouseX > plusX2 && mouseX < plusX2 + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("밀리의서재 피드 클릭");
      return true;
    }
    return false;
    
  }
  
  boolean isPluseClicked3(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 16;
    float plusY = y + 180 + scrollY;    
    float plusWidth = 80;
    float plusHeigh = 40;
    float plusX2 = plusX + 95; 
    float plusX3 = plusX2 + 95;
    
    if (mouseX > plusX3 && mouseX < plusX3 + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("밀리의서재 검색 클릭");
      return true;
    }
    return false;
    
  }
  
  boolean isPluseClicked4(float mouseX, float mouseY, float scrollY) {
    float plusX = x + 16;
    float plusY = y + 180 + scrollY;    
    float plusWidth = 80;
    float plusHeigh = 40;
    float plusX2 = plusX + 95; 
    float plusX3 = plusX2 + 95;
    float plusX4 = plusX3 + 95;
    
    if (mouseX > plusX4 && mouseX < plusX4 + plusWidth && 
      mouseY > plusY && mouseY < plusY + plusHeigh) {
      println("밀리의서재 마이페이지 클릭");
      return true;
    }
    return false;
    
  }
  
  void moveLink() {
    link(TodayURL);
  }
  void moveLink2() {
    link(FeedURL);
  }
  
  void moveLink3() {
    link(SearchURL);
  }
  
  void moveLink4() {
    link(MyPageURL);
  }
}