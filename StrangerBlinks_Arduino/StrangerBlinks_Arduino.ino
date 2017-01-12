// NeoPixel Ring simple sketch (c) 2013 Shae Erisson
// released under the GPLv3 license to match the rest of the AdaFruit NeoPixel library

#include <Adafruit_NeoPixel.h>
#ifdef __AVR__
  #include <avr/power.h>
#endif

// Which pin on the Arduino is connected to the NeoPixels?
// On a Trinket or Gemma we suggest changing this to 1
#define PIN            6

// How many NeoPixels are attached to the Arduino?
#define NUMPIXELS     37
int tamano=0;
String hola;
int modo;
String mensaje;
String color;
int  longitud;
int velocidad;
boolean ACTIVADO=false;

// When we setup the NeoPixel library, we tell it how many pixels, and which pin to use to send signals.
// Note that for older NeoPixel strips you might need to change the third parameter--see the strandtest
// example for more information on possible values.
Adafruit_NeoPixel pixels = Adafruit_NeoPixel(NUMPIXELS, PIN, NEO_GRB + NEO_KHZ800);

int delayval = 500; // delay for half a second
int  cc[7][5]={ {1,1,1,1,1},
              {1,1,1,1,1},
              {1,1,1,1,1},
              {1,1,1,1,1},
              {1,1,1,1,1},
              {1,1,1,1,1},
              {1,1,1,1,1}};
void setup() {
  Serial.begin(9600);
  pinMode(LED_BUILTIN, OUTPUT);
  // This is for Trinket 5V 16MHz, you can remove these three lines if you are not using a Trinket
#if defined (__AVR_ATtiny85__)
  if (F_CPU == 16000000) clock_prescale_set(clock_div_1);
#endif
  // End of trinket special code

  pixels.begin(); // This initializes the NeoPixel library.
  digitalWrite(LED_BUILTIN, LOW);
}
uint32_t colores [] ={pixels.Color(255,0,0,50),pixels.Color(180,0,90,50),pixels.Color(162,0,162,50),pixels.Color(3,4,162,50),pixels.Color(0,201,172,50),pixels.Color(0,255,0,50),pixels.Color(255,255,0,50),pixels.Color(255,255,255,255)};
char letra[28]={'A','B','C','D','E','F','G','H','I','J','K','L','M','N','Ñ','O','P','Q','R','S','T','U','V','W','X','Y','Z',' '};
boolean ya=false;

void loop() {
/*
int k =0;
  // For a set of NeoPixels the first NeoPixel is 0, second is 1, all the way up to the count of pixels minus one.

 
   
 for(int j=0;j<28;j++){
  boolean gh=true;
  Letras(letra[j]);
  
  for(int i=0,f=0,d=0;i<7;i++){
    do{
       gh=true;//5*i+d
       if(cc[i][f]==1){pixels.setPixelColor(d, colores[k]);}else{pixels.setPixelColor(d, pixels.Color(0,0,0));}
       if((i+1)%2==0){f--;
        if (f==-1){gh=false;f=0;} 
       }else{ f++;
        if(f==5){gh=false;f = 4;}
       }
       d++;
     
         
    }while(gh);

  }
   k++;
   if(k==8)k=0;
     pixels.show();
  delay(2000);
 }*/
  
  datos();
  
     
 /* 
   // if(mensaje.equals("ENCENDER"))digitalWrite(LED_BUILTIN, HIGH);
 if(velocidad==4)digitalWrite(LED_BUILTIN, HIGH);
 // if(mensaje.equals("APAGAR"))digitalWrite(LED_BUILTIN, LOW);
  if(velocidad==2)digitalWrite(LED_BUILTIN, LOW);*/
 Serial.println(mensaje);
  if(ACTIVADO==true){
    ///proceso de mostrar las letras
    if(modo==1){//MODO BLINKS
      
    }
    if(modo==2){//MODO SGINS
      for(int i=0;i<longitud;i++){
      
      modo_signs(mensaje[i],(int)((char)(color[i]-'0')));
      pixels.show();
      delay((velocidad+1)*250);
     
      }
    }

    
  }else{
    
  }

  
}

void modo_signs(char c, int co){
  boolean gh=true;
  Letras(c);
  for(int i=0,f=0,d=0;i<7;i++){
    do{
       gh=true;//5*i+d
       if(cc[i][f]==1){pixels.setPixelColor(d, colores[co]);}else{pixels.setPixelColor(d, pixels.Color(0,0,0));}
       if((i+1)%2==0){f--;
        if (f==-1){gh=false;f=0;} 
       }else{ f++;
        if(f==5){gh=false;f = 4;}
       }
       d++;
     
         
    }while(gh);
}

}

/*
int modo;
String mensaje;
String color;
int  longitud;
int velocidad;*/
void datos(){


if(Serial.available()>0)//Si el Arduino recibe datos a través del puerto serie
  { 
    
    hola = Serial.readString();
      longitud =(hola.length()-2)/2;
    //procesar para obtener el modo, el mensaje y los colores
 
      modo =(char) (hola[0]-'0'); //-0 para representar el valor de 0 al 9
    
      velocidad = (char) (hola[hola.length()-1]-'0');
     mensaje="";
     color="";
    
    for(int s = 0;s<longitud;s++){
        mensaje+=hola[s+1];
        color+=hola[s+longitud+1];
     }
     
      ACTIVADO=true;
    
    }
   

      
      
     
     

   /*
    int inc[hola.length()];

    for (int g=0;g<hola.length();g++){
        inc[g]=Serial.read();

        
    }
    */
    
   
      //Serial.flush();
  }
  



  
//}
