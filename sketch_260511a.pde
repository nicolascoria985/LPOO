PVector pos, vel;
PImage fondo;
void setup(){
size(800,600);
pos = new PVector(width / 2, height / 2);
vel = new PVector(4,3);
fondo = loadImage("bart.jpg");
}

void draw(){
  background(fondo);
println(pos.x, pos.y);
if(pos.x >= width || pos.x <= 0){
vel.x = vel.x * -1; //asi se invierte la velodidad en x
}
if(pos.x >= height || pos.x <= 0){
vel.y = vel.y * -1; //asi se invierte la velocidad en y
}
pos.add(vel);
fill(255,255,0);
ellipse(pos.x,pos.y,random(10),15);
}
