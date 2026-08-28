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
    fill(0, 200, 0);
    rect(pos.x, pos.y, w, h);
  }
}
