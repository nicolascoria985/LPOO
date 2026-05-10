int cols = 10;
int rows = 10;
float cellW, cellH;
boolean[][][] celdas;

void setup() {
  size(600, 600);
  cellW = width / float(cols);
  cellH = height / float(rows);
  celdas = new boolean[cols][rows][8];
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      for (int k = 0; k < 8; k++) {
        celdas[i][j][k] = random(1) > 0.5;
      }
    }
  }
}

void draw() {
  background(0);
  stroke(255);
  
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      float x = i * cellW;
      float y = j * cellH;
      
     
      if (celdas[i][j][0]) line(x, y, x + cellW, y);
      if (celdas[i][j][1]) line(x + cellW, y, x + cellW, y + cellH);
      if (celdas[i][j][2]) line(x, y + cellH, x + cellW, y + cellH); 
      if (celdas[i][j][3]) line(x, y, x, y + cellH); 
      
      // diagonales
      if (celdas[i][j][4]) line(x, y, x + cellW, y + cellH); 
      if (celdas[i][j][5]) line(x + cellW, y, x, y + cellH); 
    }
  }
}
