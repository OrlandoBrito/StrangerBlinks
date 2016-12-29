import g4p_controls.*;

import gifAnimation.*;

import controlP5.*; //CREAR BOTONES, para instalar esta libreria deben ir a Sketch-Import Library...-Add library dentro seleccionar GUI como filtro,se debe seleccionar controlP5 
                    //y clic en instalar

Gif gif;
float progreso=0; //para la barra de carga del inicio
ControlP5 cp5;


Canvas inicio;
PImage fondo;
boolean principal =true;

Button blink;
Button sign;

GTextArea texto;

void setup() {
  size(560,560);
   background(#937740);
  frameRate(60);
// gif = new Gif(this, "StrangerBlinks_INICIO.gif");
//  gif.loop();
   
   cp5 = new ControlP5(this);

  
 //inicio = new INICIO();
 // inicio.pre(); // use cc.post(); to draw on top of existing controllers.
     //cp5.addCanvas(inicio); // add the canvas to cp5
  fondo = loadImage("Fondo_Principal.jpg");
   
   
   
   
}
int q=0;
int p =0;
void draw() {
  //parte de inicio
 /* if(progreso<540){
   progreso=progreso+2;
   image(gif, 0,0);
    barraCarga();
 }else{*/
  //PANTALLLA PRINCIPAL
 
  background(fondo);
  Botones();
  
   
// }
    
//  fill(244,0,0);
 // rect(430,57,90,120);
 // fill(0,255,0);
 // rect(430,210,90,120);
  
  // 
}
GButton b_setear,b_procesar,b_simular,b_ejecutar;
GButton[] btnColours = new GButton[7];
GCheckbox chb_individual, chb_todo;
void Botones(){
  if(principal==true){
     blink =  cp5.addButton("Modo_blinks")
       .setPosition(430,57)
       .setSize(90,120).setColorBackground(ControlP5.RED);
      
       sign =  cp5.addButton("Modo_signs")
       .setPosition(430,210)
       .setSize(90,120).setColorBackground(ControlP5.GRAY);
     
       texto = new GTextArea(this, 80, 57, 290, 120, G4P.SCROLLBARS_VERTICAL_ONLY | G4P.SCROLLBARS_AUTOHIDE); 
       texto.setPromptText("Escriba algo, por favor.");
       texto.setLocalColorScheme(0);
       
       b_setear = new GButton(this,160,187,50,30,"Setear");
       b_setear.tag = "b_setear";
       b_setear.setLocalColorScheme(0);
       b_procesar = new GButton(this,220,183,80,40,"Pocesar");
       b_procesar.tag = "b_procesar";
       b_procesar.setLocalColorScheme(6);
       
        b_simular = new GButton(this,110,440,150,80,"Simular");
       b_simular.tag = "b_simular";
       b_simular.setLocalColorScheme(7);
       
        b_ejecutar = new GButton(this,300,430,170,100,"EJECUTAR");
       b_ejecutar.tag = "b_ejecutar";
       b_ejecutar.setLocalColorScheme(1);
       
       for (int i = 0; i < btnColours.length; i++) {
    btnColours[i] = new GButton(this, 50, 250+ i * 20, 40, 18, "" + (i+1));
    btnColours[i].tag = "Button: " + (i+1);
    btnColours[i].setLocalColorScheme(i);
    btnColours[i].tagNo = 1000+i;
  }  
    chb_individual = new GCheckbox(this, 100, 250, 50, 20 );
    chb_individual.setOpaque(false);
     
    chb_todo = new GCheckbox(this, 100, 280, 50, 20 );
    chb_todo.setOpaque(false);
       
        principal=false;
 } 
 
  
  
}
boolean blinks=true;
void Modo_blinks(){
 if(blinks==false){
   blinks=true;
   blink.setColorBackground(ControlP5.RED); //activado
   signs=false;
   sign.setColorBackground(ControlP5.GRAY);   //desactivado signs
 }
 
  
}
boolean signs=false;
void Modo_signs(){
  if(signs==false){
     signs=true;
    sign.setColorBackground(ControlP5.RED);  //activado
    blinks=false;
    blink.setColorBackground(ControlP5.GRAY);   //desactivado blink
  }
  
}

    void barraCarga() { 
      
    fill (255,0,0);
    noStroke();
    rect(13, 400, progreso, 10);
    if(progreso==540)clear();
    
    }
  public void handleTextEvents(GEditableTextControl texto1, GEvent event) {
      
      println(texto.getTextLength(0,false));
}
  
  



void mousePressed(){
  println(mouseX);
  println(mouseY);
  q=mouseY;
  p=mouseX;
}