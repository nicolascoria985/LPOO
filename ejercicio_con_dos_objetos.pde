class movil{
PVector pos;
PVector vel = new PVector(1,2);
int R = 10;
movil(float x, float y){
pos = new PVector(x,y);
}

void mover(){
pos.add(vel);
}

void mostrar(){
ellipse(pos.x,pos.y, R,R);
}

void limitar(){ 
  
}
}

movil m;
movil otro;

void setup(){
  size(800,600);
  
  
  m = new movil(width/2, height/2);
  otro = new movil(100,100);
  otro.vel.x = 4;
}

void draw(){
m.mover();
m.mostrar();
otro.mover();
otro.mostrar();
}
