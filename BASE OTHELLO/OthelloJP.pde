import javax.swing.JOptionPane;

TableroJP tablero;
SensoresJP sensor;
ActuadoresJP actuador;
IAJP ia;

boolean puedeJugarN;
boolean puedeJugarB;
int turno = 1;
int nivel = 3;
void setup(){
  size(320,320);

   int seleccion = JOptionPane.showOptionDialog(
   null,
   "Selección de nivel", 
   "Seleccione el nivel que desea jugar",
   JOptionPane.YES_NO_CANCEL_OPTION,
   JOptionPane.QUESTION_MESSAGE,
   null,    // null para icono por defecto.
   new Object[] { "Nivel 1", "Nivel 2", "Nivel 3" },   // null para YES, NO y CANCEL
   "opcion 1");
    nivel = seleccion + 3;
    if (seleccion == -1) System.exit(0);
    
    config(nivel);
}


void draw(){
 tablero.display();
  //sensor.posiblesJugadas(turno);
}

void mousePressed(){
  int puntosN = sensor.puntajeN();//fichas negras
  int puntosB = sensor.puntajeB();//fichas blancas
  puedeJugarN = sensor.numPosiblesJugadas(1) > 0 ;//se puede jugar ficha negra?
  puedeJugarB = sensor.numPosiblesJugadas(2) > 0 ;//se puede jugar ficha blanca?
 
  if((puntosN == 0 || puntosB == 0) ||//Si uno se queda sin fichas
     (!puedeJugarN && !puedeJugarB)){//Si ya ninguno puede jugar
    String ganador = puntosN > puntosB ? "Negro" : "Blanco";
    
    //mostrando ganador
    int n = JOptionPane.showConfirmDialog(null, "Ha ganado " + ganador + "Deseas reinicar?", "Juego Terminado", JOptionPane.YES_NO_OPTION);
    if(n == 0){
      config(nivel);
    }else{
       System.exit(0);
    }
  }else{//Si hay jugadas aun
    if(puedeJugarN){//Si puede jugar fichas negras
      if(actuador.jugar(mouseX/40,mouseY/40, turno)){
        System.out.println("___________________\n Negras: " 
               + ia.puntuar(true, tablero.tablero()) + "\n Blancas: " 
               +ia.puntuar(false, tablero.tablero())  + "\n___________________\n"); 
               ia.printT("", tablero.tablero());
        
      }else{return;}
     }else{
        System.out.println("No puedes jugar :c ");//Si no hay jugadas
     }
     
     //Jugada de IA
     actuador.limpiarTablero();
     sensor.posiblesJugadas(2);
     puedeJugarB = sensor.numPosiblesJugadas(2) > 0 ;
     
     System.out.println(puedeJugarB);
     
     if(puedeJugarB){//Si puede jugar la ia
       ia = new IAJP(tablero.tablero(), new TableroJP(), nivel, "");
        tablero.ponerTablero( ia.realizarJugada(tablero.tablero(), false));
        
        
        System.out.println("RIVAL ACABA DE JUGAR "); 
        ia.printT("", tablero.tablero());
     }else{
        System.out.println("La IA no puede jugar :c ");
     }
     
     actuador.limpiarTablero();
     sensor.posiblesJugadas(turno);
      
    }
  
  }
  
  /**
  * Este método pone valores iniciales del juego
  */
  void config(int nivel){
   tablero = new TableroJP();
   sensor = new SensoresJP(tablero);
   actuador = new ActuadoresJP(tablero);
   tablero.tablero[3][3]=2;
   tablero.tablero[3][4]=1;
   tablero.tablero[4][3]=1;
   tablero.tablero[4][4]=2; 
   puedeJugarN = true;
   puedeJugarB = true;
   ia = new IAJP(tablero.tablero(), new TableroJP(), nivel, "");
   System.out.println("___________________\n Negras: " 
   + ia.puntuar(true, tablero.tablero()) + "\n Blancas: " 
   +ia.puntuar(false, tablero.tablero())  + "\n___________________\n"); 
   sensor.posiblesJugadas(turno); 
  }
