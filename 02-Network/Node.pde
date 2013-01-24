class Node {
  float _x, _y, _r;
  int[][] _n;
  color _c;
  boolean _a;
  
  Node(){
    _x = 0;
    _y = 0;
    _c = color(255);
    _r = random(15, 90);
    _n = new int[2][2];
    _a = false;
    
    for(int i = 0; i < 2; i++) {
      for(int j = 0; j < 2; j++) {
        _n[i][j] = 0;
      }
    }
  }
  
  Node(float x, float y, color c){
    _x = x;
    _y = y;
    _c = c;
    _r = random(15, 90);
    _n = new int[2][2];
    _a = false;
    
    for(int i = 0; i < 2; i++) {
      for(int j = 0; j < 2; j++) {
        if(random(0, 1) < 0.4) { _n[i][j] = 0; }
        else { _n[i][j] = 1; }
      }
    }
    _n[1][1] = 0;
    
    display();
  }
  
  void joinNeighboor(int k, int l) {
    int begin1, begin2, end1, end2;
    
    begin1 = begin2 = -1;
    end1 = end2 = 1;
    
    switch(k) {
      case 0:
        begin1 = 0;
        break;
      case 7:
        end1 = 0;
        break;
      default:
        break;
    }
    
    switch(l) {
      case 0:
        begin2 = 0;
        break;
      case 6:
        end2 = 0;
        break;
      default:
        break;
    }
    
    stroke(255, 255, 255, 90);
    
    for(int i = begin1; i < end1; i++) {
      for(int j = begin2; j < end2; j++) {
        if((_n[i+1][j+1] == 1))
          line(_x, _y, grid[k+i][l+j].getX(), grid[k+i][l+j].getY());
      }
    }
  }
  
  void display() {
    fill(_c);
    ellipse(_x, _y, _r, _r);
  }
  
  void displayM(float r) {
    fill(_c);
    ellipse(_x, _y, r, r);
  }
  
  void active() {
    if(_a) { _a = false; }
    else { _a = true; }
  }
    
  float getX() { return _x; }
  float getY() { return _y; }
  float getR() { return _r; }
  boolean getA() { return _a; }
  void setC(color c) { _c = c; }
}
