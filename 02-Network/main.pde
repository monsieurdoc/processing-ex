import Node;
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



