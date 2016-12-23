import gifAnimation.*;

import controlP5.*; //CREAR BOTONES, para instalar esta libreria deben ir a Sketch-Import Library...-Add library dentro seleccionar GUI como filtro,se debe seleccionar controlP5 
                    //y clic en instalar

Gif gif;
void setup() {
  size(560,560);
  background(0);
   //frameRate(0);
   gif = new Gif(this, "StrangerBlinks_INICIO.gif");
   gif.loop();
}

void draw() {

 image(gif, 0,0);
}