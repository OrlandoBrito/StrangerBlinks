import g4p_controls.*;

import gifAnimation.*;

import controlP5.*; //CREAR BOTONES, para instalar esta libreria deben ir a Sketch-Import Library...-Add library dentro seleccionar GUI como filtro,se debe seleccionar controlP5 
                    //y clic en instalar
import  java.awt.font.TextAttribute;
import java.awt.Font;
import java.awt.font.TextAttribute;
import java.awt.Color;

Gif gif;
float progreso=0; //para la barra de carga del inicio
ControlP5 cp5;


Canvas inicio;
PImage fondo,fondo_simulacion;
boolean principal =true;

Button blink;
Button sign;
PFont fd;
GTextArea texto;

void setup() {
  size(560,560);
     
   background(#937740);
  frameRate(60);
 gif = new Gif(this, "StrangerBlinks_INICIO.gif");
  gif.loop();
   
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
  /*if(progreso<540){
   progreso=progreso+2;
   image(gif, 0,0);
    barraCarga();
 }else{*/
  //PANTALLLA PRINCIPAL

  background(fondo);
  Botones();
 
 //}
 //  println("mmm "+ A[2]);
    
//  fill(244,0,0);
 // rect(430,57,90,120);
 // fill(0,255,0);
 // rect(430,210,90,120);
  
  // 
}

GButton[] btnColours = new GButton[8];
GToggleGroup configuracion;
GOption      general,individual;
GCustomSlider velocidad;
int opcionConf=0;
PGraphics pg,pg_simu;
GSketchPad spad,spad_simu;
GLabel label;
GToggleGroup tg;


color[] col= new color[8];
       



void Botones(){
  if(principal==true){
     blink =  cp5.addButton("Modo_blinks")
       .setPosition(430,57)
       .setSize(90,120).setColorBackground(ControlP5.RED);
      
       sign =  cp5.addButton("Modo_signs")
       .setPosition(430,210)
       .setSize(90,120).setColorBackground(ControlP5.GRAY);
     
     
     //Para modificar la entrada de datos, ir a la linea 808 de GTextArea y modificar el if
       texto = new GTextArea(this, 60, 57, 345, 120, G4P.SCROLLBARS_VERTICAL_ONLY | G4P.SCROLLBARS_AUTOHIDE); 
       texto.setPromptText("Escriba algo, por favor.");
       texto.setLocalColorScheme(0);
        texto.setFont(new Font("Arial",Font.PLAIN,20));
       texto.setOpaque(false);//para mostrar el fondo
       
       b_setear = new GButton(this,160,187,50,30,"Setear");
       b_setear.tag = "b_setear";
       b_setear.setLocalColorScheme(0);
       b_procesar = new GButton(this,220,183,80,40,"Procesar");
       b_procesar.tag = "b_procesar";
       b_procesar.setLocalColorScheme(6);
       
        b_simular = new GButton(this,110,440,150,80,"Simular");
       b_simular.tag = "b_simular";
       b_simular.setLocalColorScheme(7);
       
        b_ejecutar = new GButton(this,300,430,170,100,"EJECUTAR");
       b_ejecutar.tag = "b_ejecutar";
       b_ejecutar.setLocalColorScheme(1);
       
       int p=35;
       col[0] = color(255,0,0);         //ROJO 
       col[1] = color(255,0,255);        //VIOLETA 
       col[2] = color(150,0,255);//PURPURA
       col[3] = color(20,0,255);  //AZUL
       col[4] = color(0,255,200); //TURQUESA
       col[5] = color(0,255,0);  //VERDE
       col[6] = color(255,255,0); //AMARILLO
       col[7] = color(255,255,255); //BLANCO
       for (int i = 0; i < btnColours.length; i++) {
      btnColours[i] = new GButton(this, 68+p, 265+ i * 20, 40, 18, "" );
      btnColours[i].tag = "Button: " + (i+1);
      GCScheme.makeColorSchemes(this);
      GCScheme.copyPalette(G4P.RED_SCHEME, 8+i);
      GCScheme.changePaletteColor(8+i,4 ,col[i]);
      btnColours[i].setLocalColorScheme(8+i);
      btnColours[i].tagNo = 1000+i;
  }  
    
    configuracion = new GToggleGroup();
   
    general = new GOption(this, 85, 242,75, 20, "General");
    general.setOpaque(true);
    
     individual = new GOption (this, 85, 225, 75, 20, "Indvidual");
     individual.setOpaque(true);
     
    tg = new GToggleGroup();
    tg.addControls(general,individual);
    general.setSelected(true);
   
   String[] velo = new String[] {
    "250", "500", "750", "1000", "1250"
  };
  
   label = new GLabel(this, 5, 205, 80, 20,"VELOCIDAD");
   
   velocidad = new GCustomSlider(this, 5,415, 190, 70, "purple18px");
   velocidad.setShowDecor(false, true, true,true);
   velocidad.setRotation(-PI/2);
   
   velocidad.setTickLabels(velo);
   velocidad.setNbrTicks(5); 
   ;
   velocidad.setStickToTicks(true);
    //crea las letras para configurar el collor
    //G4P_Sketchpad
   pg = createGraphics(200, 160, JAVA2D);    
   spad = new GSketchPad(this, 190, 230, 150, 150);
      spad.setGraphic(pg);
      clearGraphic();
      
      
      b_anterior = new GButton(this,200,385,50,30,"<<");
      b_anterior.tag = "b_anterior";
      b_anterior.setLocalColorScheme(0);
      b_siguiente = new GButton(this,282,385,50,30,">>");
      b_siguiente.tag = "b_siguiente";
      b_siguiente.setLocalColorScheme(0);
      
     principal=false;
     
  }
  // println( velocidad.getValueI()); //obtiene el valor de velocidad de 0 - 4 = 250,500,750,1000,1250
   if(mensaje!=null){  
   if(d==0)  b_anterior.setLocalColorScheme(0); else b_anterior.setLocalColorScheme(5);
   if(d==mensaje.length-1) b_siguiente.setLocalColorScheme(0); else  b_siguiente.setLocalColorScheme(5);
   }else b_siguiente.setLocalColorScheme(0);
   
   //señal de colores 
   fill(222,222,222);
   rect(99, 263+ colores * 20, 46, 20);
   
} 

////////
char[]   mensaje;
int d = 0; //posicion del mensaje
color[]  charCol;
///////
int colores = 3;
GButton b_setear,b_procesar,b_simular,b_ejecutar,b_siguiente,b_anterior;

 public void handleButtonEvents(GButton button, GEvent event) {
   if(button==b_simular &&event == GEvent.CLICKED && mensaje!=null)Simulacion();
    if(button==b_setear &&event == GEvent.CLICKED) {texto.setText("");d=0; mensaje=null; charCol=null;clearGraphic();}
    
    //convierte en char el texto puesto en texto
    if(button==b_procesar &&event == GEvent.CLICKED &&texto.getText()!= " " ){
              d=0;
              mensaje = texto.getText().toCharArray();
              //creo todo con el color por defecto
              
              matriz_defecto(mensaje);
              clearGraphic();
              updateGraphic(mensaje[d],charCol[d]);
              general.setSelected(true);
              
             // println("tamano"+texto.getText()+"dfd");
    }
    
    
    
     //RECORRER LA MATRIZ DE LETRA
      if(button==b_siguiente &&event == GEvent.CLICKED&&mensaje!=null){
        if(d<mensaje.length-1){
              
           d++;
           clearGraphic();
           updateGraphic(mensaje[d],charCol[d]);
          
         }
        
      }
       if(button==b_anterior &&event == GEvent.CLICKED&&mensaje!=null){
         if(d>0){
           
              d--;
              clearGraphic();
              updateGraphic(mensaje[d],charCol[d]);
             
           
         }
         
       }
         if (button.tagNo >= 1000)
         { 
           colores = button.tagNo-1000;
           if(mensaje!=null) 
           {   
               if(general.isSelected()==true)
               {
               matriz_defecto(mensaje);
               clearGraphic();
               updateGraphic(mensaje[d],charCol[d]);
               }else
               {
                  charCol[d]=col[colores];
                  clearGraphic();
                  updateGraphic(mensaje[d],charCol[d]);
               }
               
           }
         } 
 }
 
 ///llenar la matriz con el color por defecto y crearla
 public void matriz_defecto(char[] tex)
 {
     charCol = new color[tex.length];
     for (int i=0;i< charCol.length;i++){
        charCol[i] = col[colores];
      }
   
 }
 
 public int Velocidad()
 {
   int r=500;
   switch(velocidad.getValueI()){
     case 0: r= 250; break;
     case 1: r= 500; break;
     case 2: r= 750; break;
     case 3: r= 1000; break;
     case 4: r= 1250; break;
   }
   return r;
 }
 /////////////////////////////////////////////////////////////
 //////////////////////SIMULACION
 ////////////////////////////////////////////////////////////
 
 
 
 GWindow simulacion;
 public void Simulacion(){
    e=0;
    tiempo_act=-250;//para que inicie más rapido
    espera = Velocidad();
     simulacion =   GWindow.getWindow(this, "StrangerBlinks: Simulación", 120, 120, 560,373, JAVA2D);
      simulacion.addDrawHandler(this, "simulacionDraw");
      fondo_simulacion=loadImage("simulacion_fondo.jpg");
      println("");
       pg_simu = createGraphics(200, 160, JAVA2D);    
       spad_simu = new GSketchPad(simulacion, 300, 10, 250, 300);
       spad_simu.setGraphic(pg_simu);
       simulacion.setActionOnClose(GWindow.CLOSE_WINDOW);
 }

int tiempo;
int tiempo_act;
int espera;
int e=0;
 public void simulacionDraw(PApplet appc, GWinData data) {
 
 
     appc.background(fondo_simulacion);
     tiempo =simulacion.millis();
     
     if(tiempo>tiempo_act+espera && e<mensaje.length){
       borrar_simu();
       
       letra_simu(mensaje[e],charCol[e]);
        e++;
       tiempo_act=tiempo;
       println("hola" + e);
     }
     
     
        
    
}  

public void letra_simu(char c,color co){
  pg_simu.beginDraw();

  for(int i=0;i<7;i++){
    for(int j=0;j<5;j++){
      int [][] cc = Letras(c);
      if(cc[i][j]==1) pg_simu.fill(co); 
       else pg_simu.fill(190,190,190,100);
     
        pg_simu.rect(20+35*j,6+22*i,20,18);
    
    }
  }
    pg_simu.endDraw();
  
}
 public void borrar_simu(){
   
    pg_simu.beginDraw();
     pg_simu.background(67,37,5,150);
     pg_simu.noFill();
    pg_simu.ellipseMode(CORNERS);
    pg_simu.endDraw();
   
 }
 

 
  
 void updateGraphic(char c,color co) {

  pg.beginDraw();

  for(int i=0;i<7;i++){
    for(int j=0;j<5;j++){
      int [][] cc = Letras(c);
      if(cc[i][j]==1) pg.fill(co); 
       else pg.fill(190,190,190,100);
     
        pg.rect(20+35*j,6+22*i,20,18);
    
    }
  }
    pg.endDraw();
}
 
 
 
 void clearGraphic() {
  pg.beginDraw();
  pg.background(167,2,2,100);
  pg.noFill();
  pg.ellipseMode(CORNERS);
  pg.endDraw();
}

 
  public void handleToggleControlEvents(GToggleControl checkbox, GEvent event) {
      //0=individua, 1=total
      opcionConf = checkbox.tagNo % 9000;
      //ejemplo en G4P_Dialogs
      
    
      
  
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
    




void mousePressed(){
  println("click");
  /*println(mouseX);
  println(mouseY);
  q=mouseY;
  p=mouseX;*/
}