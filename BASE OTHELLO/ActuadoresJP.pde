class ActuadoresJP{
  
  TableroJP tablero;
  public static final  int VACIA = 0;
 
 public ActuadoresJP(TableroJP tablero){
 this.tablero = tablero;
 }
 
 int turnoContrario(int turno){
 return turno == 1 ? 2: 1;
 }
 
 void colocar(int turno){
  for(int i = 0; i < 8 ; i++){
     for(int j = 0; j < 8; j++){
       if(tablero.ficha(i,j) == turno +4){
         tablero.ponerFicha(i,j,turno);
       }
     }
   } 
 }
 
 boolean verificarVAr(int x, int y, int turno){
  boolean verificacion = true;
  for(int j = y + 1; j < 8; j++){
    verificacion = verificacion && tablero.ficha(x,j) == turnoContrario(turno);
    if(!verificacion) return (tablero.ficha(x,j) == 0) || (tablero.ficha(x,j) == turno + 2) ? false : true;
  }
  return false;
 }
 
 void jugarVAr(int x, int y, int turno){
   if(verificarVAr(x,y,turno)){
    for(int j = y + 1; j < 8; j++){
      if( tablero.ficha(x,j) == turno) return;
      if(tablero.ficha(x,j) == turnoContrario(turno)){
        tablero.ponerFicha(x,j, turno);
      }
    }
  }
 }
 
  boolean verificarVAb(int x, int y, int turno){
  boolean verificacion = true;
  for(int j = y - 1; j >= 0; j--){
    verificacion = verificacion && tablero.ficha(x,j) == turnoContrario(turno);
    if(!verificacion) return (tablero.ficha(x,j) == 0) || (tablero.ficha(x,j) == turno + 2) ? false : true;
  }
  return false;
 }
 
 void jugarVAb(int x, int y, int turno){
   if(verificarVAb(x,y,turno)){
    for(int j = y - 1; j >=0; j--){
      if( tablero.ficha(x,j) == turno) return;
      if(tablero.ficha(x,j) == turnoContrario(turno)){
        tablero.ponerFicha(x,j, turno);
      }
    }
  }
 }
 
  boolean verificarHI(int x, int y, int turno){
  boolean verificacion = true;
  for(int i = x + 1;  i < 8; i++){
    verificacion = verificacion && tablero.ficha(i,y) == turnoContrario(turno);
    if(!verificacion) return (tablero.ficha(i,y) == 0) || (tablero.ficha(i,y) == turno + 2) ? false : true;
  }
  return false;
 }
 
 void jugarHI(int x, int y, int turno){
   if(verificarHI(x,y,turno)){
    for(int i = x + 1;  i < 8; i++){
      if( tablero.ficha(i,y) == turno) return;
      if(tablero.ficha(i,y) == turnoContrario(turno)){
        tablero.ponerFicha(i,y, turno);
      }
    }
  }
 }
 
   boolean verificarHD(int x, int y, int turno){
  boolean verificacion = true;
  for(int i = x - 1;  i >= 0; i--){
    verificacion = verificacion && tablero.ficha(i,y) == turnoContrario(turno);
    if(!verificacion) return (tablero.ficha(i,y) == 0) || (tablero.ficha(i,y) == turno + 2) ? false : true;
  }
  return false;
 }
 
 void jugarHD(int x, int y, int turno){
   if(verificarHD(x,y,turno)){
    for(int i = x - 1;  i >= 0; i--){
      if( tablero.ficha(i,y) == turno) return;
      if(tablero.ficha(i,y) == turnoContrario(turno)){
        tablero.ponerFicha(i,y, turno);
      }
    }
  }
 }
 
 boolean verificarDArI(int x, int y, int turno){
  boolean verificacion = true;
  int i = x + 1;
  int j = y + 1;
   while(i < 8 && j < 8){
    verificacion = verificacion && tablero.ficha(i,j) == turnoContrario(turno);
    if(!verificacion) return (tablero.ficha(i,j) == 0) || (tablero.ficha(i,j) == turno + 2) ? false : true;
    i++;
    j++;
  }
  return false;
 }
 
 void jugarDArI(int x, int y, int turno){
   if(verificarDArI(x,y,turno)){
    int i = x + 1;
    int j = y + 1;
    while(i < 8 && j < 8){
      if( tablero.ficha(i,j) == turno) return;
      if(tablero.ficha(i,j) == turnoContrario(turno)){
        tablero.ponerFicha(i,j, turno);
      }
      i++;
      j++;
    }
  }
 }
 
 boolean verificarDArD(int x, int y, int turno){
  boolean verificacion = true;
  int i = x - 1;
  int j = y + 1;
   while(i >= 0 && j < 8){
    verificacion = verificacion && tablero.ficha(i,j) == turnoContrario(turno);
    if(!verificacion) return (tablero.ficha(i,j) == 0) || (tablero.ficha(i,j) == turno + 2) ? false : true;
    i--;
    j++;
  }
  return false;
 }
 
 void jugarDArD(int x, int y, int turno){
   if(verificarDArD(x,y,turno)){
    int i = x - 1;
    int j = y + 1;
    while(i >= 0 && j < 8){
      if( tablero.ficha(i,j) == turno) return;
      if(tablero.ficha(i,j) == turnoContrario(turno)){
        tablero.ponerFicha(i,j, turno);
      }
      i--;
      j++;
    }
  }
 }

  boolean verificarDAbI(int x, int y, int turno){
  boolean verificacion = true;
  int i = x + 1;
  int j = y - 1;
   while(i < 8 && j >= 0){
    verificacion = verificacion && tablero.ficha(i,j) == turnoContrario(turno);
    if(!verificacion) return (tablero.ficha(i,j) == 0) || (tablero.ficha(i,j) == turno + 2) ? false : true;
    i++;
    j--;
  }
  return false;
 }
 
 void jugarDAbI(int x, int y, int turno){
   if(verificarDAbI(x,y,turno)){
    int i = x + 1;
    int j = y - 1;
    while(i < 8 && j >= 0){
      if( tablero.ficha(i,j) == turno) return;
      if(tablero.ficha(i,j) == turnoContrario(turno)){
        tablero.ponerFicha(i,j, turno);
      }
      i++;
      j--;
    }
  }
 }
 
 boolean verificarDAbD(int x, int y, int turno){
  boolean verificacion = true;
  int i = x - 1;
  int j = y - 1;
   while(i >= 0 && j >= 0){
    verificacion = verificacion && tablero.ficha(i,j) == turnoContrario(turno);
    if(!verificacion) return (tablero.ficha(i,j) == 0) || (tablero.ficha(i,j) == turno + 2) ? false : true;
    i--;
    j--;
  }
  return false;
 }
 
 void jugarDAbD(int x, int y, int turno){
   if(verificarDAbD(x,y,turno)){
    int i = x - 1;
    int j = y - 1;
    while(i >= 0 && j >= 0){
      if( tablero.ficha(i,j) == turno) return;
      if(tablero.ficha(i,j) == turnoContrario(turno)){
        tablero.ponerFicha(i,j, turno);
      }
      i--;
      j--;
    }
  }
 }
 
  
 

 
 boolean jugar(int x, int y, int turno){
     if(tablero.ficha(x,y) == 3 || tablero.ficha(x,y) == 4){
         jugarVAr(x,y,turno);
         jugarVAb(x,y,turno);
         jugarHI(x,y,turno);
         jugarHD(x,y,turno);
         jugarDArI(x,y,turno);
         jugarDArD(x,y,turno);
         jugarDAbI(x,y,turno);
         jugarDAbD(x,y,turno); 
         tablero.ponerFicha(x,y, turno);
         colocar(turno);
         return true;
     }else{
       return false;
     }
 }
 void limpiarTablero(){
   for(int i = 0; i < 8; i++){
     for(int j = 0; j < 8; j++){
       if(tablero.ficha(i,j) == 3 || tablero.ficha(i,j) == 4){
         tablero.poner(i,j,0);
       }
     }
   }
 }
 
 
}
