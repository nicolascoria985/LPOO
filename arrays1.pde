int [] hLinea;

void setup(){
size(600,600);
hLinea = new int[width];
for (int i = 0; i < width; i++){
hLinea[i] = height * 1; 
}
}

void draw(){
for (int i = 0; i < width; i++){
line(i, hLinea[i], i, height);
}
ActualizarArray();
}

void ActualizarArray(){
if (mousePressed){
  int x = constrain(mouseX, 0, width);
hLinea[x] = mouseY;
line(mouseX, mouseY, pmouseX, pmouseY);
}
}
