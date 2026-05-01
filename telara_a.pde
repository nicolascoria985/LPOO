void setup(){
  size(600, 600);
  background(255);
  stroke(0);

  int puntos = 10; // cantidad de puntos en cada borde
  float espacio = width / (float)(puntos - 1);

  // Dibujar marco
  noFill();
  rect(50, 50, width-100, height-100);

  // Dibujar puntos y líneas
  for(int i = 0; i < puntos; i++){
    float xTop = 50 + i * espacio;
    float yTop = 50;
    float xBottom = 50 + i * espacio;
    float yBottom = height - 50;

    // puntos
    fill(0);
    ellipse(xTop, yTop, 6, 6);
    ellipse(xBottom, yBottom, 6, 6);

    // líneas diagonales: conectar cada punto superior con todos los inferiores
    for(int j = 0; j < puntos; j++){
      float xB = 50 + j * espacio;
      line(xTop, yTop, xB, yBottom);
    }
  }
}
