class Pelota {
  PVector pos;
  PVector vel;
  float r = 20;

  Pelota(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
  }

  void addFuerza(PVector fuerza) {
    vel.add(fuerza);
  }

  void saltar() {
    vel.y = -6; 
  }

  void mover() {
    pos.add(vel);
    vel.limit(8); 
    
  
    if (pos.y > height) pos.y = height;
    if (pos.y < 0) pos.y = 0;
  }

  void mostrar() {
    fill(255, 255, 0);
    ellipse(pos.x, pos.y, r * 2, r * 2);
  }
}
