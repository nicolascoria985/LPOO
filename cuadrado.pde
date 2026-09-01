class cuadrado {
  PVector pos;
  float w, h;
  float velocidadX = -3;

  cuadrado(float x, float y, float ancho, float alto) {
    pos = new PVector(x, y);
    w = ancho;
    h = alto;
  }

  void mover() {
    pos.x += velocidadX;
  }

 void mostrar() {
  // Cambiamos a CORNER para que coincida con la esquina del rectángulo de colisión
  imageMode(CORNER); 
  
  // Dibujamos la imagen usando el ancho (w) y alto (h) reales del tubo
  image(imgTubo, pos.x, pos.y, w, h); 
}

}
