int cols = 20;
int rows = 20;
float cellW, cellH;

void setup(){
size(600,600);
cellW = width / (float)cols;
cellH = height / (float)rows;
}

void draw(){
background(0);

for(int i = 0; i < cols; i++){
for(int j = 0; j < rows; j++){
  
float centerX = i * cellW + cellW / 2.0;
float centerY = j * cellH + cellH / 2.0;

float d = dist(centerX, centerY, mouseX, mouseY);


float azul = map(d, 0, 300, 255, 0);
azul = constrain(azul, 0, 255);

fill(0, 0, azul);
stroke(0, 0, azul + 30);
rect(i * cellW, j * cellH, cellW, cellH);
}
}
}
