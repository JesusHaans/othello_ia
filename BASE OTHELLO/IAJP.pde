import java.util.List;
import java.util.ArrayList;
import java.util.Iterator;

class IAJP{

  //Variables locales 
  String nombre = "IA";   //Nombre de la IA
  boolean turno;          //Turno que juega la IA
  int[][] mundo;          //Tablero actual
  TableroJP tablero;            //Ejemplar de tablero para las funciones necesarias
  int deep;         //Profundidad del árbbol.
  double heuristica = Double.POSITIVE_INFINITY; //Valor heurístico iinicial.
  ArbolJP arbol;
  SensoresJP sensor;
  ActuadoresJP actuador;
  
  //Constructor para la Inteligencia
  IAJP(int[][] mundo, TableroJP tab, int deep, String nom){
    //Implementar
    this.mundo = mundo;
    this.tablero = tab;
    this.tablero.ponerTablero(copyMatrix(this.mundo));
    sensor = new SensoresJP(this.tablero);
    actuador = new ActuadoresJP(this.tablero);
    this.deep = deep;
    this.nombre = nom;
    turno = false;
  }
  
  /**
   * Método para realizar una tirada automática
   * Recibe una matriz del tablero actual y el turno que le toca jugar.
   * Devuelve una matriz del tablero con la jugada realizada.
   */
  int[][] realizarJugada(int[][] mundo, boolean turn){
    this.turno = turn;
    tablero.ponerTablero(mundo);
    return dondeTirar(turn);
  }
  
  /**
   * Asigna el mundo a la IA
   */
  void setMundo(int[][] mundo){
    this.mundo = mundo;
  }
  
  /**
   * Método para buscar todas las posibles jugadas para un turno específico
   */
  void buscarJugadas(int[][] world, boolean turn){
    tablero.ponerTablero(world);//Ponemos el arreglo que representa el mundo en nuestro objeto tablero para uso de sensores y actuadores
    sensor.posiblesJugadas(turno(turn));//Una vez que actualizamos el tablero, usamos el sensor para poner las posibles jugadas
    //Recordar que las posibles jugadas se marcan con el valor = turno + 2
  }
  
  /**
   * Método que construye el árbol de estados
   * Deberán usar aquí su implementación de árboles.
   */
  void crearArbol(boolean turn){
    iniciarArbol();//iniciamos la estructura
    crearRamas(arbol.raiz(), deep, turn);//Comenzamos a abrir las ramas sobre la estructura que creamos
    
  }
  
  /**
   * Método que inicializa el árbol
   * Deberán usar aquí su implementación de árboles.
   */
  void iniciarArbol(){
    buscarJugadas(copyMatrix(mundo), turno );//Buscamos las jugadas para el nodo donde iniciamos el arbol (el tablero actual)
    arbol = new ArbolJP(new NodoJP(null, new TableroJP(copyMatrix(tablero.tablero()))));//iniciamos la estructura del árbol
  }

  /**
   * Método que crea todas las ramas del árbol
   */
  void crearRamas(NodoJP nodo, int profun, boolean turn){   
    if(profun > 0){//la profundidad va bajando, si ya es cero, terminamos de desplegar el árbol
      /*
        Revisamos nuestro tablero actual que debe estar actualizado con las posibles jugadas
        Si encontramos una posible jugada (turno + 2) entonces creamos un Nodo
        al terminar de hacer los nodos para un tablero, hacemos recursión para cada nuevo nodo si aún podemos
      */
      for(int i = 0; i<8; i++){
        for(int j = 0; j<8; j++){
          //Revisión de casilla
          if(nodo.tablero().ficha(i,j) == turno(turn) + 2){//si esta casilla es una posible jugada
            tablero.ponerTablero(copyMatrix(nodo.tablero().tablero()));
            //Adición de un nodo
            actuador.jugar(i, j, turno(turn));//jugamos esa jugada para hacer un nodo
            TableroJP tableroHijo = new TableroJP(copyMatrix(tablero.tablero()));//Creamos el objeto Tablero para el Nodo con la copia del mundo con su jugada
            NodoJP hijo = new NodoJP(nodo, tableroHijo );//Creamos el objeto Nodo con su tablero e indicando el padre
            nodo.agregarHijo(hijo);// Agregamos el nuevo nodo a los hijos del nodo actual
            
            //Reset del tablero para usar sensores y actuadores con el nodo actual(padre)
            
            actuador.limpiarTablero();
            buscarJugadas(tablero.tablero(), turn);//regresamos el tablero al tablero con las posibles jugadas del nodo actual(padre)
          }
        }
      }
      
      //Terminamos agregando las posibles jugadas del nodo actual (padre)
      //Así que recorremos a todos los nuevos hijos generados para expandir el árbol
      for(int i = 0; i < nodo.hijos().size(); i++){
        NodoJP hijo = (NodoJP) nodo.hijos().get(i);//obtenemos un hijo i
        tablero.ponerTablero(hijo.tablero().tablero());//Asignamos su tablero al tablero actual para usar sensores y actuadores
        buscarJugadas(tablero.tablero(), !turn);//Buscamos las posibles jugadas, consideremos que cambiamos de turno
        crearRamas(hijo, profun - 1, !turn);//Expandimos el arbol con sus posibles jugadas
      }
    }
  }  
  
  
  
