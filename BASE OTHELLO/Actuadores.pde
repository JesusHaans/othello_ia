class Actuadores{
  
  TableroJP tablero;
  public static final  int VACIA = 0;
 
 public Actuadores(TableroJP tablero){
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
 

 void jugarVAr(int x, int y, int turno){
 int patron = 0;
 int[][] tablero = this.tablero.tableroCopia();
 for(int j = y; j < 8; j++){
   if(patron == 0){
     
     tablero[x][j] = turno+4;
     System.out.println("llegue a p0" + "x: " +x + " Y: " + j + " Valor: " + tablero[x][j]);
     patron= 1;
   }else{
     if(patron == 1 && (tablero[x][j] == turno || tablero[x][j] == 0) ){
       System.out.println("llegue a p1 " + "x: " +x + " Y: " + j + " Valor: " + tablero[x][j]);
       return;
     }else{
       if(patron == 1 && (tablero[x][j] == turnoContrario(turno) || tablero[x][j] == turno +4) ){
         
         patron = 2;
         tablero[x][j] = turno+4;
         System.out.println("llegue a p2 " + "x: " +x + " Y: " + j + " Valor: " + tablero[x][j]);
       }else{
         if(patron == 2 && tablero[x][j] == 0){
           System.out.println("llegue a p3 " + "x: " +x + " Y: " + j + " Valor: " + tablero[x][j]);
           return;
         }else{
           if(patron == 2 && tablero[x][j] == turno){
             System.out.println("llegue a p4 " + "x: " +x + " Y: " + j + " Valor: " + tablero[x][j]);
             this.tablero.ponerTablero(tablero);
             //colocar(turno);
             return;
           }
         }
       }
     }
   }
 }
 }
 
  void jugarVAb(int x, int y, int turno){
 int patron = 0;
 int[][] tablero = this.tablero.tableroCopia();
 for(int j = y; j >= 0; j--){
   if(patron == 0){
     
     tablero[x][j] = turno+4;
     System.out.println("llegue a p0" + "x: " +x + " Y: " + j + " Valor: " + tablero[x][j]);
     patron= 1;
   }else{
     if(patron == 1 && (tablero[x][j] == turno || tablero[x][j] == 0) ){
       System.out.println("llegue a p1 " + "x: " +x + " Y: " + j + " Valor: " + tablero[x][j]);
       return;
     }else{
       if(patron == 1 && (tablero[x][j] == turnoContrario(turno) || tablero[x][j] == turno +4)){
         
         patron = 2;
         tablero[x][j] = turno+4;
         System.out.println("llegue a p2 " + "x: " +x + " Y: " + j + " Valor: " + tablero[x][j]);
       }else{
         if(patron == 2 && tablero[x][j] == 0){
           System.out.println("llegue a p3 " + "x: " +x + " Y: " + j + " Valor: " + tablero[x][j]);
           return;
         }else{
           if(patron == 2 && tablero[x][j] == turno){
             System.out.println("llegue a p4 " + "x: " +x + " Y: " + j + " Valor: " + tablero[x][j]);
             this.tablero.ponerTablero(tablero);
             //colocar(turno);
             return;
           }
         }
       }
     }
   }
 }
 }
 
void jugarHI(int x, int y, int turno){
 int patron = 0;
 int[][] tablero = this.tablero.tableroCopia();
 for(int i = x;  i < 8; i++){
   if(patron == 0){
     
     tablero[i][y] = turno+4;
     System.out.println("llegue a p0" + "x: " +i + " Y: " + y + " Valor: " + tablero[i][y]);
     patron= 1;
   }else{
     if(patron == 1 && (tablero[i][y] == turno || tablero[i][y] == 0) ){
       System.out.println("llegue a p1 " + "x: " +i + " Y: " + y + " Valor: " + tablero[i][y]);
       return;
     }else{
       if(patron == 1 && (tablero[i][y] == turnoContrario(turno) || tablero[i][y] == turno +4)){
         
         patron = 2;
         tablero[i][y] = turno+4;
         System.out.println("llegue a p2 " + "x: " +i + " Y: " + y + " Valor: " + tablero[i][y]);
       }else{
         if(patron == 2 && tablero[i][y] == 0){
           System.out.println("llegue a p3 " + "x: " +i + " Y: " + y + " Valor: " + tablero[i][y]);
           return;
         }else{
           if(patron == 2 && tablero[i][y] == turno){
             System.out.println("llegue a p4 " + "x: " +i + " Y: " + y + " Valor: " + tablero[i][y]);
             this.tablero.ponerTablero(tablero);
             //colocar(turno);
             return;
           }
         }
       }
     }
   }
 }
 }
 
 void jugarHD(int x, int y, int turno){
 int patron = 0;
 int[][] tablero = this.tablero.tableroCopia();
 for(int i = x;  i >= 0; i--){
   if(patron == 0){
     
     tablero[i][y] = turno+4;
     System.out.println("llegue a p0" + "x: " +i + " Y: " + y + " Valor: " + tablero[i][y]);
     patron= 1;
   }else{
     if(patron == 1 && (tablero[i][y] == turno || tablero[i][y] == 0) ){
       System.out.println("llegue a p1 " + "x: " +i + " Y: " + y + " Valor: " + tablero[i][y]);
       return;
     }else{
       if(patron == 1 && (tablero[i][y] == turnoContrario(turno) || tablero[i][y] == turno +4)){
         
         patron = 2;
         tablero[i][y] = turno+4;
         System.out.println("llegue a p2 " + "x: " +i + " Y: " + y + " Valor: " + tablero[i][y]);
       }else{
         if(patron == 2 && tablero[i][y] == 0){
           System.out.println("llegue a p3 " + "x: " +i + " Y: " + y + " Valor: " + tablero[i][y]);
           return;
         }else{
           if(patron == 2 && tablero[i][y] == turno){
             System.out.println("llegue a p4 " + "x: " +i + " Y: " + y + " Valor: " + tablero[i][y]);
             this.tablero.ponerTablero(tablero);
             //colocar(turno);
             return;
           }
         }
       }
     }
   }
 }
 }
 
 void jugarDArI(int x, int y, int turno){
 int patron = 0;
 int[][] tablero = this.tablero.tableroCopia();
 int i = x;
 int j = y;
 while(i < 8 && j < 8){
   if(patron == 0){
     
     tablero[i][j] = turno+4;
     System.out.println("llegue a p0" + "x: " +i + " Y: " + j + " Valor: " + tablero[i][j]);
     patron= 1;
   }else{
     if(patron == 1 && (tablero[i][j] == turno || tablero[i][j] == 0) ){
       System.out.println("llegue a p1 " + "x: " +i + " Y: " + j + " Valor: " + tablero[i][j]);
       return;
     }else{
       if(patron == 1 && (tablero[i][j] == turnoContrario(turno) || tablero[i][j] == turno +4)){
         
         patron = 2;
         tablero[i][j] = turno+4;
         System.out.println("llegue a p2 " + "x: " +i + " Y: " +j + " Valor: " + tablero[i][j]);
       }else{
         if(patron == 2 && tablero[i][j] == 0){
           System.out.println("llegue a p3 " + "x: " +i + " Y: " + j + " Valor: " + tablero[i][j]);
           return;
         }else{
           if(patron == 2 && tablero[i][j] == turno){
             System.out.println("llegue a p4 " + "x: " +i + " Y: " + j + " Valor: " + tablero[i][j]);
             this.tablero.ponerTablero(tablero);
             //colocar(turno);
             return;
           }
         }
       }
     }
   }
   i++;
   j++;
 }
 }
 
  
 void jugarDArD(int x, int y, int turno){
 int patron = 0;
 int[][] tablero = this.tablero.tableroCopia();
 int i = x;
 int j = y;
 while(i >=0 && j < 8){
   if(patron == 0){
     
     tablero[i][j] = turno+4;
     System.out.println("llegue a p0" + "x: " +i + " Y: " + j + " Valor: " + tablero[i][j]);
     patron= 1;
   }else{
     if(patron == 1 && (tablero[i][j] == turno || tablero[i][j] == 0) ){
       System.out.println("llegue a p1 " + "x: " +i + " Y: " + j + " Valor: " + tablero[i][j]);
       return;
     }else{
       if(patron == 1 && (tablero[i][j] == turnoContrario(turno)|| tablero[i][j] == turno +4)){
         
         patron = 2;
         tablero[i][j] = turno+4;
         System.out.println("llegue a p2 " + "x: " +i + " Y: " +j + " Valor: " + tablero[i][j]);
       }else{
         if(patron == 2 && tablero[i][j] == 0){
           System.out.println("llegue a p3 " + "x: " +i + " Y: " + j + " Valor: " + tablero[i][j]);
           return;
         }else{
           if(patron == 2 && tablero[i][j] == turno){
             System.out.println("llegue a p4 " + "x: " +i + " Y: " + j + " Valor: " + tablero[i][j]);
             this.tablero.ponerTablero(tablero);
             //colocar(turno);
             return;
           }
         }
       }
     }
   }
   i--;
   j++;
 }
 }
 
  
 void jugarDAbI(int x, int y, int turno){
 int patron = 0;
 int[][] tablero = this.tablero.tableroCopia();
 int i = x;
 int j = y;
 while(i < 8 && j >= 0){
   if(patron == 0){
     
     tablero[i][j] = turno+4;
     System.out.println("llegue a p0" + "x: " +i + " Y: " + j + " Valor: " + tablero[i][j]);
     patron= 1;
   }else{
     if(patron == 1 && (tablero[i][j] == turno || tablero[i][j] == 0) ){
       System.out.println("llegue a p1 " + "x: " +i + " Y: " + j + " Valor: " + tablero[i][j]);
       return;
     }else{
       if(patron == 1 && (tablero[i][j] == turnoContrario(turno) || tablero[i][j] == turno +4)){
         
         patron = 2;
         tablero[i][j] = turno+4;
         System.out.println("llegue a p2 " + "x: " +i + " Y: " +j + " Valor: " + tablero[i][j]);
       }else{
         if(patron == 2 && tablero[i][j] == 0){
           System.out.println("llegue a p3 " + "x: " +i + " Y: " + j + " Valor: " + tablero[i][j]);
           return;
         }else{
           if(patron == 2 && tablero[i][j] == turno){
             System.out.println("llegue a p4 " + "x: " +i + " Y: " + j + " Valor: " + tablero[i][j]);
             this.tablero.ponerTablero(tablero);
             //colocar(turno);
             return;
           }
         }
       }
     }
   }
   i++;
   j--;
 }
 }
 
  
 void jugarDAbD(int x, int y, int turno){
 int patron = 0;
 int[][] tablero = this.tablero.tableroCopia();
 int i = x;
 int j = y;
 while(i >= 0 && j >= 0){
   if(patron == 0){
     
     tablero[i][j] = turno+4;
     System.out.println("llegue a p0" + "x: " +i + " Y: " + j + " Valor: " + tablero[i][j]);
     patron= 1;
   }else{
     if(patron == 1 && (tablero[i][j] == turno || tablero[i][j] == 0) ){
       System.out.println("llegue a p1 " + "x: " +i + " Y: " + j + " Valor: " + tablero[i][j]);
       return;
     }else{
       if(patron == 1 && (tablero[i][j] == turnoContrario(turno) || tablero[i][j] == turno +4)){
         
         patron = 2;
         tablero[i][j] = turno+4;
         System.out.println("llegue a p2 " + "x: " +i + " Y: " +j + " Valor: " + tablero[i][j]);
       }else{
         if(patron == 2 && tablero[i][j] == 0){
           System.out.println("llegue a p3 " + "x: " +i + " Y: " + j + " Valor: " + tablero[i][j]);
           return;
         }else{
           if(patron == 2 && tablero[i][j] == turno){
             System.out.println("llegue a p4 " + "x: " +i + " Y: " + j + " Valor: " + tablero[i][j]);
             this.tablero.ponerTablero(tablero);
             //colocar(turno);
             return;
           }
         }
       }
     }
   }
   i--;
   j--;
 }
 }


 
 void jugar(int x, int y, int turno){
         jugarVAr(x,y,turno);
         jugarVAb(x,y,turno);
         jugarHI(x,y,turno);
         jugarHD(x,y,turno);
         jugarDArI(x,y,turno);
         jugarDArD(x,y,turno);
         jugarDAbI(x,y,turno);
         jugarDAbD(x,y,turno); 
         colocar(turno);
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
