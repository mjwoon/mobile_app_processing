class Widget {
  float x, y, width, height;
  color bgColor;


  Widget(float x, float y, float width, float height, color bgColor) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.bgColor = bgColor;    
  }


  void display() {
    fill(bgColor);
    rect(x, y, width, height);
    fill(0);
  }
}