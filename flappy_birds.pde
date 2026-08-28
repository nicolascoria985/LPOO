ArrayList<cuadrado> tubos;
Pelota bird;
float ultimoPar = 0;
PVector g = new PVector(0, 0.2);
boolean gameOver = false; 

void setup() {
  size(600, 600);
  initGame(); 
}

void initGame() {
  tubos = new ArrayList<cuadrado>();
  bird = new Pelota(100, height / 2);
  ultimoPar = millis();
  gameOver = false;
}

void draw() {
  background(135, 206, 235);
  
  if (!gameOver) {
    AgregarTubos();
    
    bird.addFuerza(g);
    bird.mover();
    
    borrarTubos();
    

    for (cuadrado t : tubos) {
      t.mover();
      t.mostrar();
      
      if (chequearColision(bird, t)) {
        gameOver = true;
      }
    }
    
    bird.mostrar();
    
   
    if (bird.pos.y >= height || bird.pos.y <= 0) {
      gameOver = true;
    }
    
  } else {
   
    for (cuadrado t : tubos) t.mostrar();
    bird.mostrar();
    

    fill(0, 150); 
    rect(0, 0, width, height);
    
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(40);
    text("GAME OVER", width / 2, height / 2 - 20);
    textSize(20);
    text("Presioná 'R' para reiniciar", width / 2, height / 2 + 30);
  }
}


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

void keyPressed() {
  if (key == ' ' && !gameOver) {
    bird.saltar();
  }
  
  if ((key == 'r' || key == 'R') && gameOver) {
    initGame();
  }
}
