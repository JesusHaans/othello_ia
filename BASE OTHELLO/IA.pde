class IA{

  //Variables locales 
  String nombre = "IA";   //Nombre de la IA
  boolean turno;          //Turno que juega la IA
  int[][] mundo;          //Tablero actual
  Tablero tab;            //Ejemplar de tablero para las funciones necesarias
  //int deep = 2;         //Profundidad del árbbol.
  //double heuristica = Double.POSITIVE_INFINITY; //Valor heurístico iinicial.
  
  //Constructor para la Inteligencia
  IA(int[][] mundo, Tablero tab, int deep, String nom){
    //Implementar
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
    //Implementar
  }
  
  /**
   * Método que construye el árbol de estados
   * Deberán usar aquí su implementación de árboles.
   */
  void crearArbol(boolean turn){
    //IMPLEMENTAR
  }
  
  /**
   * Método que inicializa el árbol
   * Deberán usar aquí su implementación de árboles.
   */
  void iniciarArbol(){
    //IMPLEMENTAR
  }

  /**
   * Método que crea todas las ramas del árbol
   */
  void crearRamas(/**Usar nodo del arbol como parámetro, */ int profun, boolean turn){    
    //IMPLEMENTAR      
  }  
  
  double minimax(Nodo nodo, int profundidad, boolean MinMax) {        
    //SE IMPLEMENTARÁ REGRESANDO DE VACACIONES NO SE PREOCUPEN
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
   
}