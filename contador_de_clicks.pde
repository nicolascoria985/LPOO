int maxCirculos = 10;          // cantidad máxima de círculos
PVector[] posiciones;          // array para guardar posiciones
int indice = 0;              

void setup() {
  size(600, 600);
  posiciones = new PVector[maxCirculos];
  for (int i = 0; i < maxCirculos; i++) {
    posiciones[i] = new PVector(-100, -100); 
  }
}

void draw() {
  background(0);
  fill(255);
  noStroke();
  
  for (int i = 0; i < maxCirculos; i++) {
    ellipse(posiciones[i].x, posiciones[i].y, 20, 20);
  }
}

void mousePressed() {
  posiciones[indice].set(mouseX, mouseY);
  
  indice = (indice + 1) % maxCirculos;
}
