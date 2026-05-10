int numBarras = 20;      
float[] alturas;          
float anchoBarra;        

void setup() {
  size(600, 400);
  alturas = new float[numBarras];
  anchoBarra = width / float(numBarras);
  
 
  for (int i = 0; i < numBarras; i++) {
    alturas[i] = random(height);
  }
}

void draw() {
  background(0);
  noStroke();
  fill(0, 200, 255);
  
  for (int i = 0; i < numBarras; i++) {
    rect(i * anchoBarra, height - alturas[i], anchoBarra - 2, alturas[i]);
  }
}

void mouseDragged() {

  int indice = int(mouseX / anchoBarra);
  
  if (indice >= 0 && indice < numBarras) {
    alturas[indice] = constrain(height - mouseY, 0, height);
  }
}
