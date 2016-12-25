import gifAnimation.*;

import controlP5.*; //CREAR BOTONES, para instalar esta libreria deben ir a Sketch-Import Library...-Add library dentro seleccionar GUI como filtro,se debe seleccionar controlP5 
                    //y clic en instalar

Gif gif;
float progreso=0; //para la barra de carga del inicio
ControlP5 cp5;
Canvas inicio;
PImage fondo;
void setup() {
  size(560,560);
 background(#937740);
  frameRate(30);
  gif = new Gif(this, "StrangerBlinks_INICIO.gif");
  gif.loop();
   
   cp5 = new ControlP5(this);
   
  
inicio = new INICIO();
inicio.pre(); // use cc.post(); to draw on top of existing controllers.
 cp5.addCanvas(inicio); // add the canvas to cp5
   fondo = loadImage("Fondo_Principal.jpg");
}
int q=0;
int p =0;
void draw() {
  
  background(fondo);
//  fill(244,0,0);
 // rect(430,57,90,120);
 // fill(0,255,0);
 // rect(430,210,90,120);
  
  // 
}

//Muestra la ventana de inicio, el giff con el logo, la barra de progreso y conecta con el arduino
class INICIO extends Canvas{
  
  public void setup(PGraphics pg) {
    
  }
  public void draw(PGraphics pg) {
    if(progreso<540){
    progreso=progreso+2;
    image(gif, 0,0);
     barraCarga();
     
    }else{noLoop();}
    println("hola");
  }
    void barraCarga() { 
      
    fill (255,0,0);
    noStroke();
    rect(13, 400, progreso, 10);
    if(progreso==540)clear();
}
  
  
  
}


void mousePressed(){
  println(mouseX);
  println(mouseY);
  q=mouseY;
  p=mouseX;
}