class IA{

  //Variables locales 
  String nombre = "IA";   //Nombre de la IA
  boolean turno;          //Turno que juega la IA
  int[][] mundo;          //Tablero actual
  TableroJP tablero;            //Ejemplar de tablero para las funciones necesarias
  int deep = 2;         //Profundidad del árbbol.
  //double heuristica = Double.POSITIVE_INFINITY; //Valor heurístico iinicial.
  ArbolJP arbol;
  SensoresJP sensor;
  ActuadoresJP actuador;
  
  //Constructor para la Inteligencia
  IA(int[][] mundo, TableroJP tab, int deep, String nom){
    //Implementar
    this.mundo = mundo;
    this.tablero = tab;
    this.tablero.ponerTablero(copyMatrix(this.mundo));
    sensor = new SensoresJP(this.tablero);
    actuador = new ActuadoresJP(this.tablero);
    this.deep = deep;
    this.nombre = nom;
  }
  
  /**
   * Método para realizar una tirada automática
   * Recibe una matriz del tablero actual y el turno que le toca jugar.
   * Devuelve una matriz del tablero con la jugada realizada.
   */
  int[][] realizarJugada(int[][] mundo, boolean turn){
    //Implementar
    //Crear arbol
    return mundo;
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
    tablero.ponerTablero(world);
    sensor.posiblesJugadas(turno(turn));
    
  }
  
  /**
   * Método que construye el árbol de estados
   * Deberán usar aquí su implementación de árboles.
   */
  void crearArbol(boolean turn){
    iniciarArbol();
    crearRamas(arbol.raiz(), deep, turno);
    
  }
  
  /**
   * Método que inicializa el árbol
   * Deberán usar aquí su implementación de árboles.
   */
  void iniciarArbol(){
    buscarJugadas(copyMatrix(mundo), turno );
    arbol = new ArbolJP(new NodoJP(null, new TableroJP(copyMatrix(tablero.tablero()))));
  }

  /**
   * Método que crea todas las ramas del árbol
   */
  void crearRamas(NodoJP nodo, int profun, boolean turn){   
    if(profun > 0){
      for(int i = 0; i<8; i++){
        for(int j = 0; j<8; j++){
          if(nodo.tablero().ficha(i,j) == turno(turn) + 2){
            actuador.jugar(i, j, turno(turn));
            TableroJP tableroHijo = new TableroJP(copyMatrix(tablero.tablero()));
            NodoJP hijo = new NodoJP(nodo, tableroHijo );
            nodo.agregarHijo(hijo);
            tablero.ponerTablero(nodo.tablero().tablero());//ponemos el papa en nuestro tablero global
            buscarJugadas(tablero.tablero(), turn);
          }
        }
      }
      for(int i = 0; i < nodo.hijos().size(); i++){
        NodoJP hijo = (NodoJP) nodo.hijos().get(i);
        tablero.ponerTablero(hijo.tablero().tablero());
        buscarJugadas(tablero.tablero(), turn);
        crearRamas(hijo, profun - 1, !turn);
      }
    }
  }  
  
  double minimax(NodoJP nodo, int profundidad, boolean MinMax) {        
    //SE IMPLEMENTARÁ REGRESANDO DE VACACIONES NO SE PREOCUPEN
    return 0.0;
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
    return 0;
  } 

  /**
    * Método que determina el minino entre dos flotantes.
    */
  double Min(double uno, double dos) {
    //SE IMPLEMENTARÁ RERGESANDO DE VACACIONES
    return 0;
  }

  /**
    * Método que determina el valor heurístico de un tablero.
    */    
  double valorHeuri(int[][] tablero, boolean turn){
    //SE IMPLEMENTARÁ RERGESANDO DE VACACIONES
    return 0;
  } 
  
  /**
    * Método que determina el hijo del estado raiz que representará la jugada a realizar.
    */  
  int[][] dondeTirar(){
    //SE IMPLEMENTARÁ RERGESANDO DE VACACIONES
    return null;
  }
  
     public int turno(boolean b){
   return b? 1: 2;
   }
   
}
