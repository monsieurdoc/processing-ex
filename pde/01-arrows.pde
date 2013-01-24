Arrow[][] grid;
int cols = 20;
int rows = 12;


void setup() {
  size(500, 300);
  grid = new Arrow[cols][rows];
  for(int i = 0; i < cols; i++) {
    for(int j = 0; j < rows; j++) {
      grid[i][j] = new Arrow(12.5 + i*25, 12.5 + j*25, 15, PI/2, color(255));
    }
  }
}

void draw() {
  background(1, 6, 13, 0.02);
  for(int i = 0; i < cols; i++) {
    for(int j = 0; j < rows; j++) {
      grid[i][j].follow();
      grid[i][j].display();
    }
  }
}

class Arrow {
  /** 
   * float _x, _y are the coordinates of the center of rotation
   * float _l is the length
   * float _a is the angle of rotation (in rad, 0 to PI*2)
   * color _c is the color (really ?)
   */
  float _x, _y;
  float _l, _a;
  color _c;
    
  Arrow() {
    _x = 0;
    _y = 0;
    _l = 20;
    _a = PI/2;
    _c = color(255);
  }    
    
  Arrow(float x, float y, float l, float a, color c){
    _x = x;
    _y = y;
    _l = l;
    _a = a;
    _c = c;
  }
  
  void setX(float x) { _x = x; }
  void setY(float y) { _y = y; }
  void setLength(float l) { _l = l; }
  void setAngle(float a) { _a = a; }
  void setColor(color c) { _c = c; }
  
  void display() {
    stroke(_c);
    
    float p11, p12, p21, p22;
    p11 = - (_l/2) * cos(_a) + _x;
    p12 = - (_l/2) * sin(_a) + _y;
    p21 = (_l/2) * cos(_a) + _x;
    p22 = (_l/2) * sin(_a) + _y;
    
    line(p11, p12, p21, p22);
    
    ellipse(p11, p12, 3, 3);
  }
  
  void follow() {
    float aX, aY;
    
    aX = mouseX - _x;
    aY = mouseY - _y;
    
    if(aX == 0 && aY < 0) { _a = PI*(3/2); }
    else if(aX == 0 && aY > 0) { _a = PI/2; }
    else if(aY == 0 && aX < 0) { _a = PI; }
    else if(aY == 0 && aX > 0) { _a = 0; }
    else if(aY > 0 && aX < 0) { _a = atan(aY/aX) - PI; }
    else if(aY < 0 && aX < 0) { _a = atan(aY/aX) + PI; }
    else { _a = atan(aY/aX); }
  }
}
