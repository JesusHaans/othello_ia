TableroJP tablero;
Sensores sensor;
Actuadores actuador;
int turno = 1;
void setup(){
  size(320,320);
  //noLoop();
  tablero = new TableroJP();
  sensor = new Sensores(tablero);
  actuador = new Actuadores(tablero);
   tablero.tablero[3][3]=1;
   tablero.tablero[3][4]=2;
   tablero.tablero[4][3]=2;
   tablero.tablero[4][4]=1; 
   
   
}


void draw(){
 tablero.display();
  sensor.posiblesJugadas(turno);
}

void mousePressed(){
  //System.out.println("x: " + mouseX/40 + " Y: " + mouseY/40 + " Valor: " + tablero.tablero[mouseX/40][mouseY/40]);
  
  actuador.jugar(mouseX/40,mouseY/40, turno);
  turno = turno == 1? 2: 1;
  actuador.limpiarTablero();
  
  //tablero.display();

}
