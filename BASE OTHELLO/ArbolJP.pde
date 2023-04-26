import java.util.List;
import java.util.ArrayList;

class ArbolJP{
  private NodoJP raiz;
  
  //Constructor
  public ArbolJP(NodoJP raiz){
  this.raiz = raiz;
  }
    
 /**
  * Este método regresa la raíz del árbol.
  */
  public NodoJP raiz(){
    return this.raiz;
  }
  
  /**
  * Este método cambia la raíz del árbol.
  */
  public void raiz(NodoJP raiz){
    this.raiz = raiz;
  }

}
