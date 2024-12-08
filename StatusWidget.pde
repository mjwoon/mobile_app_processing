class StatusWidget extends Widget {
  PImage statusImage; 
  
  StatusWidget(float x, float y, float width, float height, float radius, color bgColor) {
    super(x, y, width, height, radius, bgColor);
    
    statusImage = loadImage("statusbar.png");
  }
  
  @Override
  void display() {
    fill(249,242,232);
    rect(x, y, width, height);
    noStroke();
    image(statusImage, x, y, width, height);
  }
  
}