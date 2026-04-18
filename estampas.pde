void setup(){
size(600, 600);
background(255);
}

void draw(){
if(mousePressed){
estampa(mouseX, mouseY, height / 2, width / 2);
}
}

void estampa(float x, float y, float h, float w){
fill(0, 170, 228);
rect(x, y, 50, 25);
fill(255);
rect(x, y + 25, 50, 25);
fill(0, 170, 228);
rect(x, y + 50, 50, 25);
fill(255, 255, 0);
circle(x + 25, y + 25, 25);
}
