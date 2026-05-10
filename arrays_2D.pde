int cols = 20;  
int rows = 20;   
float[][] distancias;  
float cellW, cellH;    

void setup() {
  size(600, 600);
  cellW = width / float(cols);
  cellH = height / float(rows);
  distancias = new float[cols][rows];
}

void draw() {
  background(255);
  
 
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      
      float cx = i * cellW + cellW / 2;
      float cy = j * cellH + cellH / 2;
      
      
      float d = dist(cx, cy, mouseX, mouseY);
      distancias[i][j] = d;
      
     
      float gris = map(d, 0, width, 255, 0);
      fill(gris);
      rect(i * cellW, j * cellH, cellW, cellH);
    }
  }
}
