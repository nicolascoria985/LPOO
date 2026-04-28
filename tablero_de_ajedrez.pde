void setup(){
size(600, 600);

int filas = 8;
int columnas = 8;
int tamaño = width / columnas;

for(int i = 0; i < filas; i++){
for(int j = 0; j < columnas; j++){

  if((i + j) % 2 == 0){
fill(255);
}else{
  fill(0);
}
rect(j * tamaño, i * tamaño, tamaño, tamaño);
}
}
}
