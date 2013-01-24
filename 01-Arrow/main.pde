import Arrow;

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

