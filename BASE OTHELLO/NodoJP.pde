 import java.util.List;
import java.util.ArrayList;

class NodoJP{
  private NodoJP padre;
  private List hijos;
  private TableroJP tablero;
  
  //Constructor
  public NodoJP(NodoJP padre, List hijos, TableroJP tablero){
    this.padre = padre;
    this.hijos = hijos;
    this.tablero = tablero;
  }
  //constructor
  public NodoJP(NodoJP padre, TableroJP tablero){
    this.padre = padre;
    this.hijos = new ArrayList();
    this.tablero = tablero;
  }
  
  /**
   * Este método nos dice si el nodo es raíz
   */
  public boolean esRaiz(){
   return this.padre == null; 
  }
  
  /**
   * Este método nos dice si el nodo es una hoja (no tiene hijos)
   */
  public boolean esHoja(){
   return this.hijos.size() == 0; 
  }
  
  /**
  * Este método nos dice si el nodo es una hoja (No puede tener hijos)
  */
  public boolean esHoja(boolean turno){
    SensoresJP sensor = new SensoresJP(tablero);
    return turno? sensor.numPosiblesJugadas(1) == 0 : sensor.numPosiblesJugadas(1) == 0; 
  }
  
  /**
  * Este método nos dice cuál es el padre del nodo
  */ 
  public NodoJP padre(){
    return this.padre;
  }
  
  /**
  * Este método nos da cuáles son los hijos del nodo
  */
  public List hijos(){
    return this.hijos;
  }
  
  /**
  * Este método nos regresa el tablero del nodo 
  */
  public TableroJP tablero(){
    return this.tablero;
  }

  /**
  * Este método asigna un padre al nodo
  */
  public void padre(NodoJP padre){
    this.padre = padre;
  }

 /**
  * Este método asigna un tablero al nodo 
  */
  public void tablero(TableroJP tablero){
    this.tablero = tablero;
  }
  
  /**
  * Este método agrega un hijo al nodo
  */ 
  public void agregarHijo(NodoJP hijo){
   this.hijos.add(hijo); 
  }
  
  /**
  * Este método quita un hijo dado al nodo.
  */
  public void quitarHijo(NodoJP hijo){
   this.hijos.remove(hijo); 
  }
  

}
