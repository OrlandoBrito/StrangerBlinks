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
    
//  fill(244,0,0);
 // rect(430,57,90,120);
 // fill(0,255,0);
 // rect(430,210,90,120);
  
  // 
}
GButton b_setear,b_procesar,b_simular,b_ejecutar,b_siguiente,b_anterior;
GButton[] btnColours = new GButton[7];
GToggleGroup configuracion;
GOption[]    conf;
GCustomSlider velocidad;
int opcionConf=0;
PGraphics pg;
GSketchPad spad;
GLabel label;

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
       for (int i = 0; i < btnColours.length; i++) {
    btnColours[i] = new GButton(this, 68+p, 270+ i * 20, 40, 18, "" + (i+1));
    btnColours[i].tag = "Button: " + (i+1);
    btnColours[i].setLocalColorScheme(i);
    btnColours[i].tagNo = 1000+i;
  }  
    
    configuracion = new GToggleGroup();
    conf = new GOption[2];
    
    conf[0] = new GOption(this, 50+p, 230, 75, 20 );
    conf[0].setText("Individual");
    conf[0].tagNo = 9000;
    conf[0].setOpaque(true);
    
    conf[0].setAlpha(225);
    configuracion.addControl(conf[0]);
    
    conf[1] = new GOption( this, 50+p, 247,75, 20);
    conf[1].setText("Total");
    conf[1].tagNo = 9001;
    conf[1].setOpaque(true);
     conf[1].setAlpha(225);
    configuracion.addControl(conf[1]);
   
   String[] velo = new String[] {
    "250", "500", "750", "1000", "1250"
  };
  
   label = new GLabel(this, 5, 205, 80, 20,"VELOCIDAD");
   
   velocidad = new GCustomSlider(this, 5,415, 190, 70, "green_red20px");
   velocidad.setShowDecor(false, true, false, false);
   velocidad.setRotation(-PI/2);
   velocidad.setTickLabels(velo);
    
    //crea las letras para configurar el collor
    //G4P_Sketchpad
   pg = createGraphics(200, 160, JAVA2D);    
   spad = new GSketchPad(this, 190, 230, 150, 150);
      spad.setGraphic(pg);
      clearGraphic();
      updateGraphic();
      
      b_anterior = new GButton(this,200,385,50,30,"<<");
      b_anterior.tag = "b_anterior";
      b_anterior.setLocalColorScheme(5);
      b_siguiente = new GButton(this,282,385,50,30,">>");
      b_siguiente.tag = "b_siguiente";
      b_siguiente.setLocalColorScheme(5);
      
     principal=false;
     
  }
 } 
 public void handleButtonEvents(GButton button, GEvent event) {
   if(button==b_simular &&event == GEvent.CLICKED)Simulacion();
                             
   
  
 }
 
 GWindow simulacion;
 public void Simulacion(){
     simulacion =   GWindow.getWindow(this, "StrangerBlinks: Simulación", 120, 120, 300, 300, JAVA2D);
      simulacion.addDrawHandler(this, "simulacionDraw");
 }
 public void simulacionDraw(PApplet appc, GWinData data) {
 
         appc.background(167,2,2);
  
  
}  
 void updateGraphic() {
 
  pg.beginDraw();
  for(int i=0;i<7;i++){
    for(int j=0;j<5;j++){
        pg.fill(125);
        pg.rect(9+40*j,6+22*i,20,15);
    }
    
  }
    pg.endDraw();
}
 
 
 
 void clearGraphic() {
  pg.beginDraw();
  pg.background(167,2,2,180);
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
    String tes;
public void handleTextEvents(GEditableTextControl textControl, GEvent event) { 
  //displayEvent(textControl.tag, event);
  tes = texto.getText();
   if(tes.length()>6) { texto.setText(tes);  }
    println(tes);
}
  



void mousePressed(){
  /*println(mouseX);
  println(mouseY);
  q=mouseY;
  p=mouseX;*/
}