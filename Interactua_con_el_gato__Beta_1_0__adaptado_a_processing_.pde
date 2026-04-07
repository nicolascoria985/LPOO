boolean figuraVisible = false;
boolean sonrisa_de_gato = true;
boolean mensaje = false;
boolean corazon = false;
boolean corazon2 = false;

float x = 0;
float y = 0;
float speed = 3;
float speed2 = 0.5;

void setup(){ 
  size(400,400);
  background(255);
  strokeWeight(2);
  noFill();
} 

void draw() {
   background(120,123,252);
   pushMatrix(); // primer push
   rotate(PI/4);
   fill(255);
   ellipse(290,190,200,50);
   popMatrix();
   
   fill(255); 
   ellipse(200,320,200,200); // circle en p5.js → ellipse en Processing
   fill(0); 
   ellipse(200,250,150,150); 
   fill(255); 
   ellipse(200,190,205,205); 
   triangle(50,50,150,100,100,175);
   triangle(width-50,50,width-150,100,width-100,175);
   ellipse(140,150,50,70);
   ellipse(width-140,150,50,70);
   
   fill(0);
   ellipse(140,163,25,45);
   ellipse(width-140,163,25,45);
   
   if (sonrisa_de_gato){
     fill(255);
     ellipse(270,375,40,150);
     ellipse(width-270,375,40,150);
     fill(0);
     rect(255,380,3,20);
     rect(280,380,3,20);
     rect(width-260,380,3,20);
     rect(width-285,380,3,20);
     ellipse(180,220,43,43);
     ellipse(width-180,220,43,43);
   }
   
   fill(255);
   ellipse(180,210,42,42);
   ellipse(width-180,210,42,42);
   fill(0);
   ellipse(200,210,40,20);
   
   fill(255,192,203); 
   triangle(0.9*50,50,0.9*150,100,100,0.8*175); 
   triangle(width-0.9*50,50,width-0.9*150,100,width-100,0.8*175);
   
   fill(255,192,203);
   ellipse(200,360,69,69);
   
   fill(255,255,0);
   ellipse(200,310,30,30);
   
   fill(255,192,203);
   rect(x, 1, 400, 400);
   x += speed;
   y += speed2;
   
   fill(0);
   text("INTERACT WITH YOUR CAT", width / y, height / y);
   
   if (mousePressed) {
     float d = dist(pmouseX, pmouseY, mouseX, mouseY);
     float alpha = map(d, 0, 200, 200, 0); 
     stroke(0, 0, 0, alpha); 
     line(pmouseX, pmouseY, mouseX, mouseY);
     
     if (figuraVisible){
       fill(255);
       pushMatrix();
       rotate(PI/-28);
       ellipse(60,240,40,150);
       popMatrix();
       
       pushMatrix();
       rotate(PI/28);
       ellipse(width-60,200,40,150);
       popMatrix();
       
       ellipse(140,150,50,70);
       ellipse(width-140,150,50,70);
       
       fill(0);
       translate(125,180);
       scale(0.5);
       triangle(200,100,100,100,150,200);
       
       if (mensaje){
         scale(3);
         text("g r a c i a s :3", 20,-75);
         
         if (corazon){
           pushMatrix();
           rotate(PI/8);
           fill(255,0,0);
           ellipse(20,-118,15,40);
           popMatrix();
           
           if (corazon2){
             pushMatrix();
             rotate(PI/-8);
             fill(255,0,0);
             ellipse(85,-75,15,40);
             popMatrix();
           }    
         }
       }
     }
   }  
}

void mousePressed(){
  figuraVisible = true;
  sonrisa_de_gato = false;
  mensaje = true;
  corazon = true;
  corazon2 = true;
}

void mouseReleased(){
  figuraVisible = false;
  sonrisa_de_gato = true;
  mensaje = false;
  corazon = false;
  corazon2 = false;
}
//esta es una version "beta" de este juego, la idea era hacer una gato interactivo para el usuario, en futuras versiones voy a arreglar lo de las variables fijas y voy a hacerlo mas divertido
