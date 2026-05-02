int cant = 10;
int sepx, sepy;
void setup() {
  size(800, 600);
  sepx = width/cant;
  sepy = height/cant;
}

void draw() {
  background(255);
  for (int i = 0; i<cant; i++) {
    //linea desde el vertice superior izquierdo
    line(0, i*sepy, i*sepx, height);
    
    //linea desde el vertice superior derecho
    line(width, i*sepy, width - (i*sepx), height);
    
    //linea desde el vertice inferior derecho
    line(width, height - (i*sepy), width - (i*sepy), 0);
    
    //linea desde el vertice inferior izquierdo
    line(0, i*sepy, height - (i*sepx), 0);
  }
}
