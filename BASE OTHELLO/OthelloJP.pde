import javax.swing.JOptionPane;

TableroJP tablero;
SensoresJP sensor;
ActuadoresJP actuador;
IAJP ia;

boolean puedeJugarN;
boolean puedeJugarB;
int turno = 1;
void setup(){
  size(320,320);
  //noLoop();
  //tablero = new TableroJP();
  //sensor = new SensoresJP(tablero);
  //actuador = new ActuadoresJP(tablero);
  // tablero.tablero[3][3]=2;
  // tablero.tablero[3][4]=1;
  // tablero.tablero[4][3]=1;
  // tablero.tablero[4][4]=2; 
  // puedeJugarN = true;
  // puedeJugarB = true;
  // ia = new IAJP(tablero.tablero(), new TableroJP(), 3, "");
  // System.out.println("___________________\n Negras: " 
  // + ia.puntuar(true, tablero.tablero()) + "\n Blancas: " 
  // +ia.puntuar(false, tablero.tablero())  + "\n___________________\n"); 
  // sensor.posiblesJugadas(turno);
   config();
   
}


void draw(){
 tablero.display();
  //sensor.posiblesJugadas(turno);
}

void mousePressed(){
  int puntosN = sensor.puntajeN();
  int puntosB = sensor.puntajeB();
  puedeJugarN = sensor.numPosiblesJugadas(1) > 0 ;
  puedeJugarB = sensor.numPosiblesJugadas(2) > 0 ;
  if((puntosN == 0 || puntosB == 0) ||
     (!puedeJugarN && !puedeJugarB)){
    String ganador = puntosN > puntosB ? "Negro" : "Blanco";
    //System.out.println("Ha ganado " + ganador);
    int n = JOptionPane.showConfirmDialog(null, "Ha ganado " + ganador + "Deseas reinicar?", "Juego Terminado", JOptionPane.YES_NO_OPTION);
    if(n == 0){
      config();
    }else{
       System.exit(0);
    }
  }else{
    if(puedeJugarN){
      if(actuador.jugar(mouseX/40,mouseY/40, turno)){
        System.out.println("___________________\n Negras: " 
               + ia.puntuar(true, tablero.tablero()) + "\n Blancas: " 
               +ia.puntuar(false, tablero.tablero())  + "\n___________________\n"); 
               ia.printT("", tablero.tablero());
        //turno = turno == 1? 2: 1;
        
      }
     }else{
        System.out.println("No puedes jugar :c ");
     }
     actuador.limpiarTablero();
     sensor.posiblesJugadas(2);
     puedeJugarB = sensor.numPosiblesJugadas(2) > 0 ;
     System.out.println(puedeJugarB);
     
     if(puedeJugarB){
       ia = new IAJP(tablero.tablero(), new TableroJP(), 3, "");
        tablero.ponerTablero( ia.realizarJugada(tablero.tablero(), false));
        
        
        System.out.println("RIVAL ACABA DE JUGAR "); 
        ia.printT("", tablero.tablero());
     }else{
        System.out.println("La IA no puede jugar :c ");
     }
     
     actuador.limpiarTablero();
     sensor.posiblesJugadas(turno);
      
    }
    if((puntosN == 0 || puntosB == 0) ||
     (!puedeJugarN && !puedeJugarB)){
    String ganador = puntosN > puntosB ? "Negro" : "Blanco";
    //System.out.println("Ha ganado " + ganador);
    int n = JOptionPane.showConfirmDialog(null, "Ha ganado " + ganador + "Deseas reinicar?", "Juego Terminado", JOptionPane.YES_NO_OPTION);
    if(n == 0){
      config();
    }else{
       System.exit(0);
    }
  }
  }
  
  void config(){
   tablero = new TableroJP();
   sensor = new SensoresJP(tablero);
   actuador = new ActuadoresJP(tablero);
   tablero.tablero[3][3]=2;
   tablero.tablero[3][4]=1;
   tablero.tablero[4][3]=1;
   tablero.tablero[4][4]=2; 
   puedeJugarN = true;
   puedeJugarB = true;
   ia = new IAJP(tablero.tablero(), new TableroJP(), 3, "");
   System.out.println("___________________\n Negras: " 
   + ia.puntuar(true, tablero.tablero()) + "\n Blancas: " 
   +ia.puntuar(false, tablero.tablero())  + "\n___________________\n"); 
   sensor.posiblesJugadas(turno); 
  }
