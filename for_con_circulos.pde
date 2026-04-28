int filas = 1;
int columnas = 6;
float a = width / 2;
float b = height /2;

void setup(){
size(800, 800);
noStroke();
int tamaño = 20;
int desp = 110;

for(int i = 0; i < filas; i++){
  for (int j = 0; j < columnas; j++){
float x = tamaño * j;
  float d_horizontal = desp * j;
fill(0);
 ellipse(a + d_horizontal, b + 250, 50 + x, 50 + x);
  }
}
}
