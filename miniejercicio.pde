float x, y;

void setup(){
size(600, 600);
}

void draw(){
  x = width / 2;
  y = height / 2;
for(int i = 0; i <= height; i = i + 50){
for(int j = 0; j <= width; j = j + 50){
 fill(random(255), random(255), random(255));
 rect(j, i, 50, 50);
  } 
}
if(mousePressed){
background(255, 0, 0);
fill(0);
ellipse(300, 300, 150, 200);
}
}
