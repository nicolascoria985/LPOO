Pelota pelota;
Pared pared;

void setup() {
  size(600, 400);
  pelota = new Pelota(100, 200, 20, 5, 3);
  pared = new Pared(400, 100, 30, 200);
}

void draw() {
  background(25);

  pelota.actualizar();
  pelota.rebotarBordes();

  boolean hayColision = pared.detectarYRebotar(pelota);

  pared.mostrar(hayColision);
  pelota.mostrar(hayColision);
}


class Pelota {
  float x, y;
  float vx, vy;
  float radio;

  Pelota(float x, float y, float radio, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.radio = radio;
    this.vx = vx;
    this.vy = vy;
  }

  void actualizar() {
    x += vx;
    y += vy;
  }

  void rebotarBordes() {
    if (x - radio < 0 || x + radio > width)  vx *= -1;
    if (y - radio < 0 || y + radio > height) vy *= -1;
  }

  void mostrar(boolean impactando) {
    noStroke();
    if (impactando) {
      fill(255, 70, 70); 
    } else {
      fill(70, 180, 255); 
    }
    ellipse(x, y, radio * 2, radio * 2);
  }
}

class Pared {
  float x, y, ancho, alto;

  Pared(float x, float y, float ancho, float alto) {
    this.x = x;
    this.y = y;
    this.ancho = ancho;
    this.alto = alto;
  }

  boolean detectarYRebotar(Pelota p) {
    float cercanoX = constrain(p.x, x, x + ancho);
    float cercanoY = constrain(p.y, y, y + alto);

    float distX = p.x - cercanoX;
    float distY = p.y - cercanoY;
    float distancia = sqrt((distX * distX) + (distY * distY));

    if (distancia < p.radio) {
      p.vx *= -1;

      if (p.x < x) {
        p.x = x - p.radio;
      } else if (p.x > x + ancho) {
        p.x = x + ancho + p.radio;
      }

      return true; 
    }

    return false;
  }

  void mostrar(boolean impactando) {
    noStroke();
    if (impactando) {
      fill(255, 215, 0); 
    } else {
      fill(120); 
    }
    rect(x, y, ancho, alto);
  }
}
