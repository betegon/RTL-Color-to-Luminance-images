#include "typeDefinition.h"
#include "stdlib.h"

void sobel(memGray imgGray[MEMGRAYSIZE],memGray imgEdges[MEMGRAYSIZE], short width, short height, unsigned int threshold) {

	int Gx[3][3]={{-1,0,1},{-2,0,2},{-1,0,1}};
	int Gy[3][3]={{-1,-2,-1},{0,0,0},{1,2,1}};
	int i,j;
	short fila;
	short col;
	int Gradx,Grady;
	int Grad;
	
	lazoprincipal: for(fila=0;fila<height;fila++) {
	#pragma HLS LOOP_TRIPCOUNT min=100 max=140 avg=120
		lazoanidado: for(col=0; col<width; col++) {
		#pragma HLS LOOP_TRIPCOUNT min=160 max=200 avg=176
	
		   if(fila==0 || fila==height-1 || col==0 || col==width-1){
			 Grad= 0;
		   }
			else{
				Gradx=0;
				Grady=0;
				lazoanidado2: for(i=0;i<3;i++){
				#pragma HLS PIPELINE
					lazoanidado3: for(j=0;j<3;j++){
					#pragma HLS PIPELINE
							Gradx+=leePixelGray(imgGray,col+i-1,fila+j-1,width)*Gx[i][j];
							Grady+=leePixelGray(imgGray,col+i-1,fila+j-1,width)*Gy[i][j];
						}
					}
				 Grad = abs(Gradx) + abs(Grady);
			 }
					 if(Grad<threshold){
					   escribePixelGray(0,imgEdges,col,fila,width);
					  }
					 else{
					   escribePixelGray(255,imgEdges,col,fila,width);
					 }
			 }
	 }
}
