float x, y;

void setup(){
size(800, 600);
}

void draw(){
x = width / 2;
y = height / 2;
fill(255, 0, 0);
ellipse(x, y, width / 2, height / 2);
}

//este ejercicio salio de la primera clase que tuvimos, es simplemente un circilo, pero si se cambia el tamaño de SIZE a 400, 300 (por ejemplo), se conserva la imagen perfectamente 