  double minimax(NodoJP nodo, int profundidad, boolean MinMax) {        
    //SE IMPLEMENTARÁ REGRESANDO DE VACACIONES NO SE PREOCUPEN
    double valor = 0.0;
    if(profundidad == 0 || nodo.esHoja(MinMax) ){
     // return valorHeuri(nodo.tablero().tablero(),MinMax);
     return heuristicaEsquinas(MinMax, nodo.tablero().tablero());
    }
    if(MinMax){
      valor = Double.NEGATIVE_INFINITY;
      List hijos = nodo.hijos();
      Iterator it = hijos.iterator();
      profundidad = profundidad - 1;
      while(it.hasNext()){
        NodoJP hijo = (NodoJP)it.next();
        valor = Max(valor, minimax(hijo, profundidad, !MinMax));
      }
      return valor;
    }else{
      valor = Double.POSITIVE_INFINITY;
      List hijos = nodo.hijos();
      Iterator it = hijos.iterator();
      profundidad = profundidad - 1;
      while(it.hasNext()){
        NodoJP hijo = (NodoJP)it.next();
        valor = Min (valor, minimax(hijo, profundidad, !MinMax));
      }
      return valor;
    }
  }

  /**
   * Método para visualizar en consola un tablero
   */
  void printT(String tex, int[][] mun){
    String arr = tex;
    for(int i = 0; i<8; i++){
      for(int j = 0; j<8; j++){
        arr += mun[j][i] + " ";      
      }
      arr += "\n";
    }
    println(arr);
  }
  
  /**
   * Método que copia una matriz en otra sin vincular las direcciones en memoria.
   */
  int[][] copyMatrix(int[][] world){
    int [][] newWorld = new int[world.length][];
    for(int i = 0; i < world.length; i++){
      int[] aWorld = world[i];
      int   aLength = aWorld.length;
      newWorld[i] = new int[aLength];
      System.arraycopy(aWorld, 0, newWorld[i], 0, aLength);
    }
    return newWorld;
  }

  /**
    * Método que determina el maximo entre dos flotantes.
    */    
  double Max(double uno, double dos){
    //SE IMPLEMENTARÁ RERGESANDO DE VACACIONES
    if(uno > dos){
      return uno;
    }else{
      return dos;    
    }
  } 

  /**
    * Método que determina el minino entre dos flotantes.
    */
  double Min(double uno, double dos) {
    //SE IMPLEMENTARÁ RERGESANDO DE VACACIONES
    if(uno > dos){
      return dos;
    }else{
      return uno;    
    }
  }

  /**
    * Método que determina el valor heurístico de un tablero.
    */    
  double valorHeuri(int[][] tablero, boolean turn){
    //SE IMPLEMENTARÁ RERGESANDO DE VACACIONES
    int fichasRival = 0;
    int fichasMias = 0;
    int turnoRival = turno(turno) == 1 ? 2 : 1;
    if(turn == true){
      int i = 0;
      int j = 0;
      while(i<8){
        while(j<8){
          if(tablero[i][j] == turno(this.turno)){
            fichasMias = fichasMias+1;
          }
          if(tablero[i][j] == turnoRival){
            fichasMias = fichasRival+1;
          }
        }
      }
      return fichasMias - fichasRival;
    }else{
      int i = 0;
      int j = 0;
      while(i<8){
        while(j<8){
          if(tablero[i][j] == turno(this.turno)){
            fichasMias = fichasMias+1;
          }
          if(tablero[i][j] == turnoRival){
            fichasMias = fichasRival+1;
          }
        }
      }
      return fichasRival - fichasMias;
    }
  } 

 /**
  * Heurística basada en la conquista de las esquinas
  */
 int heuristicaEsquinas(boolean turno, int[][] mundoActual){
    int puntuacionNegro = puntuar(turno, mundoActual);
    int puntuacionBlanco = puntuar(!turno, mundoActual);
    //return puntuacionActual;
    return turno ? 
           puntuacionNegro - puntuacionBlanco
           : puntuacionBlanco - puntuacionNegro;
  }
  
