/**
 * Network, first composed of node and branch
 */

// Note that we have a matrix in order to dispatch 
// approxymately equally all the nodes
Node[][] grid;
Node n;

// Configuration
int w = 800;
int h = 500;
int cols = 8;
int rows = 6;
float margin = 100;

float p, r;

void setup(){
  size(w, h);
  
  n = new Node();
  grid = new Node[cols][rows];
  
  for(int i = 0; i < cols; i++) {
    for(int j = 0; j < rows; j++) {
      grid[i][j] = new Node(
          margin + ((w - 2*margin)/cols)*i + random((w - 2*margin)/cols - 10),
          margin + ((h - 2*margin)/rows)*j + random((h - 2*margin)/rows - 10),
          color(87, 126, 171, 50)
        );
    }
  }
}

void draw(){
  background(200);
  smooth();
  
  for(int i = 0; i < cols; i++) {
    for(int j = 0; j < rows; j++) {
      n = grid[i][j];
      n.joinNeighboor(i, j);
      
      if(n.getA()) { n.setC(color(227, 161, 86, 80)); } 
      else { n.setC(color(87, 126, 171, 80)); }
      
      p = pow((n.getX() - mouseX), 2) + pow((n.getY() - mouseY), 2);
      r = pow(n.getR(), 2);

      if(p < r) {
        n.displayM(n.getR() + 20);
      } else {      
        n.display();
      }
    }
  }
}

void mouseClicked() {
  for(int i = 0; i < cols; i++) {
    for(int j = 0; j < rows; j++) {
      n = grid[i][j];
      n.joinNeighboor(i, j);
      p = pow((n.getX() - mouseX), 2) + pow((n.getY() - mouseY), 2);
      r = pow(n.getR(), 2);
      
      if(p < r) {
        n.active();
      }
    }
  }
}



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

