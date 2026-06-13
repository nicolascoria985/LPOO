MOVIL[] moviles;
int cant = 15; 

void setup() {
  size(800, 600);
  moviles = new MOVIL[cant];
  
  for (int i = 0; i < cant; i++) {
 
    float x = map(i, 0, cant - 1, 50, width - 50);
    float y = height / 2;
    
    // Velocidades aleatorias
    float vx = random(-4, 4);
    float vy = random(-4, 4);
    

    moviles[i] = new MOVIL(x, y, vx, vy);
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