 /**
  * Este método nos da una puntuación del tablero dado, con la técnica de conquistar esquinas.
  */
  int puntuar(boolean turno, int[][] mundoActual){
  int puntuacion = 0;
  int turnoActual = turno(turno);
  for(int i = 0; i < 8 ; i++){
    for(int j = 0; j < 8; j++){
      if(mundoActual[i][j] == turnoActual){
        //Si es una esquina
        if((i == 0 && j == 0)||
           (i == 0 && j == 7)||
           (i == 7 && j == 0)||
           (i == 7 && j == 7)){
             puntuacion += 100000000;
        }else{
          //Si rodea a una esquina
        if((i == 1 && j == 0) || (i == 1 && j == 1) || (i == 0 && j == 1) ||
           (i == 6 && j == 0) || (i == 6 && j == 1) || (i == 6 && j == 1) ||
           (i == 1 && j == 7) || (i == 1 && j == 6) || (i == 0 && j == 6) ||
           (i == 6 && j == 7) || (i == 6 && j == 6) || (i == 7 && j == 6) ){
             puntuacion += 0;
       }else{
         //Si rodea el borde de la esquina
       if((i == 2 && ( j == 0 || j == 1 || j == 2)) || (j == 2 && (i == 0 || i == 1))||
          (i == 5 && ( j == 0 || j == 1 || j == 2)) || (j == 2 && (i == 6 || i == 7))||
          (i == 2 && ( j == 7 || j == 6 || j == 5)) || (j == 5 && (i == 0 || i == 1))||
          (i == 5 && ( j == 7 || j == 6 || j == 5)) || (j == 5 && (i == 6 || i == 7))){
            puntuacion += 100000;
       }else{
         if(mundoActual[i][j] == 3 || mundoActual[i][j] == 4){
           puntuacion += 0;
         }else{
         //Cualquier otra posicion
         puntuacion += 100;
         }}}}//else
        
      }// if(ficha == turnoActual)
    }
  }
  
  return puntuacion;
  }
  
  /**
    * Método que determina el hijo del estado raiz que representará la jugada a realizar.
    */  
  int[][] dondeTirar(boolean turno){
    //SE IMPLEMENTARÁ RERGESANDO DE VACACIONES
    crearArbol(turno);
    List jugadas = arbol.raiz().hijos();
    double[] resultadosminiMax = new double[jugadas.size()];
    int maximo = 0;
    Iterator it = jugadas.iterator();
    for(int i=0;i<jugadas.size();i++){
      //NodoJP nodo = (NodoJP) it.next();
      NodoJP nodo = (NodoJP) jugadas.get(i);
      double auxd = decisionMinimax(nodo,deep,turno);
      resultadosminiMax[i] = auxd;
    }
    double aux = resultadosminiMax[0];
    for(int i=0; i<jugadas.size();i++){
      if(aux < resultadosminiMax[i]){
        aux = resultadosminiMax[i];
        maximo = i;
      }
    }
    NodoJP nodoTiro = (NodoJP) jugadas.get(maximo);
    int[][] tiro = nodoTiro.tablero().tablero();
    return tiro;
  }
  
 /**
  * Este método nos da la represetación numérica del turno.
  */
 public int turno(boolean b){
   return b? 1: 2;
   }
   
/**
* método de valor máximo para minimax
*/
double maxValor(NodoJP nodo, int profundidad, boolean MinMax){
  if(profundidad == 0 || nodo.esHoja(MinMax) ){
    return heuristicaEsquinas(MinMax, nodo.tablero().tablero());
  }
  double valor = Double.NEGATIVE_INFINITY;
  List hijos = nodo.hijos();
  Iterator it = hijos.iterator();
  profundidad = profundidad - 1;
  while(it.hasNext()){
    NodoJP hijo = (NodoJP)it.next();
    valor = Max(valor, minValor(hijo, profundidad, !MinMax));
  }
  return valor;
}

/**
* método de valor minimo para minimax
*/
double minValor(NodoJP nodo, int profundidad, boolean MinMax){
  if(profundidad == 0 || nodo.esHoja(MinMax) ){
    return heuristicaEsquinas(MinMax, nodo.tablero().tablero());
  }
  double valor = Double.POSITIVE_INFINITY;
  List hijos = nodo.hijos();
  Iterator it = hijos.iterator();
  profundidad = profundidad - 1;
  while(it.hasNext()){
    NodoJP hijo = (NodoJP)it.next();
    valor = Min(valor, maxValor(hijo, profundidad, !MinMax));
  }
  return valor;
}

/**
* método que da el valor resultado del minimax
*/
double decisionMinimax(NodoJP nodo, int profundidad, boolean MinMax){
  return maxValor(nodo, profundidad, MinMax);

}

}
