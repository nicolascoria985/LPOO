MOVIL[] moviles;
int columnas = 10; 
int filas = 8;     
int cant = columnas * filas; 


void setup() {
  size(800, 600);
  moviles = new MOVIL[cant];
  
  int index = 0; 
  

  for (int f = 0; f < filas; f++) {
    for (int c = 0; c < columnas; c++) {
      
     
      float x = map(c, 0, columnas - 1, 60, width - 60);
      float y = map(f, 0, filas - 1, 60, height - 60);
      
     
      float vx = random(-5, 5);
      float vy = random(-5, 5);
      
   
      moviles[index] = new MOVIL(x, y, vx, vy);
      index++; 
    }
  }
}


void draw() {
  background(0);
  for (int i = 0; i < cant; i++) {
    moviles[i].mover();
    moviles[i].mostrar();
    moviles[i].contener();
  }
}

class MOVIL {
  PVector pos;
  PVector vel = new PVector(1, 5);
  int tamano = 15;

  MOVIL() {
    pos = new PVector(random(width), random(height));
  }
  
  MOVIL(float Px, float Py) {
    pos = new PVector(Px, Py);
  }
  
  MOVIL(float Px, float Py, float Vx, float Vy) {
    pos = new PVector(Px, Py);
    vel = new PVector(Vx, Vy);
  }

  void mover() {
    pos.add(vel);
  }

  void mostrar() {
    fill(random(255), random(255), random(255));
    circle(pos.x, pos.y, tamano);
  }
  
  void contener() {
    float r = tamano / 2;
    if (pos.x + r > width || pos.x - r < 0) {
      vel.x = vel.x * -1;
    }
    if (pos.y + r > height || pos.y - r < 0) {
      vel.y = vel.y * -1;
    }
  }
}
