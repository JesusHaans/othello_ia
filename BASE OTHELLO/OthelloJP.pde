 TableroJP tablero;
SensoresJP sensor;
ActuadoresJP actuador;
boolean puedeJugarN;
boolean puedeJugarB;
int turno = 1;
void setup(){
  size(320,320);
  //noLoop();
  tablero = new TableroJP();
  sensor = new SensoresJP(tablero);
  actuador = new ActuadoresJP(tablero);
   tablero.tablero[3][3]=1;
   tablero.tablero[3][4]=2;
   tablero.tablero[4][3]=2;
   tablero.tablero[4][4]=1; 
   puedeJugarN = true;
   puedeJugarB = true;
   System.out.println("___________________\n Negras: " + sensor.puntajeN() + "\n Blancas: " + sensor.puntajeB() + "\n___________________\n"); 
   
   
}


void draw(){
 tablero.display();
  sensor.posiblesJugadas(turno);
}

void mousePressed(){
  puedeJugarN = sensor.numPosiblesJugadas(1) > 0 ;
  puedeJugarB = sensor.numPosiblesJugadas(2) > 0 ;
  if(!puedeJugarN && !puedeJugarB){
    String ganador = sensor.puntajeN() > sensor.puntajeB() ? "Negro" : "Blanco";
    System.out.println("Ha ganado " + ganador);
  }else{
    boolean verif = turno == 1 ? puedeJugarN : puedeJugarB;
    if(verif){
      if(actuador.jugar(mouseX/40,mouseY/40, turno)){
        turno = turno == 1? 2: 1;
        actuador.limpiarTablero();
        System.out.println("___________________\n Negras: " + sensor.puntajeN() + "\n Blancas: " + sensor.puntajeB() + "\n___________________\n"); 
      }
    }else{
      System.out.println("Lo siento no puedes jugar");
      turno = turno == 1? 2: 1;
    }
  }
  //tablero.display();

}
