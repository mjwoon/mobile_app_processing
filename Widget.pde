class Widget {
  float x, y, width, height,radius;
  color bgColor;


  Widget(float x, float y, float width, float height,float radius, color bgColor) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.bgColor = bgColor; 
    this.radius = radius;
  }


  void display() {
    fill(bgColor);
    rect(x, y, width, height,radius);
    fill(0);
  }
}