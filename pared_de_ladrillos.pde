void setup(){
  size(600, 600);

  int filas = 6;
  int columnas = 4;
  int ladrilloAncho = width / columnas;
  int ladrilloAlto = height / filas;

  for(int i = 0; i < filas; i++){
    for(int j = 0; j < columnas; j++){
      
      int offset = (i % 2 == 0) ? 0 : ladrilloAncho / 2;

      fill(128, 128, 128);
      stroke(80);

      rect(j * ladrilloAncho - offset, i * ladrilloAlto, ladrilloAncho, ladrilloAlto);
    }
  }
}
