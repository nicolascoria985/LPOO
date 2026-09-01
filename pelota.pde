class Pelota {
  PVector pos;
  PVector vel;
  float r = 18;
  
  // 3. Variable para controlar qué imagen mostrar
  boolean estaAleteando = false;
  int temporizadorAleteo = 0;

  Pelota(float x, float y) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
  }

  void addFuerza(PVector fuerza) {
    vel.add(fuerza);
  }

  void saltar() {
    vel.y = -5.5; 
    estaAleteando = true;          // Activa la segunda imagen al saltar
    temporizadorAleteo = frameCount; // Guarda el fotograma actual para el temporizador
  }

  void mover() {
    pos.add(vel);
    vel.limit(8); 
    
    // 4. Si pasaron 10 fotogramas (aprox. 0.15 segundos), vuelve a la imagen normal
    if (estaAleteando && frameCount - temporizadorAleteo > 10) {
      estaAleteando = false;
    }
  }

  void mostrar() {
    imageMode(CENTER);
    
    // 5. Condicional para decidir qué imagen dibujar
    if (estaAleteando) {
      image(imgPajaro2, pos.x, pos.y, r * 2, r * 2); // Imagen de salto
    } else {
      image(imgPajaro, pos.x, pos.y, r * 2, r * 2); // Imagen normal
    }
  }
}
