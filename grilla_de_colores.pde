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

float azul = map(i, 0, cols - 1, 0, 255);
float verde = map(j, 0, rows - 1, 0, 255);

fill(0, verde, azul);
stroke(0, verde + 30, azul + 30);
rect(i * cellW, j * cellH, cellW, cellH);
}
}
}
