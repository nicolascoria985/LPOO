

void setup(){
size(900,400);
background(120);
}

void draw(){
int w = width;
int h = height;
stroke(0, 20);
line(mouseX,mouseY, 0 , 0);
line(mouseX,mouseY, w , 0);
line(mouseX,mouseY, 0 , h);
line(mouseX,mouseY, w , h);
/*
println("apoco");
*/
}
