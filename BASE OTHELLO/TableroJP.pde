class TableroJP{
  
  int[][] tablero = new int[8][8];
  public static final  int VACIA = 0;
  
 void display(){

   createBoard(); 
 }
 
 void createBoard(){
   for(int i=0;i<8;i++){
     for(int j=0;j<8;j++){
       fill(15,240,0);
       stroke(0);
       strokeWeight(2);
       rect(i*40,j*40,40,40);
       if(tablero[i][j]!=0){
         if(tablero[i][j] ==1){
           noStroke();
           fill(0);
         }else if(tablero[i][j]==2){
           noStroke();
           fill(255);
         }else if(tablero[i][j] % 2 == 1){ // si es una posible jugada
           noStroke();
           fill(41, 105, 12);
         }else if(tablero[i][j]% 2 ==0){ // si es una posible jugada
           noStroke();
           fill(155, 255, 108);
         }
         ellipse(i*40+20,j*40+20,30,30);
       }
       
     }
   }
 }
 
 public int[][] tablero(){
 return this.tablero;
 }
 
 public void poner(int x, int y , int valor){
   tablero[x][y] = valor;
 }
 
 public int ficha(int x, int y){
   return tablero[x][y];
 }
  void ponerFicha(int x, int y, int turno){
   tablero[x][y] = turno;
 }
 
 
 
 
}
