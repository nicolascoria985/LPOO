ArrayList<cuadrado> tubos;
Pelota bird;
float ultimoPar = 0;
PVector g = new PVector(0, 0.2);

// ESTADOS DEL JUEGO
int ESTADO_MENU = 0;
int ESTADO_JUEGO = 1;
int ESTADO_GAMEOVER = 2;
int estado = ESTADO_MENU; // El juego arranca en el menú principal

PImage imgPajaro;
PImage imgTubo;
PImage imgPajaro2;

// Dimensiones del botón de jugar
float btnX, btnY, btnW, btnH;

void setup() {
  size(600, 600);
  
  // IMPORTANTE: Asegurate de tener "pajaro.png" en la carpeta data
  imgPajaro = loadImage("pajaro.png"); 
  imgPajaro2 = loadImage ("pajaro2.png");
  imgTubo = loadImage("tubo.png");
  
  // Configuración de posición y tamaño del botón "Jugar"
  btnW = 200;
  btnH = 600 * 0.1; // 60 píxeles de alto
  btnX = width / 2 - btnW / 2;
  btnY = height / 2 + 20;

  initGame();
}

void initGame() {
  tubos = new ArrayList<cuadrado>();
  bird = new Pelota(100, height / 2);
  ultimoPar = millis();
}

void draw() {
  background(135, 206, 235);
  
  if (estado == ESTADO_MENU) {
    dibujarMenu();
  } 
  else if (estado == ESTADO_JUEGO) {
    actualizarYDibujarJuego();
  } 
  else if (estado == ESTADO_GAMEOVER) {
    dibujarGameOver();
  }
}

// ==========================================
// PANTALLAS (MENÚ, JUEGO, GAMEOVER)
// ==========================================

void dibujarMenu() {
  textAlign(CENTER, CENTER);
  
  // Título del juego
  fill(255, 230, 0);
  textSize(50);
  text("FLAPPY BIRD", width / 2, height / 2 - 100);
  
  // Dibujar un pajarito decorativo flotando en el menú
  imageMode(CENTER);
  float flotarY = height / 2 - 30 + sin(frameCount * 0.05) * 10;
  image(imgPajaro, width / 2, flotarY, 50, 50);

  // Lógica visual del botón (cambia de color si el mouse está encima)
  if (mouseX > btnX && mouseX < btnX + btnW && mouseY > btnY && mouseY < btnY + btnH) {
    fill(100, 230, 100); // Verde claro al pasar el mouse
    cursor(HAND);        // Cambia el cursor a una manito
  } else {
    fill(0, 200, 0);     // Verde normal
    cursor(ARROW);       // Cursor normal
  }
  
  // Dibujo del botón
  stroke(0);
  strokeWeight(2);
  rect(btnX, btnY, btnW, btnH, 10); // El '10' redondea las esquinas
  
  // Texto del botón
  fill(255);
  textSize(24);
  text("JUGAR", width / 2, btnY + btnH / 2 - 3);
}

void actualizarYDibujarJuego() {
  cursor(ARROW); // Nos aseguramos de que el cursor sea normal jugando
  AgregarTubos();
  
  bird.addFuerza(g);
  bird.mover();
  
  borrarTubos();
  
  for (cuadrado t : tubos) {
    t.mover();
    t.mostrar();
    
    if (chequearColision(bird, t)) {
      estado = ESTADO_GAMEOVER;
    }
  }
  
  bird.mostrar();
  
  if (bird.pos.y >= height || bird.pos.y <= 0) {
    estado = ESTADO_GAMEOVER;
  }
}

void dibujarGameOver() {
  // Mostramos cómo quedó el escenario al perder
  for (cuadrado t : tubos) t.mostrar();
  bird.mostrar();
  
  // Capa oscura encima
  fill(0, 150);
  rect(0, 0, width, height);
  
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(40);
  text("GAME OVER", width / 2, height / 2 - 20);
  textSize(20);
  text("Presioná 'R' para reiniciar", width / 2, height / 2 + 30);
}

// ==========================================
// FUNCIONES AUXILIARES Y EVENTOS
// ==========================================

boolean chequearColision(Pelota p, cuadrado c) {
  float cercanoX = constrain(p.pos.x, c.pos.x, c.pos.x + c.w);
  float cercanoY = constrain(p.pos.y, c.pos.y, c.pos.y + c.h);
  
  float distanciaX = p.pos.x - cercanoX;
  float distanciaY = p.pos.y - cercanoY;
  float distanciaAlCuadrado = (distanciaX * distanciaX) + (distanciaY * distanciaY);
  
  return distanciaAlCuadrado < (p.r * p.r);
}

void borrarTubos() {
  for (int i = tubos.size() - 1; i >= 0; i--) {
    cuadrado Aux = tubos.get(i);
    if (Aux.pos.x < -50) {
      tubos.remove(i);
    }
  }
}

void AgregarTubos() {
  float tActual = millis();
  float dt = tActual - ultimoPar;
  
  if (dt > 2500) {
    float gap = 160; 
    float altoSuperior = random(100, height - 100 - gap);
    
    tubos.add(new cuadrado(width, 0, 50, altoSuperior));
    tubos.add(new cuadrado(width, altoSuperior + gap, 50, height - (altoSuperior + gap)));
    
    ultimoPar = tActual;
  }
}

// Detectar los clics del mouse para el botón
void mousePressed() {
  if (estado == ESTADO_MENU) {
    // Si hace clic dentro de los límites del botón "Jugar"
    if (mouseX > btnX && mouseX < btnX + btnW && mouseY > btnY && mouseY < btnY + btnH) {
      initGame(); // Resetea las variables por seguridad
      estado = ESTADO_JUEGO; // Arranca la acción
    }
  }
}

void keyPressed() {
  if (key == ' ' && estado == ESTADO_JUEGO) {
    bird.saltar();
    
  }
  if ((key == 'r' || key == 'R') && estado == ESTADO_GAMEOVER) {
    initGame();
    estado = ESTADO_JUEGO;
  }
}


