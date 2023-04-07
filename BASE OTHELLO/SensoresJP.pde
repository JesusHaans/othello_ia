class SensoresJP{
  
  TableroJP tablero;
  public static final  int VACIA = 0;
 
 public SensoresJP(TableroJP tablero){
 this.tablero = tablero;
 }
 
 int turnoContrario(int turno){
 return turno == 1 ? 2: 1;
 }
 
 int puntajeN(){
   int puntos = 0;
  for(int i = 0; i < 8 ; i++){
    for(int j = 0; j < 8; j++){
      if(tablero.ficha(i,j) == 1) puntos++;
    }
  }
  return puntos;
 }
 
 int puntajeB(){
   int puntos = 0;
  for(int i = 0; i < 8 ; i++){
    for(int j = 0; j < 8; j++){
      if(tablero.ficha(i,j) == 2) puntos++;
    }
  }
  return puntos;
 }
 
 void jugadaVAr(int x, int y, int turno){
 int patron = turno;
 for(int i = y; i >= 0 ; i--){
   if(patron == turno && tablero.ficha(x,i) == turnoContrario(turno)){
     patron = turnoContrario(turno);
   }else{
     if(patron == turnoContrario(turno) && tablero.ficha(x,i) == VACIA){
       patron = 0;
       tablero.poner(x,i,turno + 2);
       return;
     }else{
       if(tablero.ficha(x,i) == turno && patron != turno){
         return;
       }else{
         if(patron != tablero.ficha(x,i)) patron = -1;
       }
     }
   }
 }
 }
 
 void jugadaVAb(int x, int y, int turno){
 int patron = turno;
 for(int i = y; i < 8 ; i++){
   if(patron == turno && tablero.ficha(x,i) == turnoContrario(turno)){
     patron = turnoContrario(turno);
   }else{
     if(patron == turnoContrario(turno) && tablero.ficha(x,i) == VACIA){
       patron = 0;
       tablero.poner(x,i,turno + 2);
       return;
     }else{
       if(tablero.ficha(x,i) == turno && patron != turno){
         return;
       }else{
         if(patron != tablero.ficha(x,i)) patron = -1;
       }
     }
   }
 }
 }
 
 void jugadaHI(int x, int y, int turno){
 int patron = turno;
 for(int i = x; i >= 0 ; i--){
   if(patron == turno && tablero.ficha(i,y) == turnoContrario(turno)){
     patron = turnoContrario(turno);
   }else{
     if(patron == turnoContrario(turno) && tablero.ficha(i,y) == VACIA){
       patron = 0;
       tablero.poner(i,y,turno + 2);
       return;
     }else{
       if(tablero.ficha(i,y) == turno && patron != turno){
         return;
       }else{
         if(patron != tablero.ficha(i,y)) patron = -1;
       }
     }
   }
 }
 }
 
 void jugadaHD(int x, int y, int turno){
 int patron = turno;
 for(int i = x; i < 8 ; i++){
   if(patron == turno && tablero.ficha(i,y) == turnoContrario(turno)){
     patron = turnoContrario(turno);
   }else{
     if(patron == turnoContrario(turno) && tablero.ficha(i,y) == VACIA){
       patron = 0;
       tablero.poner(i,y,turno + 2);
       return;
     }else{
       if(tablero.ficha(i,y) == turno && patron != turno){
         return;
       }else{
         if(patron != tablero.ficha(i,y)) patron = -1;
       }
     }
   }
 }
 }
 
 void jugadaDArI(int x, int y, int turno){
 int patron = turno;
 int i = x;
 int j = y;
 while(i >= 0 && j >= 0){
   if(patron == turno && tablero.ficha(i,j) == turnoContrario(turno)){
     patron = turnoContrario(turno);
   }else{
     if(patron == turnoContrario(turno) && tablero.ficha(i,j) == VACIA){
       patron = 0;
       tablero.poner(i,j,turno + 2);
       return;
     }else{
       if(tablero.ficha(i,j) == turno && patron != turno){
         return;
       }else{
         if(patron != tablero.ficha(i,j)) patron = -1;
       }
     }
   }
   i--;
   j--;
 }
 }
 
 void jugadaDArD(int x, int y, int turno){
 int patron = turno;
 int i = x;
 int j = y;
 while(i < 8 && j >= 0){
   if(patron == turno && tablero.ficha(i,j) == turnoContrario(turno)){
     patron = turnoContrario(turno);
   }else{
     if(patron == turnoContrario(turno) && tablero.ficha(i,j) == VACIA){
       patron = 0;
       tablero.poner(i,j,turno + 2);
       return;
     }else{
       if(tablero.ficha(i,j) == turno && patron != turno){
         return;
       }else{
         if(patron != tablero.ficha(i,j)) patron = -1;
       }
     }
   }
   i++;
   j--;
 }
 }
 
 void jugadaDAbI(int x, int y, int turno){
 int patron = turno;
 int i = x;
 int j = y;
 while(i >= 0 && j < 8){
   if(patron == turno && tablero.ficha(i,j) == turnoContrario(turno)){
     patron = turnoContrario(turno);
   }else{
     if(patron == turnoContrario(turno) && tablero.ficha(i,j) == VACIA){
       patron = 0;
       tablero.poner(i,j,turno + 2);
       return;
     }else{
       if(tablero.ficha(i,j) == turno && patron != turno){
         return;
       }else{
         if(patron != tablero.ficha(i,j)) patron = -1;
       }
     }
   }
   i--;
   j++;
 }
 }
 
  void jugadaDAbD(int x, int y, int turno){
 int patron = turno;
 int i = x;
 int j = y;
 while(i < 8 && j < 8){
   if(patron == turno && tablero.ficha(i,j) == turnoContrario(turno)){
     patron = turnoContrario(turno);
   }else{
     if(patron == turnoContrario(turno) && tablero.ficha(i,j) == VACIA){
       patron = 0;
       tablero.poner(i,j,turno + 2);
       return;
     }else{
       if(tablero.ficha(i,j) == turno && patron != turno){
         return;
       }else{
         if(patron != tablero.ficha(i,j)) patron = -1;
       }
     }
   }
   i++;
   j++;
 }
 }
 
 void posiblesJugadas(int turno){
   for(int i = 0; i < 8; i++){
     for(int j = 0; j < 8; j++){
       if(tablero.ficha(i,j) == turno){
         jugadaVAr(i,j,turno);
         jugadaVAb(i,j,turno);
         jugadaHI(i,j,turno);
         jugadaHD(i,j,turno);
         jugadaDArI(i,j,turno);
         jugadaDArD(i,j,turno);
         jugadaDAbI(i,j,turno);
         jugadaDAbD(i,j,turno);
       }
     }
   }
 }
 
 int numPosiblesJugadas(int turno){
   int c = 0;
   for(int i = 0; i < 8; i++){
     for(int j = 0; j < 8; j++){
       if(tablero.ficha(i,j) == turno + 2){
         c++;
       }
     }
   }
   return c;
 }
}
