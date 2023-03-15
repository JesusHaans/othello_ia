class TableroJP{
  
  int[][] tablero = new int[8][8];
  
 void display(){
   tablero[3][3]=1;
   tablero[3][4]=2;
   tablero[4][3]=2;
   tablero[4][4]=1;
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
           fill(0);
         }else if(tablero[i][j]==2){
           fill(255);
         }
         ellipse(i*40+20,j*40+20,30,30);
       }
       
     }
   }
 }
 
}
