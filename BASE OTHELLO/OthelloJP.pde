TableroJP tablero;
void setup(){
  size(320,320);
  noLoop();
  tablero = new TableroJP();
}


void draw(){
 tablero.display();
}
