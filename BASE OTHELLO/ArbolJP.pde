import java.util.List;
import java.util.ArrayList;

class ArbolJP{
  private NodoJP raiz;
  
  public ArbolJP(NodoJP raiz){
  this.raiz = raiz;
  }
  
  public NodoJP raiz(){
    return this.raiz;
  }
  
  public void raiz(NodoJP raiz){
    this.raiz = raiz;
  }

}
