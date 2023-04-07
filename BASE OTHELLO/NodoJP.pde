import java.util.List;
import java.util.ArrayList;

class NodoJP{
  private NodoJP padre;
  private List hijos;
  private TableroJP tablero;
  
  public NodoJP(NodoJP padre, List hijos, TableroJP tablero){
    this.padre = padre;
    this.hijos = hijos;
    this.tablero = tablero;
  }
  
  public NodoJP(NodoJP padre, TableroJP tablero){
    this.padre = padre;
    this.hijos = new ArrayList();
    this.tablero = tablero;
  }
  
  public boolean esRaiz(){
   return this.padre == null; 
  }
  
  public boolean esHoja(){
   return this.hijos.size() == 0; 
  }
  
  public NodoJP padre(){
    return this.padre;
  }
  
  public List hijos(){
    return this.hijos;
  }
  
  public TableroJP tablero(){
    return this.tablero;
  }
  
  public void padre(NodoJP padre){
    this.padre = padre;
  }
  
  public void tablero(TableroJP tablero){
    this.tablero = tablero;
  }
  
  public void agregarHijo(NodoJP hijo){
   this.hijos.add(hijo); 
  }
  
  public void quitarHijo(NodoJP hijo){
   this.hijos.remove(hijo); 
  }
  

}
