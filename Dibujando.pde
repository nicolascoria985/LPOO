void setup(){
size(800, 600);
}

void draw(){
if(mousePressed){
line(mouseX,mouseY,pmouseX,pmouseY);
}

println("pos actual:", mouseX, mouseY,
        "pos actual:", pmouseX, pmouseY);
}
